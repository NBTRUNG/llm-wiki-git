# project status

Last updated: 2026-06-22

## overall status

stable/manual-complete; Hermes optional read-planning standard, single subagent control-card standard, source-backed architecture/design-system guidance, workload-based architecture approach selection, human-orchestrated multi-agent mode, current LLM-Wiki architecture snapshot, active Markdown link/entrypoint lint, and full Coding Pack bootstrap for coding agents implemented

## summary

LLM-Wiki foundation is complete at the manual/local-first level. It has a constitution, program, global rules, harness, templates, raw evidence, source-of-truth project docs, validation reports, lint report, manual bootstrap workflow for new pre-repo projects, ACID task decomposition, and shared contracts for multi-agent code work.

`LLMWIKI-020` is implemented locally. The vault now has a canonical read workflow, Knowledge Lookup Metric guidance/template, generalized coding/security/testing guides, generalized DoD/review guides, API scaffold examples, refreshed visual flows, and a clear non-canonical status note for the imported `llm-wiki/` bundle.

`LLMWIKI-021` is implemented locally. Migrated real-repo payloads were removed from LLM-Wiki so the vault remains reusable knowledge, harnesses, templates, and minimal repo pointer notes only.

`LLMWIKI-023` is implemented locally. Knowledge layer expanded with external research: 4 architecture concept files (C4, arc42, quality attributes, ADR), 4 architecture pattern files (layered, hexagonal, microservices, event-driven), 4 security concept files (OWASP Top 10 2025, STRIDE, defense in depth, zero trust). Karpathy skill format adopted: canonical `karpathy-guidelines.md` created + YAML frontmatter added to 7 existing skill-like files. Multi-agent coordination codified from UniversityWeb observations: `multi-agent-coordination.md` master guide + `agent_role_card.template.md` + `daily_work_log.template.md`. All new files carry `confidence: medium, applicable_contexts: pending first project use` discipline markers.

`LLMWIKI-025 LWOE` is implemented locally as cycle 1. The framework now has: 11 metric definitions (`efficacy_metrics.md`), per-session collection template (`lwoe_session_measurement.template.md`), decision-rule + dashboard-layout framework (`efficacy_evaluation.md`), UniversityWeb retrospective baseline (small post-sample), threshold revision log (strawman retained; awaiting more projects), and published dashboard (`efficacy_dashboard.md`). Overall verdict for UniversityWeb cycle 1 is **NO-DATA** because 5 of 11 metrics lack instrumentation in the audited period; quality + multi-agent + user-experience groups PASS. Next cycle requires Knowledge-lookup section rollout to UW result reports and a live post-cutoff Lead bootstrap measurement.

`LLMWIKI-026` is implemented locally. The backward loop now has execution support rather than more policy: `feedback_loop_queue.md` tracks deferred candidates, `agent_result_report.template.md` carries LWOE measurement source fields, `lwoe_session_measurement.template.md` points to those sources, `agents.template.md` and `lead_state.template.md` seed Token Economy bootstrap in future repos, and `harness/feedback-loop-lint.sh` checks the fragile bookkeeping.

`LLMWIKI-027` is implemented locally. Delegated agents now have a bounded read path for their own task/status files: `agent_tasks.template.md` starts with a Current assignment card, Task index, active packet, and archive pointer table; `agent_status.template.md` starts with a Current state card and Latest checkpoint; accepted packet bodies rotate to `tasks_archive.md` using the new `agent_tasks_archive.template.md`. Stale delegated-read templates no longer tell agents to read Lead state by default.

The 2026-06-11 Hermes/agent workflow pass updated the preferred delegated-agent
model: subagents now default to one local file, `agents/<agent>/AGENT.md`, which
contains role, current assignment, active packet, write boundary, checkpoint,
blocker, validation, and handoff sections with explicit Lead-owned vs
agent-owned boundaries. The older per-agent `tasks.md`, `status.md`, and
`tasks_archive.md` files remain legacy compatibility only. Hermes config/read
planning now targets `agents/*/AGENT.md` first.

