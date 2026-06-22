# test matrix

This file maps LLM-Wiki behavior to proof.

Do not mark a row `implemented` until validation evidence exists or missing proof is explicitly documented.

## status values

| status | meaning |
| --- | --- |
| planned | Accepted as intended behavior, not implemented |
| in_progress | Actively being built |
| implemented | Implemented and proof exists |
| changed | Contract changed after earlier implementation |
| retired | No longer part of the product contract |

## proof layers

| layer | proves |
| --- | --- |
| unit | local markdown/file-level rule or structure check |
| integration | links across constitution/program/harness/templates/project docs |
| e2e | AI can follow the workflow from index to correct source-of-truth |
| platform | local filesystem paths and directories exist |
| release | migration/rollback/smoke check for published structure |
| manual review | admindebian confirms model and docs match intent |

## matrix

| story/task | contract | unit | integration | e2e | platform | release | manual review | status | evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LLMWIKI-BASE | Entry point is a compact map of pointers (no rule duplication) | yes | yes | no | yes | n/a | yes | implemented | `index.md`; `llm-wiki-constitution.md`; `reports/validation/2026-05-23-canonical-consolidation.md` |
| LLMWIKI-CONST | Constitution defines source-of-truth hierarchy and migration rules | yes | yes | no | yes | n/a | yes | implemented | `llm-wiki-constitution.md`; user approval in session |
| LLMWIKI-PROGRAM | Program defines ingest/query/file-back/lint/compile operations | yes | yes | no | yes | n/a | yes | implemented | `program.md`; user approval in session |
| LLMWIKI-TEMPLATES | Templates exist for project docs, tasks, decisions, test matrix, validation, project index | yes | yes | no | yes | n/a | no | implemented | `templates/`; `reports/validation/2026-05-17-llm-wiki-foundation.md` |
| LLMWIKI-HARNESS | Harness canonical lowercase files exist and old uppercase harness files are removed | yes | yes | no | yes | n/a | no | implemented | `harness/`; `reports/validation/2026-05-17-llm-wiki-foundation.md` |
| LLMWIKI-GLOBAL | Global rules include Karpathy-inspired coding style | yes | yes | no | yes | n/a | yes | implemented | `global-rules.md`; `raw/andrej-karpathy-skills-main/` |
| LLMWIKI-PROJECT | LLM-Wiki has pre-repo source-of-truth project docs | yes | yes | yes | yes | n/a | pending | implemented | `wiki/projects/llm-wiki/`; `wiki/index.md`; `reports/validation/2026-05-17-llm-wiki-foundation.md` |
| LLMWIKI-VALIDATION-001 | First validation report exists | yes | yes | n/a | yes | n/a | pending | implemented | `reports/validation/2026-05-17-llm-wiki-foundation.md` |
| LLMWIKI-LINT-001 | First wiki lint report exists | yes | yes | n/a | yes | n/a | pending | implemented | `reports/validation/2026-05-17-llm-wiki-lint.md` |
| LLMWIKI-RAW-001 | Karpathy source is available under raw sources | yes | yes | n/a | yes | n/a | n/a | implemented | `raw/andrej-karpathy-skills-main/`; `raw/README.md` |
| LLMWIKI-BOOTSTRAP-001 | Harness defines manual bootstrap workflow for new pre-repo projects | yes | yes | yes | yes | n/a | pending | implemented | `harness/project-bootstrap.md`; `harness/README.md`; `index.md` |
| LLMWIKI-CONTRACTS-001 | Harness defines ACID task readiness and shared implementation contracts for multi-agent code work | yes | yes | yes | yes | n/a | pending | implemented | `harness/task-decomposition.md`; `harness/task-packet.md`; `templates/contracts.template.md`; public commit `71d1f6a`; `reports/validation/2026-05-19-llm-wiki-task-io.md` |
| LLMWIKI-TASK-IO-001 | Executable tasks require explicit input, output, side effects, and evidence before implementation | yes | yes | yes | yes | n/a | pending | implemented | `harness/task-decomposition.md`; `harness/task-packet.md`; `templates/tasks.template.md`; `reports/validation/2026-05-19-llm-wiki-task-io.md`; GitHub sync deferred |
| LLMWIKI-020 | Selective imported-model ingest, Knowledge Lookup Metric, refreshed visual flows, scaffold examples, and canonical read workflow | yes | yes | yes | yes | n/a | pending | implemented | `harness/read-workflow.md`; `harness/knowledge-lookup-metric.md`; `templates/knowledge_lookup_metric.template.md`; `templates/agent_result_report.template.md`; `wiki/knowledge/coding/`; `wiki/knowledge/project-docs/`; `templates/examples/api-service-scaffold/`; `wiki/concepts/llm-wiki/`; `archive/imported-models/llm-wiki-import-2026-05-22.md`; `reports/validation/2026-05-22-llmwiki-020-standardization.md` |
| LLMWIKI-021 | Remove migrated real-repo payloads so LLM-Wiki remains a reusable knowledge vault | yes | yes | yes | yes | n/a | pending | implemented | `projects/<retained-project>/`; `index.md`; `wiki/index.md`; `global-rules.md`; `llm-wiki-constitution.md`; `program.md`; `harness/project-bootstrap.md`; `reports/validation/2026-05-22-real-repo-payload-cleanup.md` |
| LLMWIKI-022 | Single-canonical principle enforced; file-back infrastructure ready for stage 4 | yes | yes | yes | yes | n/a | yes | implemented | `index.md`; `global-rules.md`; `llm-wiki-constitution.md` (§12, §18, §19); `program.md` (§3, §6); `harness/README.md`; `harness/read-workflow.md`; `templates/lesson_filed.template.md`; `wiki/decisions/_index.md`; `reports/validation/README.md`; `reports/validation/2026-05-23-canonical-consolidation.md` |
| LLMWIKI-023 | Knowledge layer expanded: architecture + security concepts and patterns, Karpathy skill format, multi-agent coordination | yes | yes | yes | yes | n/a | yes | implemented | `wiki/concepts/architecture/` (4 files); `wiki/concepts/security/` (4 files); `wiki/knowledge/architecture-patterns/` (4 files); `wiki/knowledge/coding/karpathy-guidelines.md`; `wiki/knowledge/project-docs/multi-agent-coordination.md`; `templates/agent_role_card.template.md`; `templates/daily_work_log.template.md`; `reports/validation/2026-05-23-external-knowledge-ingest.md` |
| LLMWIKI-024 | Token Economy bootstrap pattern filed back from UniversityWeb ADR-0023 | yes | yes | yes | yes | n/a | yes | implemented | `wiki/knowledge/project-docs/token-economy-bootstrap.md`; `wiki/knowledge/project-docs/session_start.md`; `wiki/knowledge/project-docs/multi-agent-coordination.md`; `harness/read-workflow.md`; `reports/validation/2026-05-23-token-economy-bootstrap-file-back.md` |
| LLMWIKI-025 | LWOE measurement framework and UniversityWeb efficacy dashboard exist | yes | yes | yes | yes | n/a | pending | implemented | `wiki/knowledge/project-docs/efficacy_metrics.md`; `templates/lwoe_session_measurement.template.md`; `wiki/knowledge/project-docs/efficacy_evaluation.md`; `wiki/projects/llm-wiki/docs/efficacy_dashboard.md`; `reports/validation/2026-05-24-llmwiki-025-lwoe-implementation.md` |
| LLMWIKI-026 | Feedback-loop operational support exists for deferred candidates, measurement source fields, bootstrap templates, and lint | yes | yes | yes | yes | n/a | pending | implemented | `harness/feedback-loop.md`; `wiki/projects/llm-wiki/docs/feedback_loop_queue.md`; `templates/agent_result_report.template.md`; `templates/lwoe_session_measurement.template.md`; `templates/agents.template.md`; `templates/lead_state.template.md`; `harness/feedback-loop-lint.sh`; `reports/validation/2026-05-25-feedback-loop-operational-optimization.md` |
| LLMWIKI-027 | Delegated agents can read current task/status without scanning history or Lead state | yes | yes | yes | yes | n/a | pending | implemented | `wiki/knowledge/project-docs/agent_local_work.md`; `wiki/knowledge/project-docs/delegated-packet-rotation.md`; `templates/agent_tasks.template.md`; `templates/agent_status.template.md`; `templates/agent_tasks_archive.template.md`; `templates/agent_role_card.template.md`; `templates/agents.template.md`; `templates/repo_rules.template.md`; `reports/validation/2026-05-25-agent-task-status-read-optimization.md` |
| LLMWIKI-028 | Delegated subagents default to one local `agents/<agent>/AGENT.md` control card; split task/status/archive files are legacy compatibility | yes | yes | yes | yes | n/a | yes | implemented | `wiki/knowledge/project-docs/agent_local_work.md`; `wiki/knowledge/project-docs/multi-agent-coordination.md`; `wiki/knowledge/project-docs/session_start.md`; `templates/agent_role_card.template.md`; `templates/agents.template.md`; `templates/hermes_config.template.md`; `reports/validation/2026-06-11-single-agent-control-card.md` |
| LLMWIKI-029 | Architecture skill and design-system guidance are source-backed and indexed | yes | yes | yes | yes | n/a | yes | implemented | `wiki/knowledge/project-docs/architecture_skill.md`; `wiki/knowledge/project-docs/design_system.md`; `templates/design_system.template.md`; `reports/validation/2026-06-11-architecture-design-system-web-research.md` |
| LLMWIKI-030 | Architecture approach selection guide maps workload shapes to recommended first architecture moves | yes | yes | yes | yes | n/a | yes | implemented | `wiki/knowledge/project-docs/architecture_approach_selection.md`; `reports/validation/2026-06-12-architecture-approach-selection.md` |
| LLMWIKI-031 | Human-orchestrated multi-agent mode lets agents report directly to human with integration owner, shared-file section-lock delegation, Markdown merge-plan staging, workflow updates, and Hermes advisory overlap detection | yes | yes | yes | yes | n/a | yes | implemented | `wiki/knowledge/project-docs/multi-agent-coordination.md`; `wiki/knowledge/project-docs/agent_local_work.md`; `wiki/knowledge/project-docs/hermes_context_indexer.md`; `harness/project-workflow.md`; `harness/task-packet.md`; `harness/task-decomposition.md`; `templates/agent_role_card.template.md`; `templates/hermes_read_plan.template.md`; `templates/integration_merge_plan.template.md`; `reports/validation/2026-06-12-human-orchestrated-agent-mode.md` |
| LLMWIKI-032 | LLM-Wiki self-project architecture snapshot reflects current Hermes, LWOE, single-agent-control-card, and human-orchestrated workflow model | yes | yes | yes | yes | n/a | pending | implemented | `wiki/projects/llm-wiki/wiki/architecture.md`; `reports/validation/2026-06-14-llmwiki-architecture-snapshot-refresh.md` |
| LLMWIKI-033 | Feedback-loop lint also checks compiled entrypoints and active Markdown wiki/inline links | yes | yes | yes | yes | n/a | pending | implemented | `harness/feedback-loop-lint.sh`; `reports/validation/2026-06-14-wiki-link-compile-lint.md` |
| LLMWIKI-034 | Agent coding sessions load a full Coding Pack once at session/assignment start | yes | yes | yes | yes | n/a | yes | implemented | `wiki/knowledge/coding/agent-coding-workflow.md`; `wiki/knowledge/coding/README.md`; `wiki/knowledge/coding/repo-code-rules.md`; `harness/read-workflow.md`; `harness/agent-operating-guide.md`; `templates/repo_rules.template.md`; `templates/agents.template.md`; `templates/agent_role_card.template.md`; `templates/agent_result_report.template.md`; `reports/validation/2026-06-22-agent-coding-pack-bootstrap.md` |

## evidence rules

- A proof column can be `yes`, `no`, or `n/a`.
- If a proof layer is `n/a`, explain why in evidence.
- Do not paste long logs here; link to `reports/validation/` or `logs/test-output/`.
- Session approval can count as manual review only when the user explicitly agreed to the model or artifact.
