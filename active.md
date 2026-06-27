# Active Focus - 2026-06-22

## Current Rule

`active.md` tracks only LLM-Wiki work.

It does not track implementation status, sprint status, task status, or agent assignment for any real project repo. When a project has a repo, update that repo's docs instead.

## Current User Request

Hermes/agent workflow standard expanded 2026-06-12. LLM-Wiki now supports
Lead-orchestrated and Human-orchestrated multi-agent modes. Subagents default to
one `agents/<agent>/AGENT.md` control card and report through `result handoff`.
Humans may directly orchestrate multiple agents; combining outputs requires an
integration owner. Shared-file writes require explicit file/section delegation.
Hermes remains optional, read-only, advisory, and not a source of truth; it may
index section locks and warn about overlap/stale plans, but it must not grant
write permission or store draft content. Draft/proposal staging lives in
Markdown (`AGENT.md`, `reports/agent/`, or
`reports/integration/<task-id>-merge-plan.md`).

Previous focus: LLMWIKI-027 agent task/status read optimization implemented
2026-05-25. Delegated agents now read current assignment/current state cards
instead of scanning full task/status history, accepted packets rotate into
`tasks_archive.md`, and stale delegated read orders no longer include Lead state
by default.

Current work:

- [x] `LLMWIKI-023` external knowledge ingest + Karpathy skill format + multi-agent infrastructure.
- [x] `LLMWIKI-022` single-canonical consolidation + feedback-loop infrastructure.
- [x] `LLMWIKI-024 Phase A+B` lead-efficiency experiment + AI-agnostic bootstrap + Token Economy Law file-back from UniversityWeb ADR-0023 (2026-05-23).
- [x] Backward-pass formalization: `harness/feedback-loop.md` + `wiki/index.md#known-gaps` + anti-pattern sections in 4 harness files (2026-05-23). Evidence: `reports/validation/2026-05-23-feedback-loop-introduction.md`.
- [x] Constitution §18 amendment via DEC-0001 (AI cannot self-apply amendments; procedure linked to feedback-loop.md). Accepted 2026-05-23.
- [x] `LLMWIKI-025 Phase C — LWOE` measurement framework (cycle 1). T1-T6 all implemented. UniversityWeb cycle 1 verdict = NO-DATA overall (5 of 11 metrics lacked instrumentation; 6 measurable cells PASS). Evidence: `reports/validation/2026-05-24-llmwiki-025-lwoe-implementation.md`, `wiki/projects/llm-wiki/docs/efficacy_dashboard.md`.
- [x] `LLMWIKI-026` feedback-loop operational support. Evidence: `reports/validation/2026-05-25-feedback-loop-operational-optimization.md`.
- [x] `LLMWIKI-027` agent task/status read optimization. Evidence: `reports/validation/2026-05-25-agent-task-status-read-optimization.md`.
- [x] Hermes context indexer/read planner standard for optional project adoption. Evidence: `reports/validation/2026-06-11-hermes-context-indexer-standard.md`.
- [x] Draft checkpoint for continuing Hermes/agent workflow discussion. Draft: [2026-06-11-hermes-agent-workflow-draft.md](/home/admindebian/LLM-Wiki/wiki/concepts/llm-wiki/2026-06-11-hermes-agent-workflow-draft.md).
- [x] Single subagent control-card standard: delegated agents now default to one local `agents/<agent>/AGENT.md` file; split `tasks.md`/`status.md`/`tasks_archive.md` are legacy compatibility. Evidence: `reports/validation/2026-06-11-single-agent-control-card.md`.
- [x] Web-researched architecture-skill and design-system guidance added. Evidence: `reports/validation/2026-06-11-architecture-design-system-web-research.md`.
- [x] Workload-based architecture approach selection guide added. Evidence: `reports/validation/2026-06-12-architecture-approach-selection.md`.
- [x] Human-orchestrated multi-agent mode saved: agents may report directly to human when human is orchestrating multiple agents; integration owner required before combining outputs; shared-file write delegation, Markdown merge-plan staging, and Hermes section-lock risk detection added. Evidence: `reports/validation/2026-06-12-human-orchestrated-agent-mode.md`.
- [x] Karpathy guidelines expanded from UniversityWeb APG file-back, translated/generalized to English for reusable agent guidance. Evidence: `reports/validation/2026-06-20-karpathy-guidelines-apg-file-back.md`.
- [x] Large fused UI/code surface policy added after UniversityWeb `_FusedClassDiscovery.cshtml` review; limits new large mixed-concern files, allows stable security/performance-good large files to remain, and requires payoff before no-behavior-change extraction. Evidence: `reports/validation/2026-06-20-large-surface-guard.md`.
- [x] Project bootstrap and agent coding workflow expanded with short operating capsules plus repo/UI-heavy tier files (`REPO_RULES`, `session_start`, `knowledge_lookup_metric`, `code_map`, `agent_work_plan`, `ui_map/*`). Evidence: `reports/validation/2026-06-20-agent-capsules-bootstrap-tiering.md`.
- [x] Output quality gate added beside code-quality after checking Google Engineering Practices, Microsoft SDL, AWS Well-Architected, and Meta code-improvement research. Evidence: `reports/validation/2026-06-20-output-quality-gate.md`.
- [x] Project Orientation and research intake loop added: new projects must answer design-driver questions, select guide packs, record first proof, and check volatile research topics before implementation planning. Evidence: `reports/validation/2026-06-20-project-orientation-research-loop.md`.
- [x] Obsidian graph hygiene added: canonical guides/workflows must be indexed with real links, while templates/reports/archive/raw can be intentional orphans when parent catalogs explain them. Evidence: `reports/validation/2026-06-20-graph-hygiene.md`.
- [x] Agent Coding Pack bootstrap added: coding agents now load the full coding rule pack once at session/assignment start, with narrow non-code exceptions and result-report evidence. Evidence: `reports/validation/2026-06-22-agent-coding-pack-bootstrap.md`.
- [x] Agent session packs + frontend/UI/contracts/operations taxonomy added: agents classify required packs by session type, Coding Pack always carries Security Baseline, Security Deep Pack is trigger-based, and result reports now record packs loaded plus security impact. Evidence: `reports/validation/2026-06-27-agent-session-packs-frontend-ui-security.md`.
- [x] Agent skill hygiene refactor completed: backed up and refactored local `architecture-skill` and `vercel-react-best-practices` so active skills route to LLM-Wiki knowledge instead of carrying duplicate architecture/frontend rule catalogs; scaffold now requires confirmed architecture decision. Evidence: `reports/validation/2026-06-27-agent-skill-hygiene-refactor.md`.
- [x] Post-task/project closeout distillation and human-controlled research-on-request added: agents must run a distillation gate after review and before Done, project closeout transfers reusable knowledge only, and internet research is advisory/on-request rather than autonomous. Evidence: `reports/validation/2026-06-27-distillation-closeout-research-on-request.md`.
- [x] Knowledge pack internet refresh completed on explicit human request: frontend, UI accessibility, contracts, operations, and security packs updated from official sources only. Evidence: `reports/research/2026-06-27-knowledge-pack-refresh.md`, `reports/validation/2026-06-27-knowledge-pack-internet-refresh.md`.

