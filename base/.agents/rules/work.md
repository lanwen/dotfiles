# Work project instructions

Applies to repositories under `~/code/github.com/AtomicJar/` and
`~/code/github.com/docker/`.

Resolve links and relative paths to additional instruction files from this
file's directory (`~/.agents/rules/`). Paths explicitly described as repository
paths resolve from the active repository root; vault paths resolve from the
Obsidian vault root. Expand `~` to the current user's home directory.

## Issue tracker: Obsidian

Private tasks and specs live in the `work` Obsidian vault at
`~/obsidian/work`. The tracker folder is `Issues/<repository-name>/`, using
the active repository root directory's name. For `cloud-uc-services`, use
`Issues/cloud-uc-services/`.

Jira is the team's tracker. This private workflow does not synchronize with
Jira. When a skill says to publish to the issue tracker, save an Obsidian note.
Keep private task content out of repository files, commits, PR descriptions,
GitHub issues, and Jira unless the user explicitly requests publication.
Keep these personal workflow instructions outside the repository too.

### Note layout

Paths below are relative to the repository's tracker folder in the vault:

- Feature spec: `<feature>/spec.md`
- Individual tickets: `<feature>/issues/<NN>-<slug>.md`, numbered from 01
- Work map: `<feature>/map.md`

Use one note per ticket. Record these YAML properties:

- `triage`: a role from the Triage labels section below
- `status`: open, claimed, or resolved
- `type`: research, prototype, grilling, or task
- `blocked_by`: a list of ticket paths relative to the repository's tracker folder

Append discussion under `## Comments` and results under `## Answer`.
Use Obsidian links to connect specs, maps, and tickets.

### CLI operations

Always target `vault=work` explicitly and use exact vault-relative paths.

- Inspect vault: `obsidian vault=work vault`
- List notes: `obsidian vault=work files folder="Issues/<repository-name>"`
- Read: `obsidian vault=work read path="<path>"`
- Create: `obsidian vault=work create path="<path>" content="<text>"`
- Append: `obsidian vault=work append path="<path>" content="<text>"`
- Update a text property: `obsidian vault=work property:set path="<path>" name="<property>" value="<value>" type=text`

Pass content as a safely quoted argument. Creation must preserve existing
notes; read a note before updating it. Fetching a relevant ticket means reading
its Obsidian note. If the CLI is unavailable, resolve access to the work vault
rather than publishing to another tracker.

### Wayfinding

The map holds Notes, Decisions-so-far, and Fog, and links to child tickets.
A ticket is available when it is open, its triage role is appropriate for the
worker, and every blocker is resolved. Select available tickets by number and
set status to claimed before work. On completion, append the answer, set status
to resolved, and add a short finding with a ticket link to the map's
Decisions-so-far.

## Triage labels

Store the canonical role in each ticket's YAML `triage` property.

| Role | Value | Meaning |
| --- | --- | --- |
| needs-triage | needs-triage | Needs evaluation |
| needs-info | needs-info | Needs more information |
| ready-for-agent | ready-for-agent | Ready for autonomous implementation |
| ready-for-human | ready-for-human | Requires human implementation |
| wontfix | wontfix | Will not be actioned |

Applying a triage label means updating this property in Obsidian.
Track execution separately in the `status` property.

## Domain docs

### Read before exploring

Default to a single-context layout. These are repository-relative paths:

- Read root `CONTEXT.md` for domain terms and invariants.
- If root `CONTEXT-MAP.md` exists, follow it to the contexts relevant to the task.
- Read relevant decisions under `docs/adr/` and any context-specific ADR
  directories identified by the context map.

If these documents are absent, proceed silently. The domain-modeling skill
creates them when terms or decisions are resolved. Domain documents describe
shared domain knowledge; private task plans and discussion remain in Obsidian.

### Vocabulary and decisions

Use the terms defined in the relevant `CONTEXT.md` when naming concepts in
tickets, proposals, hypotheses, code, and tests. Respect its avoided synonyms.
If a needed concept is missing, reconsider the term or note the gap for
domain-modeling.

Explicitly identify any proposal that conflicts with an existing ADR,
including the ADR reference and the reason to reconsider it.
