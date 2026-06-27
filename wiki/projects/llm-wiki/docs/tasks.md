# tasks

## current task

### id

LLMWIKI-020

### title

Standardize LLM-Wiki with selective imported-model ingest, Knowledge Lookup Metric, refreshed visual flows, and canonical read workflow.

### type

wiki governance / knowledge cleanup / harness improvement

### lane

normal

### status

implemented

### context

The LLM-Wiki foundation is usable as a knowledge system, project operating system, and AI/dev harness.

This task standardizes the next model pass by combining:

- the current canonical LLM-Wiki model;
- selected reusable material from imported `llm-wiki/`;
- the two imported SVG flow ideas;
- `llm_wiki_knowledge_lookup_blueprint.md`;
- a cleaner end-to-end read workflow for agents.

The imported material must not replace the current canonical model. Active project repos remain source of truth after migration.

### roadmap

| Step | Focus | Output |
| --- | --- | --- |
| 0 | Decision and source classification | Record that `llm-wiki/`, `llm-wiki.zip`, and `llm_wiki_knowledge_lookup_blueprint.md` are imported/reference sources, not canonical active guidance. |
| 1 | Canonical read workflow | Systematize the full LLM-Wiki read process from request intake to source-of-truth choice, lookup scoring, execution, validation, and checkpoint. |
| 2 | Knowledge Lookup Metric | Add reusable LLM-Wiki guidance and repo template for scoring when agents should consult LLM-Wiki. |
| 3 | Coding/security/testing ingest | Convert imported `guidelines/` material into reusable `wiki/knowledge/coding/` guides. |
| 4 | DoD/review ingest | Convert imported DoD and review checklist into `wiki/knowledge/project-docs/` guides and optional templates. |
| 5 | API scaffold examples | Preserve `api-contracts.yaml`, `system-design.md`, `infra-topology.md`, and `data-model.md` as example scaffold material, not global law. |
| 6 | Visual model refresh | Recreate diagrams for the current LLM-Wiki model and concept-to-project flow, preferably as Mermaid source first. |
| 7 | Imported bundle cleanup | Archive or remove `llm-wiki/`, `llm-wiki.zip`, and accidental brace directory after ingest is accepted. |
| 8 | Validation and checkpoint | Update indexes/readmes/status/test matrix and create validation evidence. |

### canonical read workflow to implement

```text
User request
  -> index.md compact rules
  -> intake classification
  -> source-of-truth phase choice
  -> Knowledge Lookup Metric when repo work may need LLM-Wiki
  -> relevant constitution/program/harness/knowledge/templates only
  -> task/output/validation
  -> report/checkpoint in the correct place
```

### required read files

- `index.md`
- `global-rules.md`
- `llm-wiki-constitution.md`
- `program.md`
- `harness/README.md`
- `harness/intake.md`
- `harness/task-decomposition.md`
- `harness/task-packet.md`
- `llm_wiki_knowledge_lookup_blueprint.md`
- `llm-wiki/concept_vs_spec_flow.svg`
- `llm-wiki/llm_wiki_structure_flow.svg`
- `llm-wiki/guidelines/coding-standards.md`
- `llm-wiki/guidelines/security-rules.md`
- `llm-wiki/guidelines/testing-policy.md`
- `llm-wiki/project-docs/definition-of-done.md`
- `llm-wiki/project-docs/review-checklist.md`
- `llm-wiki/architecture/api-contracts.yaml`
- `llm-wiki/architecture/system-design.md`
- `llm-wiki/architecture/infra-topology.md`
- `llm-wiki/architecture/data-model.md`

### exact input

- Current canonical LLM-Wiki operating model.
- Imported `llm-wiki/` bundle and two SVG flow diagrams.
- `llm_wiki_knowledge_lookup_blueprint.md`.
- User direction: combine selectively, keep useful visual ideas, add roadmap/tasks, and systematize the full LLM-Wiki read process.

### exact output

- Canonical LLM-Wiki read workflow documented and linked from entry/harness guidance.
- Knowledge Lookup Metric guidance and template integrated into canonical LLM-Wiki locations.
- Coding/security/testing reusable guides created or updated under `wiki/knowledge/coding/`.
- DoD/review reusable guides created or updated under `wiki/knowledge/project-docs/`.
- API scaffold material preserved as example/reference, not source-of-truth law.
- Updated diagrams or Mermaid source for:
  - current LLM-Wiki operating model;
  - concept-to-project/repo flow.
- Imported bundle archived or clearly marked as non-canonical after ingest.
- `index.md`, relevant READMEs, `active.md`, project status, test matrix, and validation report updated.

### allowed write targets

- `index.md`
- `active.md`
- `global-rules.md`
- `program.md`
- `harness/`
- `templates/`
- `wiki/knowledge/`
- `wiki/concepts/`
- `wiki/projects/llm-wiki/`
- `archive/imported-models/`
- `reports/validation/`

### forbidden write targets

- real project repos unless explicitly assigned
- `/home/admindebian/LLM-Wiki-GitHub/` unless the user explicitly resumes GitHub sync.
- `raw/andrej-karpathy-skills-main/`
- Historical local diary files are not active source of truth.

### forbidden side effects

- Do not make imported `llm-wiki/` the canonical model.
- Do not turn API/FastAPI/PostgreSQL/JWT examples into global rules.
- Do not remove imported source files before validation and user acceptance.
- Do not push/sync/publish to GitHub.
- Do not update active project repo status from LLM-Wiki.

### acceptance criteria