Pause checkpoint - 2026-06-20:

- [x] Work saved and paused after Project Orientation, research intake loop, Output Quality Gate, and Graph Hygiene updates. Validation: `bash harness/feedback-loop-lint.sh` passed with 0 failures / 0 warnings.

Next session work:

- [ ] Continue Hermes work: review the existing Hermes context indexer/read planner standard, the Hermes/agent workflow draft, and decide the remaining canonical workflow updates for Hermes before touching project repos.

- [ ] User plans to deploy the completed Web project to a test server on
  2026-06-15. This is real-repo work, not LLM-Wiki state. When the user resumes
  it, switch to the Web repo, read that repo's source-of-truth docs first, and
  update deployment status in the repo docs instead of `active.md`.
- [ ] Review `wiki/projects/llm-wiki/docs/feedback_loop_queue.md` at the start of the next feedback-loop session.
- [ ] When applying this model to a real project, verify the repo has updated
  `AGENTS.md`, `REPO_RULES.md`, `agents/<agent>/AGENT.md`, and, if needed,
  `docs/hermes.md` / `docs/hermes_read_plan.md` using the new shared-file
  delegation and integration merge-plan rules.
- [ ] **After** a UniversityWeb post-cutoff Lead session runs (live 1a measurement + result-report Measurement fields + `Knowledge lookup` section adoption): open the next LWOE cycle. Update UW row in `wiki/projects/llm-wiki/docs/efficacy_dashboard.md`; classify any regressing metric as `contradiction` via `harness/feedback-loop.md`; classify new reusable patterns as `lesson` filed into `wiki/knowledge/`.
- [ ] When ≥3 projects have run LWOE cycles, re-run T5 (threshold refinement) per `wiki/knowledge/project-docs/efficacy_metrics.md#when-to-re-run-t5`.

