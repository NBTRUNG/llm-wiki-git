# LLM-Wiki read workflow

Use this workflow before reading broadly.

## purpose

This file defines the canonical read path for LLM-Wiki so agents can:

- identify the current request;
- choose the correct source of truth;
- avoid reading the whole vault;
- decide when LLM-Wiki should be consulted for real repo work;
- checkpoint work in the right place.

## one-file session entry

At the start of a new session, the user should only need to point the agent at
one entry file. That file must contain a compact L1 cheatsheet and escalation
pointers. Agents read only that file first, then open more files only when the
current intent requires it.

For recurring work, use `../workflows/catalog.md` as the short workflow audit
layer after the start root is known. The catalog names the workflow card; this
file keeps the detailed read/source-of-truth rules.

Agents self-route and do not display the full catalog at each session start.
For human explanation and manual navigation, use `../human/README.md`. The
human folder is a linked projection, not execution authority; canonical
workflow behavior remains here and in `../workflows/`.

Default entry files:

| Work target | One file to read first |
| --- | --- |
| LLM-Wiki governance/knowledge/harness/templates | `index.md` |
| Real repo implementation/status/task work | `<repo>/AGENTS.md` |
| Agent Platform raw/gateway/WAP/audit work | `/home/admindebian/Agent-Platform/README.md` |

The entry file must name the source of truth, live-state files, required packs,
raw/platform namespace, and stop conditions. Do not ask the user to remember a
long file list for ordinary session start.

## fast path (5-minute read)

If you have only five minutes and no project-specific entry file exists, read
these three things in order — that is enough to know what you may write and
where source of truth lives. Skip the rest of this file until an intent
escalates.

1. **`index.md`** (you landed here from system entry; ~1 min) — what LLM-Wiki contains and which control file owns what.
2. **`global-rules.md`** §work-rules + §safety + §active.md-boundary (~2 min) — daily-work rules, the `active.md` scope rule, and the safety/[WIKI-GAP] gates.
3. **This file's source-of-truth-decision table + Knowledge Lookup Metric table below** (~2 min) — which source wins for your request type, and whether to consult LLM-Wiki at all.

Then stop reading. Open the full read-paths-by-request-type tables, the per-file harness guides, or `llm-wiki-constitution.md` only when a specific intent (governance edit, project bootstrap, real-repo implementation, validation) requires the next level. The full read paths below are L2-L6 reads, not L1 default. This mirrors the Token Economy Law applied to project bootstrap (see [[../wiki/knowledge/project-docs/token-economy-bootstrap.md]]).

## universal start

1. Read the current user request.
2. For capability-managed work, load the Lead-owned capability note before
   broad reading. Compare assigned tier/dimensions/projection with the task
   contract. Missing or expired evidence means `C0`. A mismatch is a stop or
   handoff condition, not permission to attempt the higher-tier read flow.
3. Identify the **start root** before reading broadly:
   - LLM-Wiki governance, harness, template, or reusable knowledge work starts
     at `/home/admindebian/LLM-Wiki`.
   - Real repo implementation/status/task work starts at the real repo root,
     not LLM-Wiki.
   - Agent Platform runtime work starts at `/home/admindebian/Agent-Platform`.
4. Read the start root's entrypoint or the lower-tier capsule assigned by the
   task:
   - LLM-Wiki: `index.md`, then `TICK.md` when present.
   - Real repo: `AGENTS.md`, `REPO_RULES.md`, `TICK.md` when present, and the
     Lead/current-state file named by that repo.
   - Agent Platform: `/home/admindebian/Agent-Platform/README.md`, then the
     relevant gateway/map/agent file.
5. For LLM-Wiki `P2 Map-First` work, read `index.md`. `P0/P1` agents use only
   their assigned capsule/packet and exact files.
6. Read `TICK.md` when present and allowed by the projection to understand current task, intent, context,
   knowledge route, and active claims.
7. Classify the request with `harness/intake.md` when the projection permits
   dynamic classification; otherwise follow the packet's fixed classification.
8. Identify source of truth before opening many files.
9. Read only the files allowed and needed for that request.

This is **minimal-reads-by-intent** — the universal Token Economy principle. Never read by default; each file must trace to a current intent. For project-Lead bootstrap, the concrete pattern is the entry-file cheatsheet hoist documented in [[../wiki/knowledge/project-docs/token-economy-bootstrap.md]].