- [x] `LLMWIKI-020` keeps active repo docs above LLM-Wiki for implementation state.
- [x] Canonical LLM-Wiki read workflow is documented from request intake through checkpoint.
- [x] Knowledge Lookup Metric exists in canonical guidance/template locations.
- [x] Agent result report guidance includes a Knowledge Lookup section.
- [x] Coding/security/testing material is generalized and linked from `wiki/knowledge/coding/README.md`.
- [x] DoD/review material is generalized and linked from `wiki/knowledge/project-docs/README.md`.
- [x] API scaffold files are preserved as examples only.
- [x] New visual flow source exists and matches the canonical source-of-truth model.
- [x] Imported bundle status is clear: archived, removed, or explicitly marked non-canonical.
- [x] Validation evidence is recorded in `reports/validation/`.

### validation

- Unit: file existence/readback for new or updated guidance files.
- Integration: links from `index.md`, READMEs, harness, templates, project docs, and test matrix agree.
- E2E: an agent can follow the read workflow, decide whether to consult LLM-Wiki using the metric, and follow concept-to-project flow without treating imported bundle as canonical.
- Platform: local filesystem paths exist.
- Release: n/a unless GitHub sync is explicitly resumed.
- Manual review: required before deleting imported source files.

### evidence

- Planning/read-workflow validation report: `reports/validation/2026-05-22-llmwiki-020-roadmap-task-packet.md`.
- Implementation validation report: `reports/validation/2026-05-22-llmwiki-020-standardization.md`.
- Logs: n/a.

## previous foundation task

`LLMWIKI-CORE-001` remains implemented.

- Validation report: `reports/validation/2026-05-18-llm-wiki-core-completion.md`.
- Task I/O validation report: `reports/validation/2026-05-19-llm-wiki-task-io.md`.

## completed tasks

| id | title | status | evidence |
| --- | --- | --- | --- |
| LLMWIKI-001 | Create source-of-truth project docs for LLM-Wiki | implemented | `wiki/projects/llm-wiki/`; `reports/validation/2026-05-17-llm-wiki-foundation.md` |
| LLMWIKI-002 | Update `wiki/index.md` with LLM-Wiki project summary and direct links | implemented | `wiki/index.md`; `reports/validation/2026-05-17-llm-wiki-foundation.md` |
| LLMWIKI-003 | Create first `reports/validation/` report for LLM-Wiki foundation | implemented | `reports/validation/2026-05-17-llm-wiki-foundation.md` |
| LLMWIKI-004 | Run first manual wiki lint report | implemented | `reports/validation/2026-05-17-llm-wiki-lint.md` |
| LLMWIKI-007 | Create project bootstrap workflow from templates | implemented | `harness/project-bootstrap.md`; `reports/validation/2026-05-18-llm-wiki-core-completion.md` |
| LLMWIKI-009 | Ingest Karpathy source into `raw/` | implemented | `raw/andrej-karpathy-skills-main/`; `raw/README.md` |
| LLMWIKI-012 | Prepare GitHub upload scope | implemented | `.gitignore`; public scope review; later replaced by separate `/home/admindebian/LLM-Wiki-GitHub` repo |
| LLMWIKI-014 | Create clean public GitHub folder | implemented | `/home/admindebian/LLM-Wiki-GitHub`; commit `f5b5653` |
| LLMWIKI-015 | Add existing project workflow | implemented | `harness/project-workflow.md`; `harness/README.md`; `index.md`; public commit `94fca56` |
| LLMWIKI-016 | Add task decomposition workflow | implemented | `harness/task-decomposition.md`; `templates/implementation_plan.template.md`; `templates/tasks.template.md`; public commit `d89ea23` |
| LLMWIKI-017 | Add ACID task and shared contracts workflow | implemented | `harness/task-decomposition.md`; `harness/task-packet.md`; `templates/contracts.template.md`; public commit `71d1f6a`; `reports/validation/2026-05-19-llm-wiki-task-io.md` |
| LLMWIKI-018 | Require explicit input/output for executable tasks | implemented | `harness/task-decomposition.md`; `harness/task-packet.md`; `templates/tasks.template.md`; `reports/validation/2026-05-19-llm-wiki-task-io.md`; GitHub sync deferred |

## roadmap tasks