Optional follow-ups (low-priority):

- [x] Refresh `wiki/projects/llm-wiki/wiki/architecture.md` to remove the stale architecture snapshot gap and reflect Hermes/LWOE/human-orchestrated workflow updates. Evidence: `reports/validation/2026-06-14-llmwiki-architecture-snapshot-refresh.md`.
- [x] Expand `harness/feedback-loop-lint.sh` into a broader wiki link/compile checker. Evidence: `reports/validation/2026-06-14-wiki-link-compile-lint.md`.
- [ ] When GitHub sync resumes: review/sync latest local harness/templates into `/home/admindebian/LLM-Wiki-GitHub`.

Previous completed work:

- [x] Open `LLMWIKI-020` roadmap/task packet.
- [x] Add `harness/read-workflow.md` to systematize the full LLM-Wiki read process.
- [x] Add canonical Knowledge Lookup Metric guidance/template.
- [x] Selectively ingest imported coding/security/testing guides.
- [x] Selectively ingest DoD/review checklist guidance.
- [x] Preserve imported API scaffold files as examples only.
- [x] Refresh visual flows for the current canonical model.
- [x] Archive or mark imported `llm-wiki/` bundle as non-canonical after ingest.
- [x] Remove migrated real-repo concept/archive/report/diary payloads.
- [x] Keep only a minimal pointer note for the migrated real repo.
- [x] Update control rules to use pointer notes only after repo migration.

Previous completed organization work:

- [x] Split LLM-Wiki workflow rules from repo coding rules.
- [x] Move repo coding rules to `wiki/knowledge/coding/repo-code-rules.md`.
- [x] Create reusable repo-doc standards in `wiki/knowledge/project-docs/`.
- [x] Remove migrated real-repo payloads from LLM-Wiki source-of-truth folders.
- [x] Keep migrated real projects as minimal pointer notes only.
- [x] Separate `templates/` from `wiki/knowledge/project-docs/`.
- [x] Add missing templates and project-doc knowledge guides.
- [x] Update `harness/project-bootstrap.md` for new templates.
- [x] Rewrite `active.md`, `global-rules.md`, `llm-wiki-constitution.md`, and `program.md` to match the final organization model.
- [x] Align `tasks.template.md`, `harness/task-packet.md`, and task decomposition guidance with rich delegated task packet format.
- [x] Align `project_status.template.md`, `wiki/knowledge/project-docs/project_status.md`, and bootstrap validation with expanded project status format.
- [x] Adopt delegated-agent local task/status/result-report model with audit trail.
- [x] Add short repo rule template `templates/repo_rules.template.md` and long-rule escalation triggers.

## Canonical Model

- `global-rules.md`: practical workflow rules for working inside LLM-Wiki.
- `llm-wiki-constitution.md`: stable source-of-truth and lifecycle laws.
- `program.md`: operating procedures for ingest, query, lint, compile, file-back, and validation.
- `active.md`: current LLM-Wiki focus and immediate next step only.
- `wiki/knowledge/`: reusable guidance and durable knowledge.
- `wiki/knowledge/project-docs/`: canonical guidance for repo documentation.
- `wiki/knowledge/coding/agent-coding-workflow.md`: coding-session bootstrap entrypoint.
- `wiki/knowledge/coding/repo-code-rules.md`: general repo coding/review/test rules, loaded as part of the full Coding Pack.
- `templates/`: copyable artifact skeletons only.
- `harness/`: workflows and task/validation operating guides.
- `projects/`: project link notes, one project per folder.
- `wiki/projects/`: source-of-truth only for projects that do not yet have a real repo.
- `archive/`: non-canonical imported/reference material only.
- `reports/validation/`: evidence and review reports.
- `logs/test-output/`: long command/test logs.

