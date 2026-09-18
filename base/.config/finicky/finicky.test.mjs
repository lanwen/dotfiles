// Run: node ~/.config/finicky.test.mjs
import assert from "node:assert/strict";
import config from "./finicky.ts";

// Finicky's case-sensitive, whole-URL glob semantics for the literal/* patterns
// used here, including its optional protocol prefix for bare-domain patterns.
function matches(match, url, options) {
  if (Array.isArray(match)) return match.some((item) => matches(item, url, options));
  if (typeof match === "function") return match(url, options);
  if (!match.includes("*")) return match === url.href;
  const pattern = match.split("*").map((part) =>
    part.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
  ).join(".*?");
  const prefix = !/^\w+:/.test(match) && !match.startsWith("*")
    ? "(?:https?:|ftp:|mailto:|file:|tel:|sms:|data:)?(?://)?" : "";
  return new RegExp(`^${prefix}${pattern}$`).test(url.href);
}

const cases = [
  ["https://github.com/docker/cli", "cP89VZaw.Profile 1"],
  ["https://github.com/AtomicJar/testcontainers-cloud", "cP89VZaw.Profile 1"],
  ["https://github.com/docker", "cP89VZaw.Profile 1"],
  ["https://github.com/AtomicJar", "cP89VZaw.Profile 1"],
  ["https://github.com/DOCKER", "to65ryds.default-release"],
  ["https://github.com/atomicjar/repo", "to65ryds.default-release"],
  ["https://github.com/lanwen", "to65ryds.default-release"],
  ["https://github.com/docker-other/repo", "to65ryds.default-release"],
  ["https://github.com/", "to65ryds.default-release"],
  ["https://grafana.com/", "cP89VZaw.Profile 1"],
  ["https://team.grafana.com/dashboard", "cP89VZaw.Profile 1"],
  ["https://okta.com/", "cP89VZaw.Profile 1"],
  ["https://company.okta.com/login", "cP89VZaw.Profile 1"],
  ["https://notokta.com/", null],
  ["https://grafana.com.example.org/", null],
  ["https://github.com.example.org/docker/cli", null],
  ["https://example.org/?next=https://github.com/docker/cli", null],
];
for (const [href, directory] of cases) {
  const url = new URL(href);
  // GitHub rules must also win over the pre-existing Slack rule.
  const options = { opener: directory ? { name: "Slack" } : null };
  const handler = config.handlers.find((handler) => matches(handler.match, url, options));
  if (directory) {
    const browser = handler.browser(url, options);
    assert.equal(browser.name, "/Applications/Firefox.app");
    assert.deepEqual(browser.args, [
      "-n", "--args", "--profile",
      `/Users/lanwen/Library/Application Support/Firefox/Profiles/${directory}`,
      "--new-tab", url.href,
    ], href);
  } else {
    assert.equal(handler, undefined, href);
  }
}
const slackRule = config.handlers.at(-1);
assert.equal(slackRule.match(new URL("https://example.org"), { opener: null }), false);
const slackUrl = new URL("https://example.org/");
const slackOptions = { opener: { name: "Slack" } };
assert.equal(config.handlers.find((handler) => matches(handler.match, slackUrl, slackOptions)), slackRule);
assert.equal(slackRule.browser(slackUrl, slackOptions).args[3],
  "/Users/lanwen/Library/Application Support/Firefox/Profiles/cP89VZaw.Profile 1");
console.log(`Passed ${cases.length} routing checks.`);