| id | title | status | evidence |
| --- | --- | --- | --- |
| LLMWIKI-020 | Standardize LLM-Wiki with selective imported-model ingest, Knowledge Lookup Metric, refreshed visual flows, and canonical read workflow | implemented | `harness/read-workflow.md`; `harness/knowledge-lookup-metric.md`; `wiki/knowledge/`; `templates/examples/api-service-scaffold/`; `wiki/concepts/llm-wiki/`; `archive/imported-models/llm-wiki-import-2026-05-22.md`; `reports/validation/2026-05-22-llmwiki-020-standardization.md` |
| LLMWIKI-021 | Remove migrated real-repo payloads so LLM-Wiki remains a reusable knowledge vault | implemented | `projects/<retained-project>/`; `index.md`; `wiki/index.md`; `global-rules.md`; `llm-wiki-constitution.md`; `program.md`; `harness/project-bootstrap.md`; `reports/validation/2026-05-22-real-repo-payload-cleanup.md` |
| LLMWIKI-022 | Single-canonical consolidation + feedback-loop infrastructure (stage 4 enablement) | implemented | `index.md`; `global-rules.md`; `llm-wiki-constitution.md` (§12, §18, §19); `program.md` (§3, §6); `harness/README.md`; `harness/read-workflow.md`; `templates/lesson_filed.template.md`; `wiki/decisions/_index.md`; `reports/validation/README.md`; `reports/validation/2026-05-23-canonical-consolidation.md` |
| LLMWIKI-023 | External knowledge ingest (architecture + security), Karpathy skill format adoption, multi-agent coordination infrastructure | implemented | `wiki/concepts/architecture/`; `wiki/concepts/security/`; `wiki/knowledge/architecture-patterns/`; `wiki/knowledge/coding/karpathy-guidelines.md`; `wiki/knowledge/project-docs/multi-agent-coordination.md`; `templates/agent_role_card.template.md`; `templates/daily_work_log.template.md`; `reports/validation/2026-05-23-external-knowledge-ingest.md` |
| LLMWIKI-024 | Lead-efficiency experiment Phase A (slim AI_CODEX, lead-action sub-branches, code_map) → Phase B (AI-agnostic bootstrap + Token Economy Law + file-back to LLM-Wiki canonical) | phase-a+b implemented | UniversityWeb evidence: `/home/admindebian/UniversityWeb/docs/decisions.md` ADR-0023, `reports/validation/2026-05-23-llmwiki-024-phase-a-implementation.md`, `reports/validation/2026-05-23-bootstrap-token-audit.md`; LLM-Wiki file-back: `reports/validation/2026-05-23-token-economy-bootstrap-file-back.md`, `wiki/knowledge/project-docs/token-economy-bootstrap.md`, updated `session_start.md` + `multi-agent-coordination.md` + `harness/read-workflow.md` |
| **LLMWIKI-025** | **LWOE — LLM-Wiki Operational Efficacy measurement framework** (Phase C of 024): define 6 metric groups (token economy, time/iteration, quality, multi-agent, knowledge lookup, user experience), measurement template, retrospective baseline from UniversityWeb, A/B comparison framework, acceptance thresholds, dashboard | **implemented (cycle 1; NO-DATA overall pending instrumentation)** | T1 `wiki/knowledge/project-docs/efficacy_metrics.md`; T2 `templates/lwoe_session_measurement.template.md`; T3 `reports/validation/2026-05-24-lwoe-baseline-universityweb.md`; T4 `wiki/knowledge/project-docs/efficacy_evaluation.md`; T5 `efficacy_metrics.md#threshold-revision-log-2026-05-24`; T6 `wiki/projects/llm-wiki/docs/efficacy_dashboard.md` + `reports/validation/2026-05-24-llmwiki-025-lwoe-implementation.md` |
| **LLMWIKI-026** | **Feedback-loop operational optimization**: add deferred candidate queue, LWOE source fields in result/session templates, Token Economy bootstrap templates, and lightweight feedback-loop lint helper | **implemented** | `harness/feedback-loop.md`; `wiki/projects/llm-wiki/docs/feedback_loop_queue.md`; `templates/agent_result_report.template.md`; `templates/lwoe_session_measurement.template.md`; `templates/agents.template.md`; `templates/lead_state.template.md`; `harness/feedback-loop-lint.sh`; `reports/validation/2026-05-25-feedback-loop-operational-optimization.md` |
| **LLMWIKI-027** | **Agent task/status read optimization**: make delegated task/status files current-slice-first, rotate accepted packet bodies to archive, and remove delegated Lead-state default reads | **implemented** | `wiki/knowledge/project-docs/agent_local_work.md`; `wiki/knowledge/project-docs/delegated-packet-rotation.md`; `templates/agent_tasks.template.md`; `templates/agent_status.template.md`; `templates/agent_tasks_archive.template.md`; `templates/agent_role_card.template.md`; `templates/agents.template.md`; `templates/repo_rules.template.md`; `reports/validation/2026-05-25-agent-task-status-read-optimization.md` |
| **LLMWIKI-028** | **Single subagent control-card standard**: make `agents/<agent>/AGENT.md` the default one local file for delegated agents; mark split `tasks.md`/`status.md`/`tasks_archive.md` as legacy compatibility; align Hermes indexing target | **implemented** | `wiki/knowledge/project-docs/agent_local_work.md`; `wiki/knowledge/project-docs/multi-agent-coordination.md`; `templates/agent_role_card.template.md`; `templates/agents.template.md`; `templates/hermes_config.template.md`; `reports/validation/2026-06-11-single-agent-control-card.md` |
| **LLMWIKI-029** | **Architecture skill + design-system web research ingest**: add source-backed architecture operating guide, design-system guide, and design-system template | **implemented** | `wiki/knowledge/project-docs/architecture_skill.md`; `wiki/knowledge/project-docs/design_system.md`; `templates/design_system.template.md`; `reports/validation/2026-06-11-architecture-design-system-web-research.md` |
| **LLMWIKI-030** | **Architecture approach selection by workload**: add guide for backend/data-first, API-first, frontend/component-driven, feature/vertical-slice, BFF, event-first, platform-first, and monolith-first choices | **implemented** | `wiki/knowledge/project-docs/architecture_approach_selection.md`; `reports/validation/2026-06-12-architecture-approach-selection.md` |
| **LLMWIKI-031** | **Human-orchestrated multi-agent mode**: allow humans to directly orchestrate multiple agents, receive handoffs directly, assign integration owner before combining outputs, delegate narrow shared-file section locks, use Markdown merge-plan staging, update workflows, and use Hermes for advisory overlap detection | **implemented** | `wiki/knowledge/project-docs/multi-agent-coordination.md`; `wiki/knowledge/project-docs/agent_local_work.md`; `wiki/knowledge/project-docs/hermes_context_indexer.md`; `harness/project-workflow.md`; `harness/task-packet.md`; `harness/task-decomposition.md`; `templates/agent_role_card.template.md`; `templates/hermes_read_plan.template.md`; `templates/integration_merge_plan.template.md`; `reports/validation/2026-06-12-human-orchestrated-agent-mode.md` |
| **LLMWIKI-032** | **LLM-Wiki architecture snapshot refresh**: update the self-project architecture page to reflect Hermes advisory read planning, LWOE, single `AGENT.md` control cards, human-orchestrated mode, integration ownership, section locks, and Markdown merge-plan staging | **implemented** | `wiki/projects/llm-wiki/wiki/architecture.md`; `reports/validation/2026-06-14-llmwiki-architecture-snapshot-refresh.md` |
| **LLMWIKI-033** | **Wiki link and compile lint expansion**: extend `harness/feedback-loop-lint.sh` to validate compiled entrypoints plus active Markdown wikilinks and inline links; fix current broken active links | **implemented** | `harness/feedback-loop-lint.sh`; `reports/validation/2026-06-14-wiki-link-compile-lint.md` |
| **LLMWIKI-034** | **Agent Coding Pack bootstrap**: require coding agents to load the full coding rule pack once at session/assignment start; distinguish this bounded pack from broad LLM-Wiki lookup; update repo/agent/session templates and result-report evidence | **implemented** | `wiki/knowledge/coding/agent-coding-workflow.md`; `wiki/knowledge/coding/README.md`; `wiki/knowledge/coding/repo-code-rules.md`; `harness/read-workflow.md`; `harness/agent-operating-guide.md`; `templates/repo_rules.template.md`; `templates/agents.template.md`; `templates/agent_role_card.template.md`; `templates/session_start.template.md`; `templates/agent_result_report.template.md`; `reports/validation/2026-06-22-agent-coding-pack-bootstrap.md` |
| **LLMWIKI-035** | **Agent session packs + frontend/UI/contract/operations taxonomy**: define required packing lists by session type, keep Security Baseline always inside Coding Pack, trigger Security Deep Pack only by risk, add frontend/UI/contracts/operations knowledge folders, and update templates/report fields so agents record packs loaded and security impact | **implemented** | `wiki/knowledge/project-docs/agent_session_packs.md`; `wiki/knowledge/frontend/`; `wiki/knowledge/ui/`; `wiki/knowledge/contracts/`; `wiki/knowledge/operations/`; `wiki/knowledge/coding/agent-coding-workflow.md`; `templates/agent_result_report.template.md`; `templates/repo_rules.template.md`; `templates/agents.template.md`; `reports/validation/2026-06-27-agent-session-packs-frontend-ui-security.md` |
| **LLMWIKI-036** | **Agent skill hygiene refactor**: backup and refactor local `architecture-skill` and `vercel-react-best-practices` so active skills contain behavior/procedure and route to LLM-Wiki knowledge instead of carrying duplicate architecture/frontend rule catalogs; add scaffold decision guard | **implemented** | Backup: `archive/agent-skill-backups/2026-06-27/`; live skills: `/home/admindebian/.agents/skills/architecture-skill`, `/home/admindebian/.agents/skills/vercel-react-best-practices`; `reports/validation/2026-06-27-agent-skill-hygiene-refactor.md` |
| **LLMWIKI-037** | **Post-task/project closeout distillation + human-controlled research-on-request**: require agents to run a distillation gate after review and before Done, define project closeout transfer rules for reusable knowledge vs repo-only state, and make internet research a human-controlled protocol rather than autonomous browsing | **implemented** | `wiki/knowledge/project-docs/post_task_distillation.md`; `wiki/knowledge/project-docs/project_closeout_distillation.md`; `harness/auto-research.md`; `research/watchlist.md`; `reports/research/README.md`; `templates/agent_result_report.template.md`; `templates/research_brief.template.md`; `reports/validation/2026-06-27-distillation-closeout-research-on-request.md` |
| **LLMWIKI-038** | **Knowledge pack internet refresh**: after explicit human request, research current official sources and promote concise updates into frontend, UI accessibility, contracts, operations, and security knowledge packs while keeping detailed knowledge in source links | **implemented** | `reports/research/2026-06-27-knowledge-pack-refresh.md`; `wiki/knowledge/frontend/`; `wiki/knowledge/ui/accessibility.md`; `wiki/knowledge/contracts/`; `wiki/knowledge/operations/observability.md`; `wiki/knowledge/coding/security-baseline.md`; `reports/validation/2026-06-27-knowledge-pack-internet-refresh.md` |