The 2026-06-11 web-research pass added source-backed guidance for architecture
work and design systems: `architecture_skill.md`, `design_system.md`, and
`design_system.template.md`. Sources include C4, arc42, ADR guidance, CNCF
platforms, OpenTelemetry, DTCG design tokens, WCAG 2.2, WAI-ARIA APG, and
Carbon accessibility guidance.

The 2026-06-12 architecture approach pass added
`architecture_approach_selection.md`, a workload-based chooser for
backend/data-first, API-first, frontend/component-driven, feature/vertical-slice,
BFF, event-first, platform-first, and monolith-first approaches.

The 2026-06-12 multi-agent workflow pass added `Human-orchestrated` mode:
humans may directly run multiple agents and receive their `AGENT.md` result
handoffs. Combining outputs requires an integration owner: human, Lead, or a
named integrator agent. To reduce Lead bottlenecks, humans/integration owners
may grant explicit shared-file write delegation with section/row locks. Hermes
may index those declarations and warn about overlap/staleness, but it remains
advisory and cannot grant write permission. Hermes is not a draft content
store; multi-agent same-section proposals live in Markdown handoffs/reports or
`reports/integration/<task-id>-merge-plan.md`.

The 2026-06-14 architecture snapshot refresh updated the LLM-Wiki self-project
architecture page to reflect Hermes advisory read planning, LWOE measurement,
single `AGENT.md` control cards, Human-orchestrated mode, integration
ownership, shared-file section/row locks, and Markdown merge-plan staging.

The 2026-06-14 wiki lint pass expanded `harness/feedback-loop-lint.sh` so it
now validates compiled entrypoints plus active Markdown wikilinks and inline
links. It also fixed current broken active links in the LWOE efficacy dashboard,
OWASP guide, session-start guide, and Token Economy bootstrap guide.

The 2026-06-22 Agent Coding Pack bootstrap pass changed repo coding workflow
from "read long rules only on escalation" to "load the full Coding Pack once at
session/assignment start" for code, review, refactor, test, validation, or
acceptance work. This is a bounded exception to Token Economy: agents still do
not read full repo history or unrelated LLM-Wiki docs by default. Updated
canonical guidance, repo/agent/session templates, result-report evidence, and
lint coverage.

Constitution §18 was amended 2026-05-23 (DEC-0001 accepted) to link amendment procedure to `harness/feedback-loop.md`; AI is now formally barred from self-applying constitutional amendments.



## in progress

- No active LLM-Wiki standardization task is in progress.

## blockers

- No hard blocker.

## next steps

1. Wait for a fresh UniversityWeb post-cutoff Lead session or another project adopting LWOE, then open the next measured cycle.
2. When GitHub work resumes, review/sync latest local harness/templates into `/home/admindebian/LLM-Wiki-GitHub`, then add remote and push `main` when desired.
3. Optional: add a generated-index compile script for `wiki/index.md` and related summaries.

## latest validation

- Date: 2026-06-22
- Prior checkpoint: 2026-06-20 graph hygiene and 2026-06-14 wiki link/compile lint expansion.
- Scope: Agent Coding Pack bootstrap for repo coding sessions.
- What was checked: coding knowledge entrypoint, repo code rules, read
  workflow, agent operating guide, session/agent/repo templates, result-report
  evidence fields, project docs rollup, validation catalog, and feedback-loop
  lint.
- Result: implemented locally; `harness/feedback-loop-lint.sh` passes with 0 failures and 0 warnings.
- Evidence:
  - `wiki/knowledge/coding/agent-coding-workflow.md`
  - `templates/agent_result_report.template.md`
  - `harness/feedback-loop-lint.sh`
  - `reports/validation/2026-06-22-agent-coding-pack-bootstrap.md`

### prior validation (LLMWIKI-033)

- Date: 2026-06-14
- Prior checkpoint: 2026-06-14 architecture snapshot refresh.
- Scope: wiki link and compile lint expansion.
- What was checked: feedback-loop support files, compiled entrypoints, active
  Markdown wikilinks, active Markdown inline links, confidence-review coverage,
  raw holding areas, and known-gap rotation count.