Minimal reads still require base literacy. Agents must load the entry/source of
truth/safety/evidence rules needed to understand the map before opening
specialist knowledge. For goal changes, release stale task knowledge and load
the next triggered set; see
[[../wiki/knowledge/project-docs/knowledge_cache_discipline.md]].

Capability and context projection rules live in
[[../wiki/knowledge/project-docs/agent_capability_tiers.md]]. Higher-tier agents
may choose a smaller projection; lower-tier agents must not choose a larger one.

## ROI gate before workflow changes

Before changing workflow structure, templates, task layout, archive strategy,
source-of-truth rules, or session-start procedure, compare:

```text
ROI: benefit vs edit surface
Simplicity: can a new agent understand it in under 5 minutes?
Effectiveness: does it reduce real confusion or only make docs prettier?
Blast radius: how many templates, harness files, reports, and project docs must change?
Decision:
- If options produce the same operational behavior, choose the smaller change.
- If a larger change produces materially better effectiveness, present the
  options, ROI, and blast radius to the user or integration owner before
  choosing.
```

ROI is not a rule to always choose the cheapest edit. It is a decision gate:
smallest-equivalent-change by default; user/integration-owner choice when a
higher-cost option may be worth the better outcome. Record the ROI note in the
validation report for durable workflow changes.

## file line-budget guidance

Use line budgets to keep files readable by agents. These are guidance thresholds
unless a project has stricter rules.

| File type | Target lines | Warn above | Notes |
| --- | ---: | ---: | --- |
| One-file session entry: `AGENTS.md`, `index.md`, Agent Platform `README.md` | 80-150 | 200 | Enough L1 context, no long history. |
| `TICK.md`, Lead state, current focus | 50-120 | 180 | Current task, claim, next action only. |
| `tasks.md` ledger | 100-300 | 500 | Canonical work-item list; use `rg`/task id, do not read end to end when large. |
| `test_matrix.md` | 100-300 | 500 | Evidence table; read by task id. |
| `source_inventory.md`, `data_map.md`, `workflow_map.md` | 80-250 | 400 | Split by domain/project if longer. |
| Knowledge pack `README.md` | 80-200 | 300 | Router only; details live in child files. |
| Detailed knowledge file | 150-400 | 600 | Split sections when over budget. |
| Validation report | 50-180 | 300 | Evidence summary, not pasted logs. |
| Raw/extracted JSONL | n/a | n/a | Not read as docs; use tools, filters, or targeted queries. |

If an entry/current-state file exceeds its warning threshold, prefer trimming or
moving history to `tasks.md` / reports. If a ledger or matrix exceeds its
warning threshold, keep it canonical but require task-id search and consider
phase/year split only when ROI justifies it.

## navigation maps

Root `index.md` is the only workspace-level index. Directory-local maps should
use `README.md`; project-specific maps should use explicit names such as
`docs/project_index.md`; registers may use explicit names such as
`wiki/decisions/_index.md`.

Do not create `index.md` at every nested level. For a nested path such as
`A/B/C`, route by parent maps:

```text
index.md
  -> A/README.md
  -> A/B/README.md
  -> A/B/C/README.md
```

Detailed rules live in
`wiki/knowledge/project-docs/navigation_maps.md`.

## TICK and claim/release

For git-backed project work, prefer a short `TICK.md` entrypoint over derived
read-planning caches.

`TICK.md` should state:

- Task;
- Intent;
- Context;
- Knowledge/read order;
- Claims.

Before implementation, confirm the task is unclaimed or claimed by the current
session. If another active session owns the claim, stop and ask the human, Lead,
or integration owner to reassign, split, or release it.

Hermes read planning is retired from the active LLM-Wiki workflow. Historical
Hermes reports remain evidence, but active agents should use Markdown source
files, `TICK.md`, task packets, session packs, and project maps.

## source-of-truth decision

| Situation | Source of truth | LLM-Wiki role |
| --- | --- | --- |
| LLM-Wiki governance, harness, templates, or knowledge work | LLM-Wiki canonical files | Active work source |
| Concept or idea before a repo exists | `wiki/concepts/` for reusable concepts or `wiki/projects/<project>/` after bootstrap | Knowledge or preparation layer |
| Pre-repo project docs | `wiki/projects/<project>/` | Source of truth until repo exists |
| Real repo implementation/status/task work | Real repo docs and code | Knowledge source only |
| Migrated project history | Real repo docs | Historical archive/link map |

