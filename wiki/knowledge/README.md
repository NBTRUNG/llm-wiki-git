# knowledge

Reusable knowledge and playbooks live here.

Rules:

- Keep each durable idea in one canonical file.
- Use indexes to link, not to duplicate content.
- If a project already has a repo, keep implementation state in the repo and keep reusable lessons here.

## sections

- [project-docs/](project-docs/): standards for repo documentation such as brief, architecture, decisions, contracts, tasks, status, and agent assignment docs.
- [coding/](coding/): repo coding, review, testing, security, and implementation rules.
- [frontend/](frontend/): React, Next.js, browser performance, frontend data, and Web Vitals guidance.
- [ui/](ui/): UI/UX implementation, accessibility, visual quality, interaction patterns, and component contracts.
- [data/](data/): database selection, data modeling, ownership/governance, migration operations, sharding/partitioning, and data performance/scale guidance.
- [algorithms/](algorithms/): trigger-based algorithms, complexity, search/ranking, optimization, parsing/deduplication, and numerical/statistical reasoning guidance.
- [math/](math/): coding-companion knowledge for logical expression, proof, classical mathematical thinking, functions/rates/measurement, discrete math, probability/statistics, optimization, numerical precision, and domain calculations.
- [ai-agent-rag-mcp/](ai-agent-rag-mcp/): AI agents, OKF knowledge substrates, RAG, MCP/tool access, retrieval evaluation, and agent protocol boundaries.
- [mcp-server/](mcp-server/): focused MCP server design, transports, authorization, tools/resources/prompts, security, testing, and operations guidance.
- [agent-errors/](agent-errors/): reusable case studies and prevention rules
  for agent workflow errors, token overuse, broad search loops, and missed
  human checkpoints.
- [security-privacy/](security-privacy/): deep security, threat modeling, identity/access, privacy, supply chain, and incident response guidance.
- [platform-infrastructure/](platform-infrastructure/): runtime, deployment substrate, containers, config/secrets, networking, load balancing, CI/CD, and IaC guidance.
- [reliability-sre/](reliability-sre/): SLO/SLI, health/readiness, resilience, capacity, load balancing, and incident/runbook guidance.
- [content-cms-seo-i18n/](content-cms-seo-i18n/): content modeling, CMS/editorial workflows, SEO, structured data, i18n, migration, redirects, and search guidance.
- [contracts/](contracts/): reusable API, data, event, and integration contract guidance.
- [operations/](operations/): deployment readiness, observability, rollback, and release evidence guidance.
- [architecture-patterns/](architecture-patterns/): architecture pattern catalog and selection matrix.

## important guides