## next session work (planned 2026-05-24)

**LLMWIKI-025 LWOE** — measurement framework. **Scope locked 2026-05-23 evening:**

### 11 metrics in scope (6 groups, Tier 1 easy + 6b scope-creep)

| Group | Metric | Code | Difficulty |
|---|---|---|---|
| Token economy | Bootstrap reads (lines/session) | 1a | E |
| Token economy | Total reads/task (lines) | 1b | E |
| Time / iteration | Iterations to `accepted` | 2a | E |
| Time / iteration | Time-to-first-edit | 2c | E |
| Quality | Boundary violation rate | 3a | E |
| Quality | Rework rate (% tasks with ≥2 iterations) | 3b | E |
| Quality | Test/build fail rate at handoff | 3c | E |
| Multi-agent | Conflict rate (conflicts / total tasks) | 4a | E |
| Knowledge lookup | LLM-Wiki consult rate (% tasks) | 5a | E |
| Knowledge lookup | KLM score distribution | 5c | E |
| User experience | Scope-creep events (edits outside Allowed Write Targets, even if intent OK) | 6b | M |

Excluded for this round: 1c re-read rate, 2b send-back reasons, 4b parallel safety violations, 4c contract overwrite events (Tier 2 — deferred). 5b hit rate, 6a user-correction count, 6c clarification questions (Tier 3 — needs manual judgment, deferred).

### Headline format: multi-axis dashboard (no composite score)

Each of the 11 metrics is reported separately. No weighted aggregation. Reasons: richer information, easier to interpret which dimension is improving, no false-precision from arbitrary weights.

Visualization: side-by-side **pre vs post** table per metric. Optional radar chart later if multi-project comparison appears.

### Acceptance threshold: absolute floor + relative improvement (BOTH must hold)

A project is considered "LLM-Wiki proved efficient" only when BOTH conditions hold per metric:

