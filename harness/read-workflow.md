# LLM-Wiki read workflow

Use this workflow before reading broadly.

## purpose

This file defines the canonical read path for LLM-Wiki so agents can:

- identify the current request;
- choose the correct source of truth;
- avoid reading the whole vault;
- decide when LLM-Wiki should be consulted for real repo work;
- checkpoint work in the right place.

## fast path (5-minute read)

If you have only five minutes, read these three things in order — that is enough to know what you may write and where source of truth lives. Skip the rest of this file until an intent escalates.

1. **`index.md`** (you landed here from system entry; ~1 min) — what LLM-Wiki contains and which control file owns what.
2. **`global-rules.md`** §work-rules + §safety + §active.md-boundary (~2 min) — daily-work rules, the `active.md` scope rule, and the safety/[WIKI-GAP] gates.
3. **This file's source-of-truth-decision table + Knowledge Lookup Metric table below** (~2 min) — which source wins for your request type, and whether to consult LLM-Wiki at all.

Then stop reading. Open the full read-paths-by-request-type tables, the per-file harness guides, or `llm-wiki-constitution.md` only when a specific intent (governance edit, project bootstrap, real-repo implementation, validation) requires the next level. The full read paths below are L2-L6 reads, not L1 default. This mirrors the Token Economy Law applied to project bootstrap (see [[../wiki/knowledge/project-docs/token-economy-bootstrap.md]]).

## universal start

1. Read the current user request.
2. Read `index.md`.
3. Classify the request with `harness/intake.md`.
4. Identify source of truth before opening many files.
5. Read only the files needed for that request.

This is **minimal-reads-by-intent** — the universal Token Economy principle. Never read by default; each file must trace to a current intent. For project-Lead bootstrap, the concrete pattern is the entry-file cheatsheet hoist documented in [[../wiki/knowledge/project-docs/token-economy-bootstrap.md]].

## optional Hermes read planner

Some projects may enable Hermes as a read-only context indexer and read planner.
Hermes is optional and advisory. It may suggest source files, anchors, and line
ranges to read, but it does not change the source-of-truth decision below.

Use [[hermes-read-planning.md]] only after identifying the request type and
source-of-truth class. If Hermes conflicts with a source file, the source file
wins and Hermes must be treated as stale until re-indexed.

LLM-Wiki itself should not depend on Hermes until real-project pilots produce
measurement evidence.

## source-of-truth decision

| Situation | Source of truth | LLM-Wiki role |
| --- | --- | --- |
| LLM-Wiki governance, harness, templates, or knowledge work | LLM-Wiki canonical files | Active work source |
| Concept or idea before a repo exists | `wiki/concepts/` for reusable concepts or `wiki/projects/<project>/` after bootstrap | Knowledge or preparation layer |
| Pre-repo project docs | `wiki/projects/<project>/` | Source of truth until repo exists |
| Real repo implementation/status/task work | Real repo docs and code | Knowledge source only |
| Migrated project history | Real repo docs | Historical archive/link map |

If sources conflict, use the hierarchy in `llm-wiki-constitution.md`.

## read paths by request type

### LLM-Wiki governance or cleanup

Read:

1. `index.md`
2. `global-rules.md`
3. `llm-wiki-constitution.md`
4. `program.md` when ingest/query/lint/compile is involved
5. relevant `harness/`, `templates/`, or `wiki/knowledge/` files
6. `wiki/projects/llm-wiki/docs/tasks.md`
7. `wiki/projects/llm-wiki/docs/test_matrix.md` when proof changes

Checkpoint:

- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/` when evidence is needed

### Query from LLM-Wiki

Read:

1. `index.md`
2. relevant project link note, knowledge guide, or source page
3. source material when the answer depends on exact history or conflict resolution

Do not update files unless the user asks to file back durable knowledge.

### New concept or pre-repo project

Read:

1. `index.md`
2. `harness/intake.md`
3. `harness/project-bootstrap.md`
4. `wiki/knowledge/project-docs/`
5. relevant templates under `templates/`

Create or update `wiki/projects/<project>/` only when no real repo exists.

### Real repo work

Read:

1. `projects/<ProjectName>/<ProjectName>.md`
2. active repo entry files, such as `AGENTS.md` and `REPO_RULES.md`
3. active repo Lead state file (e.g., `AI_CODEX.md`) — Lead role only; this is the L1 default bootstrap target
4. active repo task/status files — only when an action escalates beyond L1 default
5. task-specific active repo docs
6. LLM-Wiki knowledge only if the Knowledge Lookup Metric says it is needed

The active repo wins over LLM-Wiki.

#### Coding Pack exception

For repo coding sessions, the LLM-Wiki Coding Pack is mandatory preparation,
not optional lookup. When an agent is assigned to write, review, refactor, test,
validate, or accept repo code, read
`../wiki/knowledge/coding/agent-coding-workflow.md` and the full Coding Pack it
names once at session/assignment start.

This is a bounded exception to minimal reads. It does not authorize reading
unrelated LLM-Wiki knowledge or full repo history. Use the Knowledge Lookup
Metric for non-coding knowledge lookup and for architecture/scope/history
questions beyond the Coding Pack.

#### Lead-role bootstrap (token economy)

For projects with a Lead AI role (Codex, Claude, Gemini, DeepSeek, or any AI assigned), apply the Token Economy Law:

- **L1 default**: read only the repo entry files + Lead state file. The entry file should contain a hoisted L1 cheatsheet (see [[../wiki/knowledge/project-docs/token-economy-bootstrap.md]]) so AIs without persistent memory bootstrap without re-reading `docs/session_start.md` every session.
- **Escalate to L2-L6 only by explicit intent** (review delegated result, plan new packet, resolve conflict, accept+rollup, write new ADR). Each sub-branch adds a small focused set of files, not full project state.
- **AI-agnostic**: the Lead state file (e.g., `AI_CODEX.md`) belongs to the role, not to a specific AI. Any AI rotated into the Lead role reads + updates it. See [[../wiki/knowledge/project-docs/multi-agent-coordination.md]] mục "Lead rotation handoff".

This pattern was file-back from UniversityWeb 2026-05-23 (ADR-0023). Pre-pattern: re-reading full procedure docs at every bootstrap cost ~1100 lines/session. Post-pattern: ~330 lines/session at L1 default. Confirmed token economy for any AI without persistent memory.

## Knowledge Lookup Metric for real repo work

Canonical metric guide: `harness/knowledge-lookup-metric.md`.

Score each criterion from 0 to 2.

| Criterion | 0 | 1 | 2 |
| --- | --- | --- | --- |
| Architecture history needed | No | Some context may help | Architecture/boundary/stack/route/deployment decision affected |
| Active repo information sufficiency | Sufficient | Partial | Missing, stale, or conflicting |
| Scope drift risk | Low | Medium | High; task may add features outside accepted scope |
| Trade-off/history needed | No | Some | Prior decisions, rejected options, or ADR context needed |
| Reusable blueprint needed | No | Maybe | Yes; needs reusable pattern or harness guidance |

Decision rule:

| Score | Action |
| --- | --- |
| 0-2 | Do not consult LLM-Wiki |
| 3 | Optional; prefer active repo |
| 4-6 | Consult LLM-Wiki |
| 7-10 | Consult LLM-Wiki and ask Codex/main-agent before implementation |

Record the score in agent result reports when the task involves architecture, scope, contracts, security, production, or reusable blueprints.

## conflict rule

For the source-of-truth hierarchy see [[llm-wiki-constitution.md#3. source-of-truth hierarchy]].

When the hierarchy does not settle a conflict between LLM-Wiki and an active repo:

1. Do not apply the LLM-Wiki version directly.
2. Record the conflict in the result report.
3. Raise a blocker to Codex/main-agent.
4. Update active repo docs only after Codex/main-agent accepts the change.

## agent report section

Use this section when LLM-Wiki lookup is relevant:

```md
## Knowledge lookup

Score:

LLM-Wiki consulted:

Reason:

Findings used:

Conflicts with active repo:

Decision:
```

## stop conditions

Stop and ask or mark `unknown` when:

- source of truth is unclear;
- active repo docs conflict with LLM-Wiki;
- the task may change scope, architecture, security, or production posture;
- the user asks for project implementation but no repo path is known;
- a task is not ACID-complete before delegation.

## anti-patterns

Evidence-backed anti-patterns from LLM-Wiki read-path history. Same `The "..." trap` style as [[../wiki/knowledge/project-docs/multi-agent-coordination.md#anti-patterns]].

- **The "read-everything-to-be-safe" trap** — reading all of `wiki/knowledge/` or the entire vault before touching a task, "just to have context." Burns tokens, dilutes signal, and pushes Token Economy violations. The bounded exception is repo coding work: load the Coding Pack from [[../wiki/knowledge/coding/agent-coding-workflow.md]] once at session start. For other lookup, score with the Knowledge Lookup Metric first; 0-2 means do not read. Evidence: [[../reports/validation/2026-05-22-llmwiki-020-standardization.md]] (KLM was introduced to bound over-consultation).
- **The "ignore-the-wiki" trap** — assuming no LLM-Wiki lookup is ever needed for real-repo work. Architecture/security/contracts decisions made without consulting prior decisions repeat solved problems and silently violate ADRs. KLM ≥4 means consult. Evidence: same report.
- **Re-reading the full bootstrap procedure every session** — for AIs without persistent memory, re-reading 1000+ lines at session start violates Token Economy. The fix is the hoisted L1 cheatsheet in the project entry file. Evidence: [[../wiki/knowledge/project-docs/token-economy-bootstrap.md]]; UniversityWeb pre-pattern was ~1100 lines/session, post-pattern ~330 lines/session.
- **Conflating "active repo" with "LLM-Wiki summary"** — updating the LLM-Wiki summary when the repo doc is the source of truth (or vice versa) creates dual-write drift. The source-of-truth table above is binding. Evidence: [[../reports/validation/2026-05-22-real-repo-payload-cleanup.md]], [[../reports/validation/2026-05-23-canonical-consolidation.md]].
- **Silently applying an LLM-Wiki finding when it conflicts with the active repo** — the conflict rule above is binding: record the conflict, raise to Codex/main-agent, do not apply. Silent application loses audit trail and can silently override ADRs.
- **Skipping KLM score recording in result reports** — when a task touches architecture, scope, contracts, security, production, or reusable blueprints, the agent report must include the Knowledge lookup section above. Skipping it means the next reviewer cannot tell whether wiki was consulted or hallucinated.
- **Using LLM-Wiki as a status board** — `active.md` is LLM-Wiki work only, never real-repo state; compiled summaries reference repo docs, never duplicate them. Evidence: [[../global-rules.md#active-md-boundary]], [[../llm-wiki-constitution.md#2-core-law]].
