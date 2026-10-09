Before any other action, read and follow [global agent instructions](/Users/lanwen/.agents/AGENTS.md). Resolve links inside that file relative to `/Users/lanwen/.agents/`.

When discovering tools through `ALL_TOOLS`, return matching names first.
Read full descriptions and argument definitions only for selected tools.
Reuse definitions already available in the conversation.

<!-- codedb:begin v0.2.5860 -->
## codedb — code intelligence policy

codedb is a code-intelligence and context tool — not your editor. Reach for the
codedb MCP tools FIRST, before shell search or bulk file reads:

- `codedb_context` to orient on a new task before reading anything else.
- `codedb_explain` for a known symbol (definition body + callers), `codedb_callpath`
  for the shortest A→B chain, `codedb_list_dir` for a folder, `codedb_status` for
  index health.
- Hop tools (`codedb_symbol` / `codedb_callers` / `codedb_search` / `codedb_outline`)
  still dispatch if you already know them — they are not the opening menu.
- Make edits with your own native editor tools. codedb is the navigation layer,
  not the editor.
- If codedb reports no index or a stale one, run `codedb <root> index` and fall
  back to `rg`/`cat` until it completes.

Managed by `codedb codex install` — edits inside this block are overwritten.
Remove it with `codedb codex uninstall`.
<!-- codedb:end -->
