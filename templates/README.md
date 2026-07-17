# templates

Templates are copyable skeletons for project artifacts.

## rule

- Keep templates mostly as headings, fields, tables, and placeholders.
- Keep durable guidance in `../wiki/knowledge/project-docs/`.
- Keep workflow instructions in `../harness/`.
- Do not let templates become policy documents.

## relationship to knowledge

| Template type | Canonical guidance |
| --- | --- |
| project docs | `../wiki/knowledge/project-docs/` |
| repo code work | `../wiki/knowledge/coding/agent-coding-workflow.md` plus the canonical Coding Pack directly for eligible `P2` or its validated task-named `P0/P1` projection |
| short repo rules | `repo_rules.template.md` plus `../wiki/knowledge/coding/repo-code-rules.md` |
| knowledge-pack usage/effectiveness reports | `agent_result_report.template.md` plus `../wiki/knowledge/project-docs/knowledge_effectiveness.md` |
| LLM-Wiki lookup decision | `knowledge_lookup_metric.template.md` plus `../wiki/knowledge/project-docs/knowledge_lookup_metric.md` |
| validation reports | `../harness/validation-report.md` and `../wiki/knowledge/project-docs/validation_report.md` |
| delegated agent files | `../wiki/knowledge/project-docs/agent_local_work.md` |
| agent capability profiles and context/autonomy routing | `agent_capability_profile.template.md` plus `../wiki/knowledge/project-docs/agent_capability_tiers.md` |
| data maps and database inventories | `../wiki/knowledge/project-docs/data_map.md` |
| task/intent/context/knowledge/claims entrypoint | `TICK.template.md` plus `../wiki/knowledge/project-docs/open_knowledge_format.md` |
| repo-local bounded-change coordinates | `bounded_change_profile.template.md` plus `../wiki/knowledge/project-docs/bounded_change_fast_path.md` |
| measured session/work-unit context | `lwoe_session_measurement.template.md` and `agent_result_report.template.md` plus `../wiki/knowledge/project-docs/work_unit_context_budget.md` |
| stable code/panel navigation | `code_map.template.md`, `ui_map_group.template.md`, and `agent_result_report.template.md` plus `../wiki/knowledge/project-docs/codebase_navigation.md` |
| current-direction checkpoints | `current_direction.template.md` plus `../wiki/knowledge/project-docs/current_direction.md` |
| project-local human operation | `human_workflow.template.md` plus `../wiki/knowledge/project-docs/human_workflow.md` |

## catalog

Project-level skeletons:

- [project_manifest.template.md](project_manifest.template.md): project metadata and source-of-truth pointer.
- [project_brief.template.md](project_brief.template.md): high-level project description and scope.
- [project_orientation.template.md](project_orientation.template.md): pre-project questions, selected design driver, guide pack, first proof, and revision trigger.
- [project_status.template.md](project_status.template.md): living status with done/current/next/risks/changelog.
- [current_direction.template.md](current_direction.template.md): short project current-direction/librarian checkpoint for supervisor and new-agent orientation.
- [project_index.template.md](project_index.template.md): project read-first map.
- [architecture.template.md](architecture.template.md): component, boundary, and decision summary.
- [design_system.template.md](design_system.template.md): design-system source-of-truth, tokens, components, accessibility, routes/workflows.
- [contracts.template.md](contracts.template.md): shared names, types, and contracts for parallel work.
- [implementation_plan.template.md](implementation_plan.template.md): phases, workstreams, and tasks.
- [tasks.template.md](tasks.template.md): delegated task packet format.
- [decisions.template.md](decisions.template.md): ADR-style decision log.
- [test_matrix.template.md](test_matrix.template.md): behavior-to-proof mapping.
- [validation_report.template.md](validation_report.template.md): evidence record for one work unit.
- [code_map.template.md](code_map.template.md): repo navigation map for runtime entrypoints, features/modules, stable panel/component source markers, shared helpers, generated paths, and hotspots; no manual offsets.
- [data_map.template.md](data_map.template.md): workflow-first data map from business workflows to code, logical fields, raw database/schema coordinates, and conditional knowledge pointers.
- [database_inventory.template.md](database_inventory.template.md): full/raw schema and query reference opened only by data-map/task anchors.
- [research_brief.template.md](research_brief.template.md): current-research intake record before promoting volatile guidance into canonical docs.
- [TICK.template.md](TICK.template.md): Task, Intent, Context, Knowledge, and Claims entrypoint for git-backed agent/human coordination.
- [bounded_change_profile.template.md](bounded_change_profile.template.md): repo-owned map/command/budget/escalation profile for the shared Bounded Change Fast Path.
- [human_workflow.template.md](human_workflow.template.md): single human operator entrypoint with access, safe lifecycle, persistent data, manual test, and recovery pointers.