## Source Of Truth Reminders

- Current user request wins over this file.
- For LLM-Wiki organization work, update `active.md` and validation evidence immediately after meaningful work.
- For real repo work, update repo `docs/project_status.md`, `docs/tasks.md`, `docs/test_matrix.md`, and `docs/agent_status.md` immediately when state changes.
- Do not keep duplicate editable project docs in LLM-Wiki after repo migration.
- Do not use agent report folders as the active assignment board.

## Evidence

- External knowledge ingest: `reports/validation/2026-05-23-external-knowledge-ingest.md`
- Hermes context indexer standard: `reports/validation/2026-06-11-hermes-context-indexer-standard.md`
- Single-canonical consolidation: `reports/validation/2026-05-23-canonical-consolidation.md`
- Organization validation: `reports/validation/2026-05-21-llm-wiki-organization.md`
- Template/knowledge validation: `reports/validation/2026-05-21-template-knowledge-boundary.md`
- Control files validation: `reports/validation/2026-05-21-control-files-rewrite.md`
- Task packet validation: `reports/validation/2026-05-21-task-packet-format.md`
- Project status validation: `reports/validation/2026-05-21-project-status-format.md`
- Delegated agent model validation: `reports/validation/2026-05-21-delegated-agent-local-state.md`
- LLMWIKI-020 planning/read workflow validation: `reports/validation/2026-05-22-llmwiki-020-roadmap-task-packet.md`
- LLMWIKI-020 standardization validation: `reports/validation/2026-05-22-llmwiki-020-standardization.md`
- LLMWIKI-021 migrated real-repo cleanup validation: `reports/validation/2026-05-22-real-repo-payload-cleanup.md`

## Next Step

1. Do not store active real-repo state in LLM-Wiki; keep only minimal pointer notes and reusable knowledge.
2. Treat Hermes as optional project read-planning infrastructure until project pilots produce evidence.
3. Next Hermes/agent workflow session should focus on applying the new model to
   a real repo pilot: one `AGENT.md` control card, result handoff first,
   Human-orchestrated mode when human directly runs multiple agents,
   integration owner before merge/rollup, shared-file section locks, Markdown
   merge-plan staging, and Hermes advisory overlap detection only.
4. Skill hygiene baseline is now in place for architecture and Vercel React
   skills. Future skill updates should preserve the same rule: behavior and
   pointers in skills, knowledge in LLM-Wiki.

## Latest Checkpoint

- Rewrote the four control files:
  - `active.md`
  - `global-rules.md`
  - `llm-wiki-constitution.md`
  - `program.md`
- New control-file model:
  - `global-rules.md` = practical LLM-Wiki work rules.
  - `llm-wiki-constitution.md` = stable law/source-of-truth/lifecycle boundaries.
  - `program.md` = operating procedures.
  - `active.md` = current LLM-Wiki focus only.
- Stale post-migration guidance in `harness/project-bootstrap.md` was corrected to use minimal `projects/<ProjectName>/` pointer notes.
- Validation evidence created: `reports/validation/2026-05-21-control-files-rewrite.md`.
- LLM-Wiki control-file cleanup is complete for this pass.
- Task packet cleanup checkpoint:
  - `wiki/knowledge/project-docs/tasks.md` now defines canonical section order and write-boundary rules.
  - `templates/tasks.template.md` now matches the delegated task packet style.
  - `harness/task-packet.md` now uses Metadata, Required read files, Exact input/output, write boundaries, report path, and evidence path.
  - `harness/task-decomposition.md`, `templates/implementation_plan.template.md`, and `harness/project-bootstrap.md` were aligned with the same task shape.
  - Validation evidence created: `reports/validation/2026-05-21-task-packet-format.md`.
