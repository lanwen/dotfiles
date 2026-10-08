# Writing instructions

## Pull requests

Use `$visual-pr` when creating a PR or updating its description, including each PR in a stack.
When multiple PRs depend on one another or require a merge order, use the `github/gh-stack` extension for stacked PRs.
Perform relevant verification, including tests, formatting, linting, and diff checks.
In PR descriptions, mention verification only when there is a meaningful non-routine result.

## Long Markdown files

When writing or substantially editing long Markdown files, put each complete sentence on its own line.
Preserve normal Markdown structure.

## Temporary reports and research notes

Save temporary reports, research, and other Markdown notes that would otherwise go in `/private/tmp/` or `docs/research/` to `~/obsidian/work/Research/<repository-name>/<YYYY-MM-DD>/`.
Derive `<repository-name>` from the repository root directory and use the local date for `<YYYY-MM-DD>`.
Create the date directory when needed.
Use the repository or `/private/tmp/` for these notes only when the user explicitly requests that location.
