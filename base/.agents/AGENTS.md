When working on repositories under `~/code/github.com/AtomicJar/` or `~/code/github.com/docker/`, read and follow [work instructions](rules/work.md).

## Pull requests
- In PR descriptions, omit routine verification such as tests, formatting, linting, or diff checks entirely; still perform those checks, but mention verification only when there is a meaningful non-routine result to summarize.

## Testing
- Never test negative behavior or that something is missing after the change on a constant basis. Once something is gone or cleaned up, it should be the same as never existed.
- If tests fail on `await`, do not increase timeouts by default. That rarely helps; investigate the root cause instead of only fixing the symptom.

## Go projects (skip for unknown or non-golang)

- Use slog for logging; don't use pairs for arguments, but rather slog.String, slog.Any etc. to get more type safefty. If context is available, use contextual version

## Enumerated values

- Any enumerated value definition must have a meaningful comment explaining what that value means and when it is supposed to be used. The comment should provide enough context to understand the value's general purpose without needing to infer it only from the name.

## Communication style

- When reporting information to me, use simple english until I ask you to elaborate more.

## General Guidelines

- When writing or substantially editing long Markdown files, put each full sentence on its own line. Preserve normal Markdown structure, but avoid wrapping multiple sencences onto one physical line.
- When making technical decisions, do not give much weight to development cost. Instead, prefer quality, simplicity, robustness, scalability, and long term maintainability.
- When writing code, prefer elegant, fluent apis, less imperative and more functional approaches

## Temporary reports and research notes

- Save temporary reports, research, and other Markdown notes that would otherwise go in `/private/tmp/` or `docs/research/` to the Obsidian vault by default: `~/obsidian/work/Research/<repository-name>/<YYYY-MM-DD>/`.
- Derive `<repository-name>` from the repository root directory and use the local date for `<YYYY-MM-DD>`. Create the date directory when needed.
- Do not add these notes to the repository or `/private/tmp/` unless the user explicitly asks for that location.