- Result: implemented locally; `harness/feedback-loop-lint.sh` passes with 0 failures and 0 warnings.
- Evidence:
  - `harness/feedback-loop-lint.sh`
  - `reports/validation/2026-06-14-wiki-link-compile-lint.md`

### prior validation (LLMWIKI-032)

- Date: 2026-06-14
- Prior checkpoint: 2026-06-12 human-orchestrated multi-agent mode.
- Scope: LLM-Wiki self-project architecture snapshot refresh.
- What was checked: `wiki/projects/llm-wiki/wiki/architecture.md`, project
  status/task/test-matrix rollups, validation report catalog, and feedback-loop
  lint.
- Result: implemented locally.
- Evidence:
  - `wiki/projects/llm-wiki/wiki/architecture.md`
  - `reports/validation/2026-06-14-llmwiki-architecture-snapshot-refresh.md`

### prior validation (LLMWIKI-031)

- Date: 2026-06-12
- Prior checkpoint: 2026-06-12 architecture approach selection.
- Scope: human-orchestrated multi-agent mode.
- What was checked: agent-local guidance, multi-agent coordination,
  session-start guidance, Hermes guidance, project workflow, task packet,
  task decomposition, repo/agent templates, integration merge-plan template, and
  feedback-loop lint.
- Result: implemented locally; `harness/feedback-loop-lint.sh` passes with 0 failures and 0 warnings.
- Evidence:
  - `wiki/knowledge/project-docs/agent_local_work.md`
  - `wiki/knowledge/project-docs/multi-agent-coordination.md`
  - `templates/agent_role_card.template.md`
  - `templates/agents.template.md`
  - `templates/integration_merge_plan.template.md`
  - `harness/project-workflow.md`
  - `harness/task-packet.md`
  - `harness/task-decomposition.md`
  - `reports/validation/2026-06-12-human-orchestrated-agent-mode.md`

### prior validation (LLMWIKI-030)

- Date: 2026-06-12
- Prior checkpoint: 2026-06-11 architecture skill and design-system web research
  ingest.
- Scope: workload-based architecture approach selection guide.
- What was checked: new guide, catalog/index links, and feedback-loop lint.
- Result: implemented locally; `harness/feedback-loop-lint.sh` passes with 0 failures and 0 warnings.
- Evidence:
  - `wiki/knowledge/project-docs/architecture_approach_selection.md`
  - `reports/validation/2026-06-12-architecture-approach-selection.md`

### prior validation (LLMWIKI-029)

- Date: 2026-06-11
- Prior checkpoint: 2026-06-11 single subagent control-card standard.
- Scope: architecture skill and design-system web research ingest.
- What was checked: new source-backed knowledge guides, design-system template,
  index/catalog links, and feedback-loop lint.
- Result: implemented locally; `harness/feedback-loop-lint.sh` passes with 0 failures and 0 warnings.
- Evidence:
  - `wiki/knowledge/project-docs/architecture_skill.md`
  - `wiki/knowledge/project-docs/design_system.md`
  - `templates/design_system.template.md`
  - `reports/validation/2026-06-11-architecture-design-system-web-research.md`

### prior validation (LLMWIKI-028)

- Date: 2026-06-11
- Prior checkpoint: 2026-06-11 Hermes context indexer/read planner standard.
- Scope: single subagent control-card standard.
- What was checked: agent-local guidance, multi-agent coordination, session-start guidance, repo rules, task packet/decomposition guidance, Hermes config/read planning, LWOE metrics, and templates.
- Result: implemented locally; `harness/feedback-loop-lint.sh` passes with 0 failures and 0 warnings.
- Evidence:
  - `wiki/knowledge/project-docs/agent_local_work.md`
  - `wiki/knowledge/project-docs/multi-agent-coordination.md`
  - `wiki/knowledge/project-docs/session_start.md`
  - `templates/agent_role_card.template.md`
  - `templates/agents.template.md`
  - `templates/repo_rules.template.md`
  - `templates/hermes_config.template.md`
  - `reports/validation/2026-06-11-single-agent-control-card.md`

