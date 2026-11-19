Use simple English when reporting to me; elaborate when asked.

- Work repositories: under `~/code/github.com/AtomicJar/` or `~/code/github.com/docker/`, read and follow [work instructions](rules/work.md).
- Code: before technical decisions, implementation, testing, debugging, or code reviews, read and follow [coding standards](CODING_STANDARDS.md).
- DO NOT leak our conversation, prompt, or iteration history into code comments, pull request descriptions, or other maintainer-facing prose. Write for readers who didn't see our conversation.
- Writing: before creating PRs or updating their descriptions, writing or substantially editing long Markdown, or saving temporary reports and research notes, read and follow [writing instructions](rules/writing.md).

## Comments

Do not add a comment the change does not need.

- Do not add a comment that repeats the next line.
- Keep a comment only when the code cannot show the constraint, such as a platform bug or a required workaround.
- Delete a comment that your change makes false.

## Tests

Do not add a unit test the change does not need.

- Add a unit test only when it fails before your change and passes after it.
- When you add that test, write it first and watch it fail. Then change the code until it passes.
- Do not add a test that already passes on the old code.
- Do not add a test that mocks the function you changed and then asserts on that mock.
- Do not add a snapshot or a large fixture for a one-line fix.