If sources conflict, use the hierarchy in `llm-wiki-constitution.md`.

## active-state update rule

Reports are evidence, not the live task board. Any durable change must update
the active state in the same turn before the agent reports completion.

Use this matrix:

| Work target | Must update before done | Report role |
| --- | --- | --- |
| LLM-Wiki governance, templates, harness, knowledge, project docs | `TICK.md` when current focus changed; `wiki/projects/llm-wiki/docs/tasks.md`; `wiki/projects/llm-wiki/docs/test_matrix.md`; `reports/validation/README.md`; relevant project docs | Evidence and audit |
| Real repo implementation/status/task work | The real repo's `TICK.md` / Lead state; repo `docs/tasks.md`; repo `docs/test_matrix.md` or equivalent; repo validation/report index | Evidence for repo rollup |
| Agent Platform runtime/raw/gateway/WAP/audit work | `/home/admindebian/Agent-Platform` runtime files; LLM-Wiki pointer/source maps only when boundary changes | Evidence for platform boundary |
| Research-to-knowledge promotion | WAP proposal first unless user explicitly approves publish; after publish update LLM-Wiki tasks/test matrix and validation index | Evidence for promoted knowledge |

Do not finish with only `reports/validation/*.md` updated when the task changes
live coordination state. A report without the matching task/status/test-matrix
rollup is incomplete.

## pause and closeout trigger

When the user says "dừng tại đây", "dung tai day", "stop here", or asks to
pause/save, run `../workflows/session-closeout.workflow.md` before ending the
turn.

Minimum closeout:

- update the current work target's live state file (`TICK.md`, `LEAD_STATE.md`,
  or equivalent);
- update the task ledger and test/evidence matrix when work changed;
- index any validation report created in the turn;
- archive completed task history when the live ledger would otherwise remain
  over its warning threshold;
- tell the user which single file to start from next time.

At every substantive handoff, include the selected `Workflow used`. If the
execution diverged from the canonical workflow, state the deviation and its
reason separately from the final-result evidence.

## manual recovery trigger

When agent/automation availability fails or a human must take over, start at
`../RECOVERY.md`, then use `../workflows/manual-recovery.workflow.md` and the
owning system's runbook. Mutations fail closed when ownership, rollback, or
authority is unclear; preserve safe read-only access and original evidence.

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

1. Real repo root entry files, especially `AGENTS.md` and `REPO_RULES.md`.
2. `TICK.md` when present.
3. Active repo Lead state file (e.g., `LEAD_STATE.md`, `AI_CODEX.md`) — Lead
   role only; this is the L1 default bootstrap target.
4. Active repo task/status files — only when an action escalates beyond L1
   default.
5. Task-specific active repo docs.
6. LLM-Wiki project pointer `projects/<ProjectName>/<ProjectName>.md` only when
   the repo path, knowledge route, or history pointer is unclear.
7. LLM-Wiki knowledge only if the Knowledge Lookup Metric says it is needed.

The active repo wins over LLM-Wiki.

For a real repo such as UniversityWeb-17, do not start from the LLM-Wiki root
unless the user asks to change LLM-Wiki itself. Start in the repo, then consult
LLM-Wiki only through the repo's knowledge gate.

#### Coding Pack exception

For repo coding sessions, the canonical LLM-Wiki Coding Pack is mandatory
preparation, not optional lookup. Eligible `P2` agents read it directly once.
`P0/P1` agents use only an approved task-named projection that preserves its
mandatory security/output/test/boundary/stop rules. Without one, they are not
eligible for the task.

This is a bounded exception to minimal reads. It does not authorize reading
unrelated LLM-Wiki knowledge or full repo history. Use the Knowledge Lookup
Metric for non-coding knowledge lookup and for architecture/scope/history
questions beyond the Coding Pack.

#### Agent session packs

Use `../wiki/knowledge/project-docs/agent_session_packs.md` to classify the
current session and load only the packs required by the work type:

- Repo Base Pack for every real-repo session.
- Coding Pack directly or via the validated capability projection for code,
  review, refactor, test, validation, or acceptance work.
- Security Baseline always inside Coding Pack.
- Security Deep Pack only when security triggers apply.
- Web/UI, Architecture, Contracts, and Operations packs only when the session
  intent requires them.

Packs do not override the active repo. If a required pack conflicts with repo
rules, follow the repo and record the conflict in the result report.

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
