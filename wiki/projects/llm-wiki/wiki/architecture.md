# architecture

## overview

LLM-Wiki is a local-first Markdown knowledge and project operating vault for
AI-assisted work. It is organized around a 4-stage lifecycle plus an
evidence-backed feedback loop:

```text
concept -> pre-repo source-of-truth -> real repo (outside the vault) -> file-back lessons -> (loop)
```

Each piece of rule or content lives in exactly one canonical file; every other
file references rather than duplicates (single-canonical principle).

LLM-Wiki is not the implementation state store for real repos. After a real repo
exists, repo docs and code win; LLM-Wiki keeps reusable knowledge, templates,
harness, evidence, and minimal pointer notes.

## main components

| Component | Path | Responsibility |
| --- | --- | --- |
| Entry point | `index.md` | Compact pointer map; directs every request to `harness/read-workflow.md`. Owns no rule content. |
| Constitution | `llm-wiki-constitution.md` | Stable laws: source-of-truth hierarchy (§3), folder roles (§4), project phases (§6), migration (§9), checkpoint (§15), changelog (§19). |
| Global rules | `global-rules.md` | Daily working rules: active.md boundary, work rules, wiki-gap reporting, safety. Pointers to constitution for laws. |
| Program | `program.md` | Operating procedures: ingest, query, file-back rubric (§6), lint, compile, bootstrap, migrate, validation, checkpoint. |
| Active | `active.md` | Current LLM-Wiki focus only. Not a real-repo task tracker. |
| Harness | `harness/` | Read workflow, intake, risk lanes, task packet, test matrix, validation, knowledge lookup metric, feedback-loop procedure, Hermes read-planning guidance. |
| Templates | `templates/` | Reusable artifact skeletons including agent control cards, integration merge plans, LWOE measurement, Hermes config/read-plan, design system, and stage-4 file-back. |
| Knowledge | `wiki/knowledge/` | Reusable guides: project-doc standards, multi-agent coordination, architecture/design-system guidance, coding/security/testing, definition of done, review checklist. |
| Concepts | `wiki/concepts/` | Reusable concepts, including diagrams under `wiki/concepts/llm-wiki/`. |
| Decisions | `wiki/decisions/` | Cross-project ADR register. `_index.md` is the canonical table. |
| Vendors | `wiki/vendors/` | Vendor/tool lessons (file-back target). |
| Research | `wiki/research/` | Research findings (file-back target). |
| Projects (pointers) | `projects/<Name>/<Name>.md` | Pointer notes to real repos outside the vault. |
| Pre-repo source-of-truth | `wiki/projects/<project>/` | Active project docs only while no real repo exists. Removed after migration. |
| LLM-Wiki self-project docs | `wiki/projects/llm-wiki/` | Source of truth for LLM-Wiki itself while it has no separate real repo. |
| Raw sources | `raw/` | Read-only source material, cited but not edited. |
| Reports | `reports/validation/` | Validation evidence. `README.md` is the canonical catalog. |
| Logs | `logs/test-output/` | Long command/test/build output. |
| Archive | `archive/` | Non-canonical imported/reference material. |

## control flow

### request flow

```text
user request
  -> index.md (pointer map)
  -> harness/read-workflow.md (universal start + source-of-truth decision)
  -> harness/intake.md (classify request)
  -> Knowledge Lookup Metric when real-repo work may need LLM-Wiki
  -> optional Hermes read plan if the project has adopted it
  -> read only the files required by intent
  -> perform allowed operation
  -> checkpoint to active.md + reports/validation/ (constitution §15)
```

### project lifecycle flow

```text
concept (wiki/concepts/)
  -> bootstrap pre-repo project (wiki/projects/<project>/)
  -> create real repo outside the vault
  -> migrate source-of-truth into repo (move, not copy)
  -> replace pre-repo docs with a pointer note (projects/<Name>/<Name>.md)
  -> after the repo runs in practice, file lessons back via program.md §6
  -> file-back targets: wiki/knowledge/, wiki/decisions/, wiki/vendors/, wiki/research/
  -> loop: next concept reuses the filed knowledge
```