### prior validation (LLMWIKI-027)

- Date: 2026-05-25
- Prior checkpoint: 2026-05-25 LLMWIKI-026 feedback-loop operational optimization.
- Scope: `LLMWIKI-027` agent task/status read optimization.
- What was checked: delegated read order in agent-local guidance, multi-agent coordination, session-start guidance, repo/agent templates, task archive rotation, template catalog, and feedback-loop lint coverage.
- Result: implemented locally; `harness/feedback-loop-lint.sh` passes with 0 failures and 0 warnings.
- Evidence:
  - `wiki/knowledge/project-docs/agent_local_work.md`
  - `wiki/knowledge/project-docs/delegated-packet-rotation.md`
  - `wiki/knowledge/project-docs/multi-agent-coordination.md`
  - `templates/agent_tasks.template.md`
  - `templates/agent_status.template.md`
  - `templates/agent_tasks_archive.template.md`
  - `templates/agent_role_card.template.md`
  - `templates/agents.template.md`
  - `templates/repo_rules.template.md`
  - `reports/validation/2026-05-25-agent-task-status-read-optimization.md`

### prior validation (LLMWIKI-026)

- Date: 2026-05-25
- Prior checkpoint: 2026-05-23 backward-pass housekeeping and 2026-05-24 LWOE cycle 1 implementation.
- Scope: `LLMWIKI-026` feedback-loop operational optimization.
- What was checked: deferred queue, feedback-loop procedure link, result-report measurement fields, LWOE source-report fields, Token Economy bootstrap templates, template/readme/project index links, `confidence_reviewed` coverage, raw holding areas, known-gap rotation.
- Result: implemented locally; `harness/feedback-loop-lint.sh` passes with 0 failures and 0 warnings.
- Evidence:
  - `harness/feedback-loop.md#deferred-candidate-queue`
  - `wiki/projects/llm-wiki/docs/feedback_loop_queue.md`
  - `templates/agent_result_report.template.md`
  - `templates/lwoe_session_measurement.template.md`
  - `templates/agents.template.md`
  - `templates/lead_state.template.md`
  - `harness/feedback-loop-lint.sh`
  - `reports/validation/2026-05-25-feedback-loop-operational-optimization.md`

### prior validation (LLMWIKI-025)

- Date: 2026-05-24
- Prior checkpoint: 2026-05-23 (LLMWIKI-022, then feedback-loop introduction + DEC-0001 acceptance)
- Scope: `LLMWIKI-025` LWOE cycle 1 (T1-T6).
- What was checked: efficacy_metrics.md (11 metrics × per-metric subsection + threshold revision log), lwoe_session_measurement.template.md (form completeness), efficacy_evaluation.md (decision rule + dashboard layout), UniversityWeb retrospective baseline (cutoff, pre+post measurement, side-by-side, data-quality notes, findings), threshold revision log (11 metrics × refined-or-retained-with-rationale), efficacy_dashboard.md (11 rows + group verdicts + headline + caveats), status/index/tasks sync.
- Result: `LLMWIKI-025` implemented locally as cycle 1. UniversityWeb overall verdict = NO-DATA (5 of 11 metrics lacked instrumentation in audited period; the 6 measurable cells PASS).
- Evidence:
  - `wiki/knowledge/project-docs/efficacy_metrics.md` (T1)
  - `templates/lwoe_session_measurement.template.md` (T2)
  - `reports/validation/2026-05-24-lwoe-baseline-universityweb.md` (T3)
  - `wiki/knowledge/project-docs/efficacy_evaluation.md` (T4)
  - `wiki/knowledge/project-docs/efficacy_metrics.md#threshold-revision-log-2026-05-24` (T5)
  - `wiki/projects/llm-wiki/docs/efficacy_dashboard.md` (T6 dashboard)
  - `reports/validation/2026-05-24-llmwiki-025-lwoe-implementation.md` (T6 wrap-up)