1. **Absolute floor** — meets a hard target. Strawman values (to refine in T5):
   - 1a Bootstrap reads ≤ **330 lines / Lead session** (≤300 / Delegated session).
   - 1b Total reads/task ≤ **800 lines** typical, ≤1500 for L5 accept+rollup.
   - 2a Iterations to accepted ≤ **2** average (some 1, some 3 allowed).
   - 2c Time-to-first-edit ≤ **5 min** for L1, ≤15 min for L3 plan-packet.
   - 3a Boundary violations ≤ **0** per session (any > 0 is a fail).
   - 3b Rework rate ≤ **20%** of tasks.
   - 3c Test/build fail at handoff ≤ **5%** of sessions.
   - 4a Conflict rate ≤ **1 per 20 tasks** = 5%.
   - 5a Consult rate **between 15% and 50%** (too low = ignoring; too high = over-consulting).
   - 5c KLM scores: ≥80% of consults should have score 4-7 (sweet spot); flag if many 0-2 (wasted) or 7-10 (should have asked Lead).
   - 6b Scope-creep events ≤ **1 per 10 tasks** = 10%.

2. **Relative improvement** — improvement over the project's own pre-pattern baseline:
   - 1a, 1b, 2c, 3a, 3b, 3c, 4a, 6b: ≥**30% improvement** vs pre-pattern.
   - 2a, 5a, 5c: directional (closer to target band), no fixed %.

Both conditions must hold for PASS. Either failing = mixed result; document why.

### Sub-tasks

Each sub-task is fully scoped so any agent can execute it without prior session context. Format per task: Dependencies → Required read files → Exact input → Exact output → Allowed/Forbidden write targets → Forbidden side effects → Acceptance criteria → Evidence path. ACID: each T is atomic (one deliverable), has clear I/O, is idempotent (re-running produces the same final file), and decidable (acceptance is binary).

---

#### T1 — Define LWOE metrics formally

- **Status:** planned · **Lane:** normal · **Complexity:** normal
- **Dependencies:** none (entry task).

**Required read files**

- `wiki/projects/llm-wiki/docs/tasks.md` §LLMWIKI-025 — 11-metric scope table and strawman thresholds.
- `wiki/knowledge/project-docs/token-economy-bootstrap.md` — 1a/1b bootstrap and per-task read budget definitions.
- `wiki/knowledge/project-docs/knowledge_lookup_metric.md` — 5a/5c KLM scoring rule and report section requirements.
- `wiki/knowledge/project-docs/multi-agent-coordination.md` — 4a conflict-event definition; file ownership groups.
- `harness/read-workflow.md` — 3a boundary-violation definition (writes outside Allowed Write Targets).
- `templates/agent_result_report.template.md` and `templates/agent_status.template.md` — 2a iteration-count and accepted-state field locations.
- `templates/lesson_filed.template.md` — rework-marker source for 3b.

**Exact input**

- 11 metric codes and one-line definitions already listed in §LLMWIKI-025 (1a, 1b, 2a, 2c, 3a, 3b, 3c, 4a, 5a, 5c, 6b).
- Strawman absolute-floor thresholds in same section (used as initial values; refined later in T5).
- 30% relative-improvement rule (used as initial; may be refined in T5).

**Exact output**

- New file: `wiki/knowledge/project-docs/efficacy_metrics.md` with the following required sections:
  1. Front-matter (`name`, `description`, `status: active`, `date_ingested: 2026-05-24`).
  2. Purpose — one paragraph stating this file owns canonical metric formulas; consumers are T2, T3, T4, T6.
  3. Scope — list 11 in-scope metrics; list Tier 2/3 deferred (1c, 2b, 4b, 4c, 5b, 6a, 6c) with one-line reason each.
  4. Glossary — single-sentence definitions for: session, task, iteration, accepted, boundary violation, conflict, KLM consult, scope-creep event.
  5. Metric reference table — one row per metric; columns: code, name, group, formula, unit, granularity (per-session/per-task/per-project), data source (file path or template field), collection rule (when + by whom).
  6. Per-metric detail subsections (11 total) — full formula, worked example with synthetic numbers, common-mistake list, improvement direction (lower-better / target-band / higher-better).
  7. Cross-links — to `token-economy-bootstrap.md`, `knowledge_lookup_metric.md`, `multi-agent-coordination.md`, `read-workflow.md`.
- One-line pointer added to `wiki/knowledge/project-docs/README.md`.

**Allowed write targets**

- `wiki/knowledge/project-docs/efficacy_metrics.md`
- `wiki/knowledge/project-docs/README.md` (append pointer line only)

**Forbidden write targets**

- `templates/` (T2 owns)
- `reports/validation/` (T3 owns)
- `wiki/projects/llm-wiki/docs/efficacy_dashboard.md` (T6 owns)
- `wiki/projects/llm-wiki/docs/tasks.md` (do not self-edit task table)
- any real-project repo

**Forbidden side effects**

- Do not define the A/B comparison framework — that is T4.
- Do not measure any actual session — that is T3.
- Do not introduce metrics beyond the 11 in scope.
- Do not assign weights or define a composite score (LWOE is explicitly multi-axis).
- Do not change strawman threshold numbers in §LLMWIKI-025; refinement is T5.

**Acceptance criteria**

- [x] File `efficacy_metrics.md` exists with all 7 required sections.
- [x] All 11 metrics have: formula, unit, granularity, data source path, collection rule, improvement direction, worked example.
- [x] No Tier 2/3 metric appears in the metric reference table (only mentioned in scope section as deferred).
- [x] Every cross-link target file exists on disk.
- [x] README pointer added.
- [x] No file outside Allowed Write Targets is modified (verify with `git status`).

**Evidence path**

- File itself; referenced from T3 report and final LLMWIKI-025 wrap-up report.

---

#### T2 — Per-session measurement template

