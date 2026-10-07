# Coding standards

## Design

Prioritize simplicity, robustness, scalability, and long-term maintainability over lower development effort.
Prefer fluent APIs and functional composition.

## Enumerated values

Document every enumerated value with a comment explaining its meaning and when to use it.

## Go logging

In Go, use `slog` with typed attributes such as `slog.String` and `slog.Any`.
When a context is available, use context-aware logging methods.

## Tests

After cleanup, avoid permanent tests whose sole purpose is asserting that removed implementation details remain absent.
Continue testing required behavior, including rejection and error cases.

For failures involving `await`, investigate the root cause before increasing timeouts.