### prior validation (LLMWIKI-022)

- Date: 2026-05-23
- Scope: `LLMWIKI-022` single-canonical consolidation + feedback-loop infrastructure.
- What was checked: duplicate-content removal across control files, pointer integrity, registry/pointer-note alignment, file-back template + rubric + decisions index + validation reports catalog presence, constitution §19 changelog.
- Result: `LLMWIKI-022` implemented locally. Each row in canonical ownership table has exactly one source-of-truth file.
- Evidence:
  - `reports/validation/2026-05-23-canonical-consolidation.md`
  - `reports/validation/2026-05-23-feedback-loop-introduction.md` (2026-05-23 evening; backward-pass introduction + DEC-0001 acceptance)
  - `reports/validation/2026-05-22-real-repo-payload-cleanup.md`
  - `reports/validation/2026-05-22-llmwiki-020-standardization.md`
  - `reports/validation/2026-05-22-llmwiki-020-roadmap-task-packet.md`
- Gaps:
- Automated feedback-loop lint now checks active Markdown links and compiled entrypoints; a generated-index compile script is still missing.
- Public Git remote is not configured yet.
- 4 LWOE metrics still need instrumentation before cycle 3 PASS verdicts: 1b (per-task line counts via T2 template per-session adoption), 2c (UW `git init` or explicit timestamps in checkpoint log), 5a/5c (broader rollout of Knowledge lookup section across all task result reports — cycle 2 had 1/3 task coverage). 6b-policy filled 2026-05-23 via `harness/task-packet.md` Scope-creep exception field.

## risks

- Legacy `projects/` and new `wiki/projects/` may confuse AI until migration/pointer rules are applied.
- Historical local diary files were removed; current state should live in source-of-truth docs and validation reports.
- Automation is not yet available for generated-index compile.
- Public `.gitignore` intentionally excludes local project/history folders from GitHub.
- Public Git repo exists separately at `/home/admindebian/LLM-Wiki-GitHub`; remote is not configured yet.
- Latest public commit: `71d1f6a Add ACID task contracts`.
- Latest local input/output tightening has not been synced to the public/GitHub folder yet by request.
- Do not run Git push from `/home/admindebian/LLM-Wiki`; push only from `/home/admindebian/LLM-Wiki-GitHub`.

## notes for next agent

- Start from `/home/admindebian/LLM-Wiki/index.md`.
- Current user request overrides `active.md`.
- Do not jump into real project repos unless explicitly asked.
- For LLM-Wiki governance/source-of-truth work, read `llm-wiki-constitution.md`.
- For ingest/query/lint/compile work, read `program.md`.
- For process/task work, read `harness/README.md`.
- For read-path decisions, use `harness/read-workflow.md`.
- For the next standardization pass, start from the implemented `LLMWIKI-020` and `LLMWIKI-021` evidence reports.

## source-of-truth note

- This file is source of truth while LLM-Wiki is in pre-repo phase.
- Do not treat legacy `projects/` entries as source of truth for this LLM-Wiki rebuild.

## done