- Project status cleanup checkpoint:
  - `templates/project_status.template.md` now includes project metadata, Done, Current state, Active tasks, Next steps, Latest validation, Risks and blockers, Recent decisions, Notes for next agent, and Change log.
  - `wiki/knowledge/project-docs/project_status.md` now defines canonical section order, table shapes, change log rule, and consistency checks.
  - `harness/project-bootstrap.md` validation now expects the expanded project status shape.
  - Validation evidence created: `reports/validation/2026-05-21-project-status-format.md`.
- Delegated-agent model checkpoint:
  - Original 2026-05-21 model used split `agents/<agent>/tasks.md` + `status.md`; as of 2026-06-11 the preferred model is one `agents/<agent>/AGENT.md` control card, with split files retained only as legacy compatibility.
  - Added templates: `agent_tasks.template.md`, `agent_status.template.md`, `agent_result_report.template.md`, `repo_rules.template.md`.
  - `repo-code-rules.md` is now part of the full Coding Pack loaded at coding-session start.
  - `docs/agent_status.md` is repo-wide assignment board; `agents/<agent>/status.md` is execution trace.
  - Validation evidence created: `reports/validation/2026-05-21-delegated-agent-local-state.md`.
- `LLMWIKI-020` roadmap/read-workflow checkpoint:
  - Added `LLMWIKI-020` as the current in-progress standardization task.
  - Added `harness/read-workflow.md` as the canonical read path guide.
  - Included `llm_wiki_knowledge_lookup_blueprint.md` as an input source.
  - Planned selective ingest of imported coding/security/testing, DoD/review, API scaffold examples, and refreshed visual flows.
  - Validation evidence created: `reports/validation/2026-05-22-llmwiki-020-roadmap-task-packet.md`.
- `LLMWIKI-020` implementation checkpoint:
  - Added `harness/knowledge-lookup-metric.md`, project-doc guide, and repo template for lookup scoring.
  - Added Knowledge Lookup section to agent result report template and lookup rule to repo rules template.
  - Generalized coding/security/testing guidance into `wiki/knowledge/coding/`.
  - Generalized DoD/review guidance into `wiki/knowledge/project-docs/`.
  - Added API scaffold examples under `templates/examples/api-service-scaffold/`.
  - Added refreshed Mermaid/SVG flows under `wiki/concepts/llm-wiki/`.
  - Marked imported bundle non-canonical under `archive/imported-models/`.
  - Removed empty accidental brace directory under `llm-wiki/`.
  - Validation evidence created: `reports/validation/2026-05-22-llmwiki-020-standardization.md`.
- `LLMWIKI-026` feedback-loop operational checkpoint:
  - Added `wiki/projects/llm-wiki/docs/feedback_loop_queue.md`.
  - Added `harness/feedback-loop.md#deferred-candidate-queue`.
  - Added LWOE Measurement fields to `templates/agent_result_report.template.md`.
  - Added source-report instrumentation to `templates/lwoe_session_measurement.template.md`.
  - Added `templates/agents.template.md` and `templates/lead_state.template.md`.
  - Added `harness/feedback-loop-lint.sh`.
  - Validation evidence created: `reports/validation/2026-05-25-feedback-loop-operational-optimization.md`.
- `LLMWIKI-027` agent task/status read optimization checkpoint:
  - Added Current assignment card and archive pointer table to `templates/agent_tasks.template.md`.
  - Added Current state card and Latest checkpoint to `templates/agent_status.template.md`.
  - Added `templates/agent_tasks_archive.template.md`.
  - Removed delegated Lead-state default reads from repo/agent templates.
  - Updated `agent_local_work.md`, `multi-agent-coordination.md`, `session_start.md`, `agent_status.md`, `tasks.md`, and `delegated-packet-rotation.md`.
  - Extended `harness/feedback-loop-lint.sh` checks.
  - Validation evidence created: `reports/validation/2026-05-25-agent-task-status-read-optimization.md`.
