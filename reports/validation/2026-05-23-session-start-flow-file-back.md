# Validation: Session-start flow filed back from UniversityWeb to LLM-Wiki

**Date**: 2026-05-23
**Source project**: UniversityWeb (`/home/admindebian/UniversityWeb/`)
**Source evidence**: `/home/admindebian/UniversityWeb/docs/session_start.md`
**Operation**: file-back insight (per `program.md §6`)
**Result**: implemented

## context

User asked: design a canonical session-start procedure for AI agents
(Lead/Delegated/Unavailable) for UniversityWeb, consistent with LLM-Wiki.
After completing the UniversityWeb-specific version at
`UniversityWeb/docs/session_start.md`, user added: "feed it back to LLM-Wiki
as a lesson for future projects".

## file-back rubric check (program.md §6)

### Gate 1: Evidence ✓

- Source evidence: `/home/admindebian/UniversityWeb/docs/session_start.md`
  (concrete project-doc instance, written and lint-clean 2026-05-23).
- Companion validation: `/home/admindebian/UniversityWeb/reports/validation/2026-05-23-uw-systematization-llm-wiki-alignment.md`.
- Not file-back from chat alone — written project doc + validation report.

### Gate 2: Generalization ✓

The session-start procedure is not Umbraco-, .NET-, or UniversityWeb-specific.
The pattern is: "every agent reads X+Y first; then branches by role; then
pre-flight checks; then works with continuous checkpointing; then hands off."

Applicable beyond UniversityWeb:

- Any multi-agent project repo with a Lead + ≥1 Delegated agent.
- Any project using LLM-Wiki's `multi-agent-coordination.md` patterns.
- New project bootstraps (now have a template skeleton at `templates/session_start.template.md`).

### Gate 3: Source tag ✓

- `source_type: file-back`
- `source_project: UniversityWeb`
- `source_evidence: /home/admindebian/UniversityWeb/docs/session_start.md`
- Frontmatter on the canonical guide carries these explicitly.

## files written

### Canonical guide (LLM-Wiki)

- `wiki/knowledge/project-docs/session_start.md` — generalized canonical
  guide describing the 6-step flow, three role branches, quality criteria,
  anti-patterns, bootstrap procedure, and maintenance triggers. Cross-refs
  `harness/read-workflow.md`, `multi-agent-coordination.md`,
  `karpathy-guidelines.md`, `llm-wiki-constitution.md §15`,
  `harness/knowledge-lookup-metric.md`. Marked `confidence: medium` (first
  project using the pattern).

### Template (LLM-Wiki)

- `templates/session_start.template.md` — skeleton for new projects. Uses
  placeholders for project-specific names and paths.

### Index updates (LLM-Wiki)

- `wiki/knowledge/project-docs/README.md` — added row mapping
  `docs/session_start.md` repo doc to `session_start.md` knowledge guide.
- `templates/README.md` — added `session_start.template.md` to the
  delegated-agent local files list.

### Project-side concrete instance (already existed, UniversityWeb)

- `UniversityWeb/docs/session_start.md` — the original written 2026-05-23.

## relationship to existing canonical files

The new session_start guide does not introduce new rules. It sequences existing
ones:

| Step in session_start | Sourced from |
|---|---|
| Steps 1–3 (read order) | `harness/read-workflow.md` universal start |
| Role branches | `multi-agent-coordination.md` |
| Working style | `wiki/knowledge/coding/karpathy-guidelines.md` |
| Checkpoint | `llm-wiki-constitution.md §15` |
| Knowledge Lookup Metric | `harness/knowledge-lookup-metric.md` |

This is "assembly", not "amendment". No constitution §19 entry required.

## confidence trajectory

- Now (1 project): medium.
- Trigger to upgrade to high:
  1. Second project bootstraps using the template successfully.
  2. ≥1 delegated agent completes a session using the procedure without raising a wiki-gap on the procedure itself.
  3. Lead reports no agent boundary violations in the first session.
- Trigger to downgrade or revise:
  - A new agent type (e.g., a "Reviewer-only" or "Auditor" agent) doesn't fit the three existing branches.
  - LLM-Wiki canonical files referenced here have major revisions.

## checks

```
ls wiki/knowledge/project-docs/session_start.md      → exists
ls templates/session_start.template.md               → exists
grep "session_start" wiki/knowledge/project-docs/README.md  → row present
grep "session_start" templates/README.md             → row present
head -5 wiki/knowledge/project-docs/session_start.md → frontmatter with source_type: file-back, source_project: UniversityWeb
```

## gaps

- Template uses `{{project-name}}`-style placeholders; no schema validation. A
  later automation pass could add a `bootstrap_session_start.sh` helper that
  prompts for and substitutes values.
- The procedure is not yet exercised by a second project. The "applicable
  contexts" claim is theoretical until a second project bootstraps with it.
- No mention of CI integration (e.g., a lint that checks session_start.md
  exists and has the 6 steps) — deferred.

## decision

Accept file-back as implemented. `session_start.md` is now canonical
LLM-Wiki guidance for project-doc type. Future projects may use the template
on bootstrap.

## next steps

- (Optional) Update UniversityWeb `docs/session_start.md` to add a cross-ref
  to this canonical guide so the project version explicitly cites
  inheritance.
- When a second project bootstraps, run the template and report back any
  template gaps so the canonical guide can be refined.
- Reconsider confidence after second project use.