- Created `llm-wiki-constitution.md`.
- Added selective reading rule to constitution and `index.md`.
- Created `program.md` for ingest/query/file-back/lint/compile operations.
- Created `templates/` with project, task, decision, test matrix, validation, and project index templates.
- Rebuilt `harness/` as canonical lowercase operating guide.
- Renamed `Global_rules.md` to `global-rules.md`.
- Updated `global-rules.md` with Karpathy-inspired coding style.
- Created skeleton folders: `raw/`, `wiki/`, `reports/`, `logs/`.
- Created README files for raw/wiki/reports/logs sections.
- Updated `index.md` as the entry point with compact core rules and links to new structure.
- Created `wiki/projects/llm-wiki/` as pre-repo source of truth.
- Updated `wiki/index.md` with LLM-Wiki project links.
- Created first validation report: `reports/validation/2026-05-17-llm-wiki-foundation.md`.
- Created first manual wiki lint report: `reports/validation/2026-05-17-llm-wiki-lint.md`.
- Updated `active.md` to point future LLM-Wiki work at current source-of-truth docs.
- Historical local diary files were later removed to keep LLM-Wiki focused on durable knowledge and validation evidence.
- Added Karpathy source under `raw/andrej-karpathy-skills-main/`.
- Updated `global-rules.md` and decisions/test matrix to cite the raw Karpathy source.
- Added `harness/project-bootstrap.md` for manual pre-repo project creation from templates.
- Created core completion report: `reports/validation/2026-05-18-llm-wiki-core-completion.md`.
- Prepared GitHub upload scope and `.gitignore`.
- Added `.gitignore` for local agent/runtime state and generated logs.
- Set public Git scope to reusable foundation only: ignore active state, root project notes, project concepts, Obsidian state, validation reports, and local `wiki/projects/<project>/` source-of-truth instances.
- Created clean public folder: `/home/admindebian/LLM-Wiki-GitHub`.
- Initialized separate Git repo in the public folder and created commit `f5b5653 Initial LLM-Wiki foundation`.
- Restored local Obsidian navigation in `index.md` and `wiki/index.md` after creating the separate public folder.
- Removed real Git metadata from `/home/admindebian/LLM-Wiki`; local Obsidian vault is not a Git repository.
- Added `harness/project-workflow.md` for existing project work.
- Synced `harness/project-workflow.md` to public repo commit `94fca56 Add existing project workflow`.
- Added `harness/task-decomposition.md`, `templates/implementation_plan.template.md`, and complexity/delegation fields in `templates/tasks.template.md`.
- Synced task decomposition workflow to public repo commit `d89ea23 Add task decomposition workflow`.
- Added ACID task readiness rules, `docs/contracts.md` shared-name workflow, and `templates/contracts.template.md`.
- Synced ACID/contracts workflow to public repo commit `71d1f6a Add ACID task contracts`.
- Tightened task decomposition and task templates so every executable task must define exact input, output, side effects, and evidence before implementation.
- Created validation report for ACID task readiness, shared contracts, and executable task input/output rules.
- Paused further public/GitHub folder updates until GitHub upload work is explicitly resumed.
- Opened `LLMWIKI-020` roadmap/task packet.
- Added `harness/read-workflow.md` as the canonical read path and LLM-Wiki lookup guide.
- Added `harness/knowledge-lookup-metric.md`, `wiki/knowledge/project-docs/knowledge_lookup_metric.md`, and `templates/knowledge_lookup_metric.template.md`.
- Added Knowledge Lookup section to `templates/agent_result_report.template.md` and lookup rule to `templates/repo_rules.template.md`.
- Generalized imported coding/security/testing content into `wiki/knowledge/coding/`.
- Generalized imported DoD/review content into `wiki/knowledge/project-docs/`.
- Added API scaffold examples under `templates/examples/api-service-scaffold/`.
- Added refreshed Mermaid/SVG flows under `wiki/concepts/llm-wiki/`.
- Marked imported `llm-wiki/` and `llm-wiki.zip` as non-canonical reference inputs in `archive/imported-models/llm-wiki-import-2026-05-22.md`.
- Removed the empty accidental brace directory under `llm-wiki/`.
- Created `reports/validation/2026-05-22-llmwiki-020-standardization.md`.
- Removed migrated real-repo concept/archive/report/diary payloads from LLM-Wiki and kept only a minimal pointer note.
- Updated control rules so migrated real projects keep pointer notes only, not migration-history archives.
- Created `reports/validation/2026-05-22-real-repo-payload-cleanup.md`.
- Enforced single-canonical principle: stripped duplicate SoT hierarchy, folder roles, project phases, read order, checkpoint rule, and risk lanes from `global-rules.md`, `program.md`, `harness/README.md`, and `harness/read-workflow.md`; replaced with pointers to canonical homes.
- Rewrote `index.md` from 139 lines to 48 lines (compact pointer map, pure English).
- Added `templates/lesson_filed.template.md` for stage-4 feedback-loop file-back.
- Added 3-gate file-back rubric (Evidence, Generalization, Source tag) to `program.md §6`.
- Created `wiki/decisions/_index.md` and `reports/validation/README.md` as canonical catalogs.
- Added `templates/README.md` full template bullet catalog.
- Added `§19 changelog` to constitution with 14 historical entries; amended §18 to require future entries.
- Renamed `projects/_registry.md` entry `EFTI_Web` → `UniversityWeb` to match folder and pointer note.
- Migrated `projects/pdf_tool.md` flat file to `projects/pdf_tool/pdf_tool.md` folder form per constitution §11.
- Created `reports/validation/2026-05-23-canonical-consolidation.md`.
- Made `index.md` "How to use" directive (explicit do-not-skip language); added `archive/` and `logs/` to subdir catalogs.
- Added file-back trigger to constitution §15 checkpoint law: work producing reusable knowledge must follow program.md §6 rubric.
- Refreshed `wiki/projects/llm-wiki/wiki/architecture.md` to reflect 4-stage lifecycle, single-canonical principle, and post-consolidation components.
- Added `wiki/concepts/llm-wiki/4-stage-lifecycle.md` as the durable canonical concept doc for the concept → pre-repo → real-repo → file-back loop; updated `wiki/concepts/llm-wiki/README.md`.
- Deleted imported bundle after manual review: `llm-wiki/` (200K) and `llm_wiki_knowledge_lookup_blueprint.md` (12K). Updated `archive/imported-models/llm-wiki-import-2026-05-22.md` to record deletion. Cleared stale references in `wiki/knowledge/project-docs/scaffold_examples.md` and `wiki/concepts/llm-wiki/README.md`.
- LWOE cycle 2 refinement of UniversityWeb dashboard: 1a `projected → measured (328 lines)`; 5a `needs-review → 33.3% (1/3, in band, no-baseline)`; 5c `needs-review → 0/1 in sweet spot (no-baseline)`. No regressions; no new `wiki/knowledge/` files filed (Razor `<partial>` tag-helper finding still deferred per Gate 2). Source: `wiki/projects/llm-wiki/docs/efficacy_dashboard.md` cycle 2 section.
- Backward-pass housekeeping batch (2026-05-23): added `confidence_reviewed` baseline field to all 19 files in `wiki/knowledge/` + `wiki/concepts/` carrying a `confidence:` label; rotated 3 stale "Recently filled" entries out of `wiki/index.md#known-gaps`; added new optional `Scope-creep exception policy` field to `harness/task-packet.md` (closes LWOE 6b interpretation gap surfaced by UW-P3-002 D1-D5); cross-referenced from `efficacy_metrics.md` 6b common-mistakes list. Evidence: `reports/validation/2026-05-23-backward-pass-housekeeping.md`.
- Feedback-loop operational optimization (2026-05-25): added `wiki/projects/llm-wiki/docs/feedback_loop_queue.md`, `harness/feedback-loop.md#deferred-candidate-queue`, LWOE measurement fields in `templates/agent_result_report.template.md`, source-report instrumentation in `templates/lwoe_session_measurement.template.md`, new `templates/agents.template.md` + `templates/lead_state.template.md`, and `harness/feedback-loop-lint.sh`. Evidence: `reports/validation/2026-05-25-feedback-loop-operational-optimization.md`.
- Agent task/status read optimization (2026-05-25): added Current assignment/current state cards to delegated task/status templates, created `agent_tasks_archive.template.md`, aligned delegated read order across project-doc guides and templates, and extended `feedback-loop-lint.sh` checks. Evidence: `reports/validation/2026-05-25-agent-task-status-read-optimization.md`.
- Wiki link/compile lint expansion (2026-06-14): extended `harness/feedback-loop-lint.sh` with compiled entrypoint checks and active Markdown wiki/inline link resolution; fixed broken active links. Evidence: `reports/validation/2026-06-14-wiki-link-compile-lint.md`.
