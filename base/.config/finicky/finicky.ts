import type {
  BrowserResolver,
  FinickyConfig,
} from "/Applications/Finicky.app/Contents/Resources/finicky.d.ts";

// Use profile paths: Finicky 4.2.2 only resolves names from legacy profiles.ini.
const firefoxProfile = (directory: string): BrowserResolver => (url) => ({
  name: "/Applications/Firefox.app",
  appType: "path",
  args: [
    "-n",
    "--args",
    "--profile",
    `/Users/lanwen/Library/Application Support/Firefox/Profiles/${directory}`,
    "--new-tab",
    url.href,
  ],
});

const workFirefox = firefoxProfile("cP89VZaw.Profile 1");
const originalFirefox = firefoxProfile("to65ryds.default-release");

export default {
  defaultBrowser: originalFirefox,
  options: {
    checkForUpdates: false,
  },
  handlers: [
    // Every link opened from Zoom uses Work, before URL-specific rules.
    {
      match: (_url: URL, { opener }) =>
        opener?.bundleId === "us.zoom.xos" || /zoom/i.test(opener?.name ?? ""),
      browser: workFirefox,
    },
    // Work links. Finicky globs are case-sensitive.
    {
      match: [
        "https://github.com/docker",
        "http://github.com/docker",
        "github.com/docker/*",
        "https://github.com/AtomicJar",
        "http://github.com/AtomicJar",
        "github.com/AtomicJar/*",
      ],
      browser: workFirefox,
    },
    {
      match: [
        "claude.ai/*",
        "grafana.com/*",
        "*.grafana.com/*",
        "*.notion.com/*",
        "*.notion.so/*",
      ],
      browser: workFirefox,
    },
    {
      match: [
        "okta.com/*",
        "*.okta.com/*",
      ],
      browser: workFirefox,
    },

    {
      match: [
        "docker.atlassian.net/*",
      ],
      browser: workFirefox,
    },

    // Other GitHub links use the original profile, even when opened from Slack.
    {
      match: [
        "github.com/*",
      ],
      browser: originalFirefox,
    },

    {
      match: (url: URL, { opener }) => {
        console.log("opener", opener);
        return opener?.name.includes("Slack") || false;
      },
      browser: workFirefox,
    },
  ],
} satisfies FinickyConfig;