- **Status:** planned · **Lane:** tiny · **Complexity:** simple
- **Dependencies:** T1 (canonical metric list and field names must exist).
- **Parallelizable:** can start once T1 metric reference table is stable.

**Required read files**

- `wiki/knowledge/project-docs/efficacy_metrics.md` (T1 output).
- `templates/session_start.template.md` — existing session-form header fields, for consistency.
- `templates/agent_result_report.template.md` — iteration/acceptance fields to mirror.
- `templates/daily_work_log.template.md` — existing daily form style.
- `templates/README.md` — where new templates are registered.

**Exact input**

- 11 metric codes and canonical formulas from T1.
- Session metadata convention used by existing templates: date, project, agent role, session ID, lane (Lead/Delegated).

**Exact output**

- New file: `templates/lwoe_session_measurement.template.md` with the following required sections:
  1. Header block — fields: `session_id`, `date` (YYYY-MM-DD), `project`, `agent_role` (Lead / Delegated / Codex / Main), `session_lane`, `session_duration_min`, `tasks_in_session` (count).
  2. Per-metric field blocks (11 total) — each block: metric code, measured value, raw evidence (file paths + line numbers / counts the value was derived from), one-line note, anomalies.
  3. Session-level rollup — totals for 1a/1b; counts for 2a/3a/3b/4a/6b; ratio for 3c/5a; distribution sketch for 5c.
  4. Verdict-helper section — left blank; T6 fills PASS/MIXED/FAIL.
  5. Filing instructions block — when (end of session), where (real-repo path vs LLM-Wiki path), retention.
- One-line pointer added to `templates/README.md`.

**Allowed write targets**

- `templates/lwoe_session_measurement.template.md`
- `templates/README.md` (append pointer line only)

**Forbidden write targets**

- `wiki/knowledge/project-docs/` (T1/T4 own)
- `reports/`
- any real-project repo

**Forbidden side effects**

- Do not embed metric formulas inline — reference T1 file instead (template stays skeleton).
- Do not fill any example values that look like real measurements — use `<lines>`, `<count>`, `<value>` placeholders.
- Do not create per-project variants; one template covers all projects.

**Acceptance criteria**

- [x] Template file exists.
- [x] All 11 metrics have a field block whose code/name matches `efficacy_metrics.md`.
- [x] Header carries all 7 metadata fields from Exact output §1.
- [x] Filing instructions block is present.
- [x] No metric formula duplicated inline (reference link to T1 only).
- [x] README pointer added.

**Evidence path**

- First two filled instances live inside T3's baseline report (pre and post). That is the proof-of-shape.

---

#### T3 — Retrospective baseline (UniversityWeb)

- **Status:** planned · **Lane:** normal · **Complexity:** hard (most measurement effort lives here)
- **Dependencies:** T1, T2.
- **Read-only repo:** `/home/admindebian/UniversityWeb/` — read freely, never write.

**Required read files**

LLM-Wiki side:

- `wiki/knowledge/project-docs/efficacy_metrics.md` (T1 formulas).
- `templates/lwoe_session_measurement.template.md` (T2 form to fill twice).

UniversityWeb side (read-only):

- `/home/admindebian/UniversityWeb/docs/decisions.md` — locate ADR-0023; record accepted-date (this is the pre/post cutoff).
- `/home/admindebian/UniversityWeb/docs/session_start.md` — current bootstrap line count (1a post).
- `/home/admindebian/UniversityWeb/docs/agent_status.md` — iteration/handoff state per task (2a).
- `/home/admindebian/UniversityWeb/docs/tasks.md` — task acceptance status, rework markers (2a, 3b).
- `/home/admindebian/UniversityWeb/docs/project_status.md` — session log if present.
- `/home/admindebian/UniversityWeb/reports/validation/2026-05-19-*.md` through `2026-05-23-*.md` — all reports in window (≈35 files; the 5-day list is confirmed available).
- Specifically include: `2026-05-23-bootstrap-token-audit.md` (already audits 1a/1b) and `2026-05-23-llmwiki-024-phase-a-implementation.md` (post-cutoff state).

**Exact input**

- 5-day window: 2026-05-19 inclusive through 2026-05-23 inclusive.
- Cutoff date = ADR-0023 accepted-date, extracted from `decisions.md` during execution. Pre-period = sessions before cutoff; post-period = sessions on/after cutoff.
- For each session in window, derive 11 metric values per T1 formulas.

**Exact output**

- New file: `reports/validation/2026-05-24-lwoe-baseline-universityweb.md` with the following sections:
  1. Header — date, author, scope statement (UniversityWeb only, 5-day retrospective).
  2. Cutoff identification — quote ADR-0023 accepted-date from `decisions.md` with file path + line ref; list pre and post session files explicitly.
  3. Pre-ADR-0023 measurement — fully filled `lwoe_session_measurement.template.md` aggregated across pre-period sessions; per-metric: aggregate value, range, source evidence (paths + line refs).
  4. Post-ADR-0023 measurement — same shape, post-period sessions.
  5. Per-metric side-by-side table — 11 rows; columns: metric code, pre value, post value, delta absolute, delta % (signed).
  6. Data-quality notes — any metric not retrospectively measurable; explicit `needs-review` markers (per `global-rules.md` safety: do not guess).
  7. Findings — 3-5 short bullets on what numbers say. No threshold judgment yet (T5 + T6).

**Allowed write targets**

- `reports/validation/2026-05-24-lwoe-baseline-universityweb.md`

**Forbidden write targets**

- `/home/admindebian/UniversityWeb/**` (read-only; retrospective audit, not a sync)
- `wiki/knowledge/project-docs/efficacy_metrics.md` (T1 owns)
- `wiki/knowledge/project-docs/efficacy_evaluation.md` (T4 owns)
- `wiki/projects/llm-wiki/docs/efficacy_dashboard.md` (T6 owns)
- `templates/`