- [project-docs/agent_delivery_workflow.md](project-docs/agent_delivery_workflow.md): canonical six-layer, human-governed path from raw evidence and approval through knowledge, shared/repo-local workflow guidance, orchestration, MCP-backed execution, and review evidence.
- [project-docs/human_agent_hybrid_control.md](project-docs/human_agent_hybrid_control.md): default human-agent operating model separating capability, autonomy, permission, impact, and reversibility while keeping intent, execution, evidence, accountability, and acceptance coupled.
- [project-docs/project_orientation.md](project-docs/project_orientation.md): choose design driver, guide pack, first proof, and research freshness before project implementation planning.
- [project-docs/current_direction.md](project-docs/current_direction.md): short current-direction checkpoints so agents can act as collaborators and librarians for supervisors and new contributors.
- [project-docs/agent_session_packs.md](project-docs/agent_session_packs.md): classify agent sessions and load the required Repo Base, Coding, Security, Web/UI, Architecture, Contracts, and Operations packs.
- [project-docs/agent_capability_tiers.md](project-docs/agent_capability_tiers.md): assign evidence-backed `C0-C6` autonomy envelopes and `P0-P2` knowledge projections so lower-capability agents stop or hand off instead of entering higher-tier flows.
- [project-docs/work_unit_context_budget.md](project-docs/work_unit_context_budget.md): pilot provider-aware session/work-unit measurement, file-backed checkpoints, and provisional warning/restart signals without runtime enforcement.
- [project-docs/codebase_navigation.md](project-docs/codebase_navigation.md): separate authoritative code, stable semantic maps, disposable derived indexes, and session context so tiny changes do not trigger broad documentation write amplification.
- [project-docs/knowledge_cache_discipline.md](project-docs/knowledge_cache_discipline.md): keep a mandatory base literacy layer, load triggered packs on demand, release stale knowledge when the goal changes, and use specialist depth as a mode.
- [project-docs/role_packs.md](project-docs/role_packs.md): compose skills, delivery packs, domain packs, security/privacy rules, and formal/math knowledge into role-based agents.
- [project-docs/open_knowledge_format.md](project-docs/open_knowledge_format.md): OKF-aligned Markdown bundle, TICK entrypoint, and claim/release coordination guidance.
- [project-docs/post_task_distillation.md](project-docs/post_task_distillation.md): require agents to decide whether reusable knowledge should be filed after review and before Done.
- [project-docs/project_closeout_distillation.md](project-docs/project_closeout_distillation.md): close project phases by moving generalized lessons to LLM-Wiki while keeping project state in the repo.
- [project-docs/knowledge_lookup_metric.md](project-docs/knowledge_lookup_metric.md): decide when real repo agents should consult LLM-Wiki.
- [project-docs/architecture_skill.md](project-docs/architecture_skill.md): architecture work/review guide backed by C4, arc42, ADR, CNCF platform, and OpenTelemetry sources.
- [project-docs/architecture_approach_selection.md](project-docs/architecture_approach_selection.md): choose backend-first, data-first, API-first, frontend-first, feature-first, event-first, platform-first, or monolith-first by workload shape.
- [project-docs/platform_upgrade.md](project-docs/platform_upgrade.md): plan major runtime/framework/CMS upgrades and rebuilds with platform/data/schema-first proof, fresh target boundaries, ROI migration, workflow-by-workflow validation, and rollback evidence.
- [project-docs/design_system.md](project-docs/design_system.md): design-system guide for tokens, components, UI contracts, accessibility, and UI-heavy repo maps.
- [architecture-patterns/README.md](architecture-patterns/README.md): architecture pattern catalog and selection matrix.
- [frontend/README.md](frontend/README.md): frontend engineering guide for React, Next.js, browser performance, and data flow.
- [ui/README.md](ui/README.md): UI/UX implementation guide for accessibility, visual quality, interaction patterns, and components.
- [data/README.md](data/README.md): data architecture and database selection knowledge pack.
- [data/database-selection.md](data/database-selection.md): workload-first database/storage selection guide.
- [data/migrations-operations.md](data/migrations-operations.md): migration, import/backfill, CMS/content movement, dry-run, verification, and rollback safety.
- [data/performance-scale.md](data/performance-scale.md): data hot-path, index/cache/replica, sharding/partitioning, and distribution proof guidance.
- [algorithms/README.md](algorithms/README.md): algorithm and math knowledge pack.
- [algorithms/algorithm-selection.md](algorithms/algorithm-selection.md): choose algorithm/library by problem shape, constraints, and proof needs.
- [math/README.md](math/README.md): Coding companion for reasoning navigation, proof, evidence updates, functions/rates/measurement, causal guards, optimization, statistics, and numerical precision.
- [math/reasoning-navigation.md](math/reasoning-navigation.md): select a reasoning mode, manage candidate paths, use verifier feedback, backtrack, and stop or escalate.
- [math/proof-techniques.md](math/proof-techniques.md): normalize claims and quantifiers, select proof methods, write auditable arguments, and connect them to program correctness.
- [math/functions-rates-and-measurement.md](math/functions-rates-and-measurement.md): functions, finite differences/derivatives, sensitivity, measurement contracts, and fair software-efficiency comparisons.
- [ai-agent-rag-mcp/README.md](ai-agent-rag-mcp/README.md): AI agent, OKF, RAG, MCP, and agent protocol pack.
- [ai-agent-rag-mcp/agent-evaluation.md](ai-agent-rag-mcp/agent-evaluation.md): outcome-first, trajectory-aware, repeated-trial evaluation for tool-using agents and MCP workflows.
- [mcp-server/README.md](mcp-server/README.md): specialized pack for MCP server implementation and review.
- [agent-errors/README.md](agent-errors/README.md): agent error case index.
- [agent-errors/internet-search-and-token-budget.md](agent-errors/internet-search-and-token-budget.md): internet-search and token-budget guidance for bug-fix sessions.
- [security-privacy/README.md](security-privacy/README.md): Security Deep + Privacy pack.
- [platform-infrastructure/README.md](platform-infrastructure/README.md): Platform / Infrastructure pack.
- [reliability-sre/README.md](reliability-sre/README.md): Reliability / SRE pack.
- [content-cms-seo-i18n/README.md](content-cms-seo-i18n/README.md): Content / CMS / SEO / i18n pack.
- [contracts/README.md](contracts/README.md): API/data/event contract guidance.
- [operations/README.md](operations/README.md): deployment, observability, and rollback guidance.
- [project-docs/definition_of_done.md](project-docs/definition_of_done.md): evidence-based done criteria.
- [project-docs/review_checklist.md](project-docs/review_checklist.md): review and acceptance checklist.
- [project-docs/scaffold_examples.md](project-docs/scaffold_examples.md): example scaffold boundaries.
- [coding/agent-coding-workflow.md](coding/agent-coding-workflow.md): capability-aware canonical Coding Pack bootstrap, with full `P2` load or validated task-named `P0/P1` projection.
- [coding/bounded-coding-core.md](coding/bounded-coding-core.md): canonical
  cross-repo `P1-BOUNDED-CODING` floor for qualified C2-C3 bounded coding.
- [coding/repo-code-rules.md](coding/repo-code-rules.md): long-form repo coding rules.
- [coding/code-quality.md](coding/code-quality.md): reusable code quality guidance.
- [coding/output-quality.md](coding/output-quality.md): delivery-quality gate for accepted output.
- [coding/implementation-quality-matrix.md](coding/implementation-quality-matrix.md): code, technology, design-system, security, output, and test evidence matrix.
- [coding/security-baseline.md](coding/security-baseline.md): baseline security checks.
- [coding/testing-strategy.md](coding/testing-strategy.md): proof-layer and test strategy guidance.
- [coding/agent-coding-risks.md](coding/agent-coding-risks.md): AI coding-agent risk controls for context injection, excessive agency, false evidence, destructive tool use, data damage, dependency drift, and handoff loss.