UI map skeletons for UI-heavy repos:

- [ui_map_global.template.md](ui_map_global.template.md): global UI rules and canonical read order.
- [ui_map_contracts.template.md](ui_map_contracts.template.md): canonical UI contract registry.
- [ui_map_index.template.md](ui_map_index.template.md): route-group catalog.
- [ui_map_router.template.md](ui_map_router.template.md): route/runtime-owner map and duplicate-view policy.
- [ui_map_workflow.template.md](ui_map_workflow.template.md): user journeys and interaction patterns.
- [ui_map_group.template.md](ui_map_group.template.md): per-route-group page/panel ownership map with stable IDs and exact-searchable source identities for new projects.

Delegated-agent local files:

- [agent_capability_profile.template.md](agent_capability_profile.template.md): evaluated model+harness capability envelope, projection ceiling, evidence, expiry, and session fit declaration.
- [agent_role_card.template.md](agent_role_card.template.md): per-agent `AGENT.md` control card (role, read order, current assignment, active packet, write rules, write boundary, checkpoint, blocker, handoff).
- [agent_tasks.template.md](agent_tasks.template.md): legacy per-agent task list for split-file projects.
- [agent_tasks_archive.template.md](agent_tasks_archive.template.md): legacy append-only archive for accepted delegated packets rotated out of live `tasks.md`.
- [agent_status.template.md](agent_status.template.md): legacy per-agent execution trace for split-file projects.
- [agent_result_report.template.md](agent_result_report.template.md): per-agent task result for handoff.
- [session_start.template.md](session_start.template.md): canonical session-start procedure for every agent (Lead/Delegated/Unavailable).
- [daily_work_log.template.md](daily_work_log.template.md): daily multi-agent rollup at `reports/daily/YYYY-MM-DD.md`.
- [integration_merge_plan.template.md](integration_merge_plan.template.md): merge plan for combining multiple agent outputs before updating a shared canonical file.
- [agent_work_plan.template.md](agent_work_plan.template.md): stable multi-agent delegation policy, file ownership groups, conflict protocol, and report policy.

Repo-level:

- [agents.template.md](agents.template.md): repo entry file with Token Economy bootstrap cheatsheets and AI-agnostic role map.
- [lead_state.template.md](lead_state.template.md): Lead state file skeleton for current phase, next action, live assignments, blockers, reviews, and handoff.
- [repo_rules.template.md](repo_rules.template.md): short repo rule file pointing to long guides.
- [knowledge_lookup_metric.template.md](knowledge_lookup_metric.template.md): per-repo lookup decision scoring.

File-back / lessons:

- [lesson_filed.template.md](lesson_filed.template.md): durable lesson filed from a project into reusable knowledge.

LWOE measurement:

- [lwoe_session_measurement.template.md](lwoe_session_measurement.template.md): per-session form for the 11 LWOE metrics plus an opt-in context-budget pilot extension (companions: `../wiki/knowledge/project-docs/efficacy_metrics.md` and `../wiki/knowledge/project-docs/work_unit_context_budget.md`).

## examples

Examples under `examples/` are scaffold references, not global rules:

- [examples/api-service-scaffold/system-design.example.md](examples/api-service-scaffold/system-design.example.md)
- [examples/api-service-scaffold/data-model.example.md](examples/api-service-scaffold/data-model.example.md)
- [examples/api-service-scaffold/infra-topology.example.md](examples/api-service-scaffold/infra-topology.example.md)

Adapt examples to a project brief, active repo contracts, and accepted
architecture decisions before use.
