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
| repo code work | `../wiki/knowledge/coding/agent-coding-workflow.md` plus the full Coding Pack it names |
| short repo rules | `repo_rules.template.md` plus `../wiki/knowledge/coding/repo-code-rules.md` |
| LLM-Wiki lookup decision | `knowledge_lookup_metric.template.md` plus `../wiki/knowledge/project-docs/knowledge_lookup_metric.md` |
| validation reports | `../harness/validation-report.md` and `../wiki/knowledge/project-docs/validation_report.md` |
| delegated agent files | `../wiki/knowledge/project-docs/agent_local_work.md` |
| optional Hermes read planner | `hermes_read_plan.template.md`, `hermes_config.template.md`, and `../wiki/knowledge/project-docs/hermes_context_indexer.md` |

## catalog

Project-level skeletons:

- [project_manifest.template.md](project_manifest.template.md): project metadata and source-of-truth pointer.
- [project_brief.template.md](project_brief.template.md): high-level project description and scope.
- [project_orientation.template.md](project_orientation.template.md): pre-project questions, selected design driver, guide pack, first proof, and revision trigger.
- [project_status.template.md](project_status.template.md): living status with done/current/next/risks/changelog.
- [project_index.template.md](project_index.template.md): project read-first map.
- [architecture.template.md](architecture.template.md): component, boundary, and decision summary.
- [design_system.template.md](design_system.template.md): design-system source-of-truth, tokens, components, accessibility, routes/workflows.
- [contracts.template.md](contracts.template.md): shared names, types, and contracts for parallel work.
- [implementation_plan.template.md](implementation_plan.template.md): phases, workstreams, and tasks.
- [tasks.template.md](tasks.template.md): delegated task packet format.
- [decisions.template.md](decisions.template.md): ADR-style decision log.
- [test_matrix.template.md](test_matrix.template.md): behavior-to-proof mapping.
- [validation_report.template.md](validation_report.template.md): evidence record for one work unit.
- [code_map.template.md](code_map.template.md): repo navigation map for runtime entrypoints, features/modules, shared helpers, generated paths, and hotspots.
- [research_brief.template.md](research_brief.template.md): current-research intake record before promoting volatile guidance into canonical docs.

UI map skeletons for UI-heavy repos:

- [ui_map_global.template.md](ui_map_global.template.md): global UI rules and canonical read order.
- [ui_map_contracts.template.md](ui_map_contracts.template.md): canonical UI contract registry.
- [ui_map_index.template.md](ui_map_index.template.md): route-group catalog.
- [ui_map_router.template.md](ui_map_router.template.md): route/runtime-owner map and duplicate-view policy.
- [ui_map_workflow.template.md](ui_map_workflow.template.md): user journeys and interaction patterns.
- [ui_map_group.template.md](ui_map_group.template.md): per-route-group page/panel ownership map.

Delegated-agent local files:

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
- [hermes_read_plan.template.md](hermes_read_plan.template.md): optional read-only Hermes read-plan output.
- [hermes_config.template.md](hermes_config.template.md): optional project config skeleton for Hermes as a derived index/cache.

File-back / lessons:

- [lesson_filed.template.md](lesson_filed.template.md): durable lesson filed from a project into reusable knowledge.

LWOE measurement:

- [lwoe_session_measurement.template.md](lwoe_session_measurement.template.md): per-session form for the 11 LWOE metrics (companion to `../wiki/knowledge/project-docs/efficacy_metrics.md`).

## examples

Examples under `examples/` are scaffold references, not global rules:

- [examples/api-service-scaffold/system-design.example.md](examples/api-service-scaffold/system-design.example.md)
- [examples/api-service-scaffold/data-model.example.md](examples/api-service-scaffold/data-model.example.md)
- [examples/api-service-scaffold/infra-topology.example.md](examples/api-service-scaffold/infra-topology.example.md)

Adapt examples to a project brief, active repo contracts, and accepted
architecture decisions before use.
