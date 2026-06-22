# project docs knowledge

This folder defines reusable standards for project documentation.

Use these files before creating or reviewing concrete docs inside a real project repo.

The files here describe what each repo doc is for, what good quality looks like, and what mistakes to avoid. They are not project-specific status files.

## canonical repo docs

| Repo doc | Knowledge guide |
| --- | --- |
| `project_manifest.md` | [project_manifest.md](project_manifest.md) |
| `docs/project_brief.md` | [project_brief.md](project_brief.md) |
| `docs/project_orientation.md` | [project_orientation.md](project_orientation.md) |
| `wiki/architecture.md` | [architecture.md](architecture.md) |
| architecture skill / architecture review workflow | [architecture_skill.md](architecture_skill.md) |
| architecture approach selection by workload | [architecture_approach_selection.md](architecture_approach_selection.md) |
| `docs/design_system.md` or UI design-system docs | [design_system.md](design_system.md) |
| `docs/decisions.md` | [decisions.md](decisions.md) |
| `docs/contracts.md` | [contracts.md](contracts.md) |
| `docs/implementation_plan.md` | [implementation_plan.md](implementation_plan.md) |
| `docs/tasks.md` | [tasks.md](tasks.md) |
| `docs/test_matrix.md` | [test_matrix.md](test_matrix.md) |
| `docs/project_status.md` | [project_status.md](project_status.md) |
| `docs/agent_status.md` | [agent_status.md](agent_status.md) |
| `docs/knowledge_lookup_metric.md` | [knowledge_lookup_metric.md](knowledge_lookup_metric.md) |
| project or task definition of done | [definition_of_done.md](definition_of_done.md) |
| review checklist | [review_checklist.md](review_checklist.md) |
| scaffold examples | [scaffold_examples.md](scaffold_examples.md) |
| `agents/<agent>/AGENT.md`, `reports/agent/<agent>/...` | [agent_local_work.md](agent_local_work.md) |
| legacy `agents/<agent>/tasks.md`, `status.md`, `tasks_archive.md` packet rotation | [delegated-packet-rotation.md](delegated-packet-rotation.md) |
| multi-agent coordination (independent groups, parallelization, conflict protocol, AI-agnostic Lead role, rotation handoff) | [multi-agent-coordination.md](multi-agent-coordination.md) |
| `docs/session_start.md` — canonical session-start procedure for every agent (Token Economy Law, L1-L6 Lead sub-branches, AI-agnostic Lead handoff) | [session_start.md](session_start.md) |
| Token Economy bootstrap pattern (hoist L1 cheatsheet into entry file, AI-agnostic, ≤330 lines/Lead session) | [token-economy-bootstrap.md](token-economy-bootstrap.md) |
| LWOE — LLM-Wiki Operational Efficacy: 11 metric definitions (formulas, units, collection rules) | [efficacy_metrics.md](efficacy_metrics.md) |
| LWOE — A/B evaluation framework: decision rule, dashboard layout, edge cases | [efficacy_evaluation.md](efficacy_evaluation.md) |
| project link/index notes | [project_index.md](project_index.md) |
| validation reports | [validation_report.md](validation_report.md) |
| repo overrides such as `AGENTS.md` | [real_repo_overrides.md](real_repo_overrides.md) |
| repo entry + Lead state bootstrap skeletons | [token-economy-bootstrap.md](token-economy-bootstrap.md) |
| optional Hermes context indexer / read planner | [hermes_context_indexer.md](hermes_context_indexer.md) |

## rule

Concrete project docs live in the project repo after a repo exists.

LLM-Wiki keeps the documentation standards and reusable lessons.

Templates in `../../../templates/` are skeletons. These knowledge files are the canonical guidance.
