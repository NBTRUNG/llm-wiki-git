# project docs knowledge

This folder defines reusable standards for project documentation.

Use these files before creating or reviewing concrete docs inside a real project repo.

The files here describe what each repo doc is for, what good quality looks like, and what mistakes to avoid. They are not project-specific status files.

## canonical repo docs

| Repo doc | Knowledge guide |
| --- | --- |
| six-layer agent delivery, source ownership, gateway/API evolution, shared vs repo-local workflow, and MCP boundary | [agent_delivery_workflow.md](agent_delivery_workflow.md) |
| default human-agent responsibility, autonomy, permission, action-risk, control-point, evidence, and acceptance model | [human_agent_hybrid_control.md](human_agent_hybrid_control.md) |
| shared low-risk small-change execution mode plus repo-owned profile | [bounded_change_fast_path.md](bounded_change_fast_path.md) |
| `project_manifest.md` | [project_manifest.md](project_manifest.md) |
| `docs/project_brief.md` | [project_brief.md](project_brief.md) |
| `docs/project_orientation.md` | [project_orientation.md](project_orientation.md) |
| agent session packing lists by work type | [agent_session_packs.md](agent_session_packs.md) |
| evidence-based agent capability envelopes, context projections, autonomy, and task-fit gates | [agent_capability_tiers.md](agent_capability_tiers.md) |
| knowledge cache discipline: base literacy, map-first lookup, load-on-demand packs, and release-on-goal-change | [knowledge_cache_discipline.md](knowledge_cache_discipline.md) |
| role-based agent composition across skills, packs, domain knowledge, and formal/math knowledge | [role_packs.md](role_packs.md) |
| directory and navigation map naming | [navigation_maps.md](navigation_maps.md) |
| knowledge-pack usefulness and improvement reports | [knowledge_effectiveness.md](knowledge_effectiveness.md) |
| OKF/TICK git-backed knowledge and claim/release coordination | [open_knowledge_format.md](open_knowledge_format.md) |
| post-task distillation gate | [post_task_distillation.md](post_task_distillation.md) |
| project closeout distillation | [project_closeout_distillation.md](project_closeout_distillation.md) |
| `wiki/architecture.md` | [architecture.md](architecture.md) |
| architecture skill / architecture review workflow | [architecture_skill.md](architecture_skill.md) |
| architecture approach selection by workload | [architecture_approach_selection.md](architecture_approach_selection.md) |
| major runtime/framework/CMS upgrade or rebuild planning | [platform_upgrade.md](platform_upgrade.md) |
| AI agents, RAG, MCP, and agent protocol pack | [../ai-agent-rag-mcp/README.md](../ai-agent-rag-mcp/README.md) |
| Security Deep + Privacy pack | [../security-privacy/README.md](../security-privacy/README.md) |
| Platform / Infrastructure pack | [../platform-infrastructure/README.md](../platform-infrastructure/README.md) |
| Reliability / SRE pack | [../reliability-sre/README.md](../reliability-sre/README.md) |
| Content / CMS / SEO / i18n pack | [../content-cms-seo-i18n/README.md](../content-cms-seo-i18n/README.md) |
| data architecture and database selection pack | [../data/README.md](../data/README.md) |
| algorithm/math selection pack | [../algorithms/README.md](../algorithms/README.md) |
| formal/math analytical pack | [../math/README.md](../math/README.md) |
| `docs/design_system.md` or UI design-system docs | [design_system.md](design_system.md) |
| `docs/decisions.md` | [decisions.md](decisions.md) |
| `docs/contracts.md` | [contracts.md](contracts.md) |
| `docs/data_map.md` and raw schema inventories | [data_map.md](data_map.md) |
| `docs/implementation_plan.md` | [implementation_plan.md](implementation_plan.md) |
| `docs/tasks.md` | [tasks.md](tasks.md) |
| `docs/test_matrix.md` | [test_matrix.md](test_matrix.md) |
| `docs/project_status.md` | [project_status.md](project_status.md) |
| repo `HUMAN.md` or pre-repo `docs/human_workflow.md` | [human_workflow.md](human_workflow.md) |
| `docs/current_direction.md` or current-direction section | [current_direction.md](current_direction.md) |
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
| Work-unit context budget and file-backed checkpoint pilot | [work_unit_context_budget.md](work_unit_context_budget.md) |
| codebase navigation, semantic maps, derived indexes, and documentation write amplification | [codebase_navigation.md](codebase_navigation.md) |
| LWOE — LLM-Wiki Operational Efficacy: 11 metric definitions (formulas, units, collection rules) | [efficacy_metrics.md](efficacy_metrics.md) |
| LWOE — A/B evaluation framework: decision rule, dashboard layout, edge cases | [efficacy_evaluation.md](efficacy_evaluation.md) |
| project link/index notes | [project_index.md](project_index.md) |
| validation reports | [validation_report.md](validation_report.md) |
| repo overrides such as `AGENTS.md` | [real_repo_overrides.md](real_repo_overrides.md) |
| repo entry + Lead state bootstrap skeletons | [token-economy-bootstrap.md](token-economy-bootstrap.md) |

## rule

Concrete project docs live in the project repo after a repo exists.

LLM-Wiki keeps the documentation standards and reusable lessons.

Templates in `../../../templates/` are skeletons. These knowledge files are the canonical guidance.