**Forbidden side effects**

- Do not refine thresholds — T5.
- Do not produce the dashboard — T6.
- Do not extrapolate or fabricate numbers for metrics that cannot be retrospectively measured; mark them `needs-review` and explain why.
- Do not edit ADR-0023 or any UniversityWeb file.
- Do not push or sync to GitHub.

**Acceptance criteria**

- [x] Report file exists with all 7 required sections.
- [x] Cutoff date is quoted with file path + line reference.
- [x] Pre and post measurement instances exist as fully filled T2 templates (or explicit `needs-review` per missing field).
- [x] Side-by-side table has 11 rows.
- [x] Every numeric value cites a source path (and line where applicable).
- [x] `needs-review` count is reported in data-quality section.
- [x] No file under `/home/admindebian/UniversityWeb/` is modified (verify with `git -C /home/admindebian/UniversityWeb status`).

**Evidence path**

- This report itself; referenced from T6 dashboard and final LLMWIKI-025 wrap-up report.

---

#### T4 — A/B comparison framework

- **Status:** planned · **Lane:** normal · **Complexity:** normal
- **Dependencies:** T1 (needs metric semantics). Can run in parallel with T3 once T1 is accepted.

**Required read files**

- `wiki/knowledge/project-docs/efficacy_metrics.md` (T1).
- `wiki/projects/llm-wiki/docs/tasks.md` §LLMWIKI-025 — decision-rule sketch and improvement-direction table.
- `wiki/knowledge/project-docs/definition_of_done.md` — existing PASS/FAIL convention to match.
- `wiki/knowledge/project-docs/validation_report.md` — existing report shape to align with.

**Exact input**

- Decision rule sketched in §LLMWIKI-025: absolute floor AND ≥30% relative improvement (both must hold for PASS; either failing = MIXED; neither = FAIL).
- Per-metric improvement direction: lower-better for 1a/1b/2c/3a/3b/3c/4a/6b; target-band for 2a/5a/5c.

**Exact output**

- New file: `wiki/knowledge/project-docs/efficacy_evaluation.md` with the following sections:
  1. Front-matter and purpose.
  2. When to run — entry conditions (project has both pre-period and post-period sessions; T3-style baseline exists).
  3. Inputs needed — pointer to two filled T2 templates and one T1 file.
  4. Decision rule, formally stated:
     - Lower-better metrics: PASS iff `post ≤ absolute_floor` AND `(pre − post) / pre ≥ 0.30`.
     - Target-band metrics: PASS iff `post` falls inside the band defined in T1/T5; relative-improvement clause is "directional (closer to band centre)".
     - MIXED = exactly one clause holds.
     - FAIL = neither holds.
  5. Dashboard layout spec — 11-row multi-axis table; columns: metric code, group, pre, post, absolute target, delta %, verdict (PASS/MIXED/FAIL), notes. No composite score row. Radar chart explicitly deferred.
  6. Edge cases — small pre-period sample; handling `needs-review` values; rule for re-running after threshold refinement.
  7. Reporting cadence — once per major project pattern change, or on demand.
- One-line pointer added to `wiki/knowledge/project-docs/README.md`.

**Allowed write targets**

- `wiki/knowledge/project-docs/efficacy_evaluation.md`
- `wiki/knowledge/project-docs/README.md` (append pointer line only)

**Forbidden write targets**

- `wiki/knowledge/project-docs/efficacy_metrics.md` (T1 / T5)
- `templates/`
- `reports/`
- `wiki/projects/llm-wiki/docs/`

**Forbidden side effects**

- Do not change strawman thresholds — T5 owns values.
- Do not embed UniversityWeb specifics; framework must be project-agnostic.
- Do not introduce a composite score (explicitly disallowed per §LLMWIKI-025 scope).

**Acceptance criteria**

- [x] File exists with all 7 required sections.
- [x] Decision rule is stated as formal conditions (not prose only).
- [x] Dashboard layout has 11 rows specified with column list.
- [x] No composite score appears anywhere.
- [x] README pointer added.

**Evidence path**

- Used by T6 to lay out the dashboard; linked from final LLMWIKI-025 wrap-up report.

---

#### T5 — Refine acceptance thresholds

- **Status:** planned · **Lane:** tiny · **Complexity:** normal (judgment, not volume)
- **Dependencies:** T1, T3, T4.

**Required read files**

- `wiki/knowledge/project-docs/efficacy_metrics.md` (T1 — current strawman thresholds).
- `reports/validation/2026-05-24-lwoe-baseline-universityweb.md` (T3 — measured reality).
- `wiki/knowledge/project-docs/efficacy_evaluation.md` (T4 — decision-rule context).
- `wiki/projects/llm-wiki/docs/tasks.md` §LLMWIKI-025 (original strawman; do not edit).

**Exact input**

- Strawman absolute-floor thresholds for the 11 metrics (from §LLMWIKI-025).
- Post-period values from T3 baseline.

**Exact output**

- Edit `wiki/knowledge/project-docs/efficacy_metrics.md` (T1) — for each of 11 metrics: either replace strawman threshold with refined value (and add one-line rationale citing T3 numbers), OR keep strawman and add note "strawman retained — within T3 observed range" or "strawman retained — needs more data".
- Add a top-level section `## Threshold revision log (2026-05-24)` to that file with a before → after table for all 11 metrics.
- Do NOT edit `tasks.md` §LLMWIKI-025 strawman — kept as historical record.

**Allowed write targets**

- `wiki/knowledge/project-docs/efficacy_metrics.md` (threshold-related sections + new revision log section only)

**Forbidden write targets**

- `wiki/knowledge/project-docs/efficacy_evaluation.md` (T4 — decision-rule shape, not values)
- `wiki/projects/llm-wiki/docs/tasks.md`
- `reports/`
- `templates/`