### multi-agent coordination flow

```text
task packet defines owner, inputs, outputs, and write boundaries
  -> Lead-orchestrated mode: Lead assigns agent, reviews result handoff, rolls up accepted work
  -> Human-orchestrated mode: human may run multiple agents directly
  -> each delegated subagent uses agents/<agent>/AGENT.md as the default control card
  -> shared-file edits require explicit file/section or row delegation
  -> combining outputs requires an integration owner
  -> same-section proposals stage in reports/integration/<task-id>-merge-plan.md
  -> Hermes may warn about stale plans or overlapping locks, but cannot grant permission
```

### file-back flow (stage 4)

```text
project produces a durable lesson
  -> AI checks program.md §6 file-back rubric
  -> three gates: Evidence, Generalization, Source tag
  -> if gates pass: fill templates/lesson_filed.template.md
  -> place in correct target (knowledge / decisions / vendors / research)
  -> if a decision: also row into wiki/decisions/_index.md
  -> checkpoint
```

### LWOE measurement flow

```text
project session or delegated task produces source measurements
  -> result report records Knowledge lookup and Measurement fields
  -> lwoe_session_measurement captures source reports and metric values
  -> efficacy dashboard reports each metric separately
  -> regressions become contradiction candidates
  -> reusable patterns that pass feedback-loop gates file into wiki/knowledge/
```

## boundaries

### canonical-ownership boundary

Each rule or piece of content has exactly one canonical file. Other files
reference via pointer. Violations are wiki rot and must be cleaned up.

### raw sources

Read-only by default. Source path cited when deriving knowledge. Conflicts
become `contradiction`.

### compiled wiki

Summarizes and links. Does not override project docs once a repo exists.
Missing values become `unknown`.

### harness

Controls how AI/dev work is scoped, validated, and completed. Does not replace
project source-of-truth docs.

### delegated agent state

The preferred delegated-agent local state shape is one control card:

```text
agents/<agent>/AGENT.md
```

Legacy split files remain compatibility only:

```text
agents/<agent>/tasks.md
agents/<agent>/status.md
agents/<agent>/tasks_archive.md
```

Agent-local files do not replace repo-wide rollups. Accepted result handoffs are
rolled up by the Lead, human, or named integration owner depending on the
orchestration mode.

### Hermes

Hermes is optional, read-only, and advisory. It may index context, suggest read
plans, and detect stale or overlapping section locks. It must not grant write
permission, override source-of-truth docs, or store draft content.

### project docs

Pre-repo: under `wiki/projects/<project>/`. Real-repo: in the repo itself.
After migration LLM-Wiki keeps only the pointer note in `projects/<Name>/`.

## external systems

- Obsidian-style wiki-links are used for navigation.
- No database, server, or required automation.
- Optional tooling: `harness/feedback-loop-lint.sh`, future full link/compile
  checkers, optional Hermes context indexer/read planner, optional MCP
  integration.

## major constraints

- Local-first Markdown.
- Single-canonical content (no duplication across files).
- Selective reading to control token cost.
- Lowercase stable paths for canonical files.
- Migration is move, not copy.
- Evidence required before marking behavior implemented.
- Human-orchestrated multi-agent output combination requires an integration
  owner before merge or rollup.
- Shared-file writes require explicit file/section or row delegation.
- Draft/proposal staging stays in Markdown, not in Hermes.
- Constitution amendments require a row in `§19 changelog`.

## links

- Constitution: `/home/admindebian/LLM-Wiki/llm-wiki-constitution.md`
- Program: `/home/admindebian/LLM-Wiki/program.md`
- Global rules: `/home/admindebian/LLM-Wiki/global-rules.md`
- Read workflow: `/home/admindebian/LLM-Wiki/harness/read-workflow.md`
- Harness catalog: `/home/admindebian/LLM-Wiki/harness/README.md`
- Templates catalog: `/home/admindebian/LLM-Wiki/templates/README.md`
- Validation reports catalog: `/home/admindebian/LLM-Wiki/reports/validation/README.md`
- Decisions index: `/home/admindebian/LLM-Wiki/wiki/decisions/_index.md`