**Forbidden side effects**

- Do not change metric formulas, units, or scope.
- Do not introduce or remove metrics.
- Do not invent rationale not backed by T3 numbers — if T3 has insufficient data for a metric, keep strawman and mark `needs more data` explicitly.

**Acceptance criteria**

- [x] Every of 11 metrics has either: a refined threshold with rationale citing T3, OR an explicit "strawman retained" note.
- [x] `## Threshold revision log (2026-05-24)` section exists with before → after table.
- [x] `tasks.md` §LLMWIKI-025 strawman section is untouched.

**Evidence path**

- Threshold revision log section inside `efficacy_metrics.md`; referenced from T6 dashboard.

---

#### T6 — Efficacy dashboard (UniversityWeb first cut)

- **Status:** planned · **Lane:** normal · **Complexity:** normal
- **Dependencies:** T3, T4, T5.

**Required read files**

- `wiki/knowledge/project-docs/efficacy_metrics.md` (post-T5 — refined thresholds).
- `wiki/knowledge/project-docs/efficacy_evaluation.md` (T4 — dashboard layout + decision rule).
- `reports/validation/2026-05-24-lwoe-baseline-universityweb.md` (T3 — pre/post numbers).
- `wiki/projects/llm-wiki/docs/project_status.md` (target file for status update).
- `index.md` (target for pointer update).

**Exact input**

- T3 pre-period and post-period values for the 11 metrics.
- T5 refined absolute-floor thresholds.
- T4 decision rule.

**Exact output**

- New file: `wiki/projects/llm-wiki/docs/efficacy_dashboard.md` with the following sections:
  1. Header — last-updated date, scope (currently UniversityWeb only).
  2. How to read this dashboard — short paragraph + link to T4 evaluation framework.
  3. UniversityWeb pre/post table — 11 rows per T4 layout spec; values populated from T3; verdict column computed per T4 decision rule using T5 thresholds.
  4. Headline verdict — one line per group (6 groups); one line overall (PASS / MIXED / FAIL).
  5. Caveats — list `needs-review` items inherited from T3.
  6. Next measurement plan — single sentence on when to re-measure.
- Update `wiki/projects/llm-wiki/docs/project_status.md` LLMWIKI-025 row → status: implemented; evidence pointers to T1/T2/T3/T4/T5/T6 outputs.
- Update `wiki/projects/llm-wiki/docs/tasks.md` — mark T1–T6 acceptance boxes; flip LLMWIKI-025 status to implemented; add evidence column entry.
- Update `index.md` "LLM-Wiki as a pre-repo project" section: add `- [[wiki/projects/llm-wiki/docs/efficacy_dashboard.md]]`.
- Write final wrap-up validation report `reports/validation/2026-05-24-llmwiki-025-lwoe-implementation.md` linking T1–T6 outputs in one place.

**Allowed write targets**

- `wiki/projects/llm-wiki/docs/efficacy_dashboard.md`
- `wiki/projects/llm-wiki/docs/project_status.md` (LLMWIKI-025 row only)
- `wiki/projects/llm-wiki/docs/tasks.md` (T1–T6 boxes + LLMWIKI-025 row only)
- `index.md` (single pointer addition in existing list)
- `reports/validation/2026-05-24-llmwiki-025-lwoe-implementation.md`

**Forbidden write targets**

- `wiki/knowledge/project-docs/` (T1/T4/T5 own)
- `templates/`
- `reports/validation/2026-05-24-lwoe-baseline-universityweb.md` (T3 owns)
- any real-project repo

**Forbidden side effects**

- Do not re-derive metric values — pull straight from T3.
- Do not invent verdicts beyond what T4's decision rule yields mechanically.
- Do not change thresholds — T5 owns those.
- Do not add a composite score.
- Do not rewrite historical entries in `tasks.md` (only T1–T6 boxes and LLMWIKI-025 row).

**Acceptance criteria**

- [x] Dashboard file exists with all 6 required sections.
- [x] 11 metric rows populated from T3; no blanks except `needs-review` carried forward.
- [x] Verdicts match T4 decision rule applied mechanically (verifiable by re-running the rule on values).
- [x] `project_status.md` LLMWIKI-025 row flipped to implemented.
- [x] `tasks.md` T1–T6 acceptance boxes marked.
- [x] `index.md` has the new pointer line.
- [x] Final wrap-up validation report exists and links T1–T6 outputs.
- [x] No file outside Allowed Write Targets is modified.

**Evidence path**

- `reports/validation/2026-05-24-llmwiki-025-lwoe-implementation.md` is the canonical wrap-up evidence; dashboard file is the live output.

---

**Dependency graph:** T1 → T2 (after T1) → T3 → T4 (after T1, can overlap with T3) → T5 (needs T1, T3, T4) → T6 (needs T3, T4, T5).

**Parallel-safe pairs:** (T2 ∥ T3) and (T4 ∥ T3) once T1 is accepted. All other pairs touch overlapping write targets — must be serialized.

**Boundary rule for any agent picking up these tasks:** if a file you need to write is not in your Allowed Write Targets, stop and emit a `[WIKI-GAP]` report per `global-rules.md` instead of writing.

## deferred project work

- [ ] LLMWIKI-005: Decide migration strategy for legacy `projects/`.
- [ ] LLMWIKI-006: Decide migration/ingest strategy for legacy concept folders.

## optional future improvements

- [x] LLMWIKI-008: Add automated wiki lint/link checker after the manual workflow stays stable.
- [ ] LLMWIKI-010: Add optional compile script for generated wiki indexes.
- [ ] LLMWIKI-013: Add GitHub remote and push public folder.
- [ ] LLMWIKI-019: When GitHub work resumes, review and sync latest local harness/templates into `/home/admindebian/LLM-Wiki-GitHub`.
