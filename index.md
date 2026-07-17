# LLM-Wiki — Master Index

LLM-Wiki is a knowledge and operating vault for AI-assisted work. It captures
concepts, pre-repo project source-of-truth, harness, templates, and evidence.
When a project has a real repo, the repo wins; LLM-Wiki keeps only a pointer.

## How to use this wiki

For LLM-Wiki work, start with this file first. Then use
[[workflows/catalog.md]] to choose the audit workflow. Open
[[harness/read-workflow.md]] when the selected workflow needs detailed
source-of-truth, read-path, or knowledge-lookup rules.

Human-readable map: [[human/README.md]]. If agents or automation are
unavailable, start at [[RECOVERY.md]]. Agents normally select workflows without
showing a full menu and name `Workflow used` at handoff.

Architecture thinking tutorial: [[tutorial_brief.md]]

## LLM-Wiki Agent Delivery Workflow

Canonical name: **LLM-Wiki Agent Delivery Workflow** — **Quy trình giao việc
cho Agent của LLM-Wiki**. It is a six-layer, human-governed agentic workflow:

```text
Evidence / Raw truth
  -> Approval / WAP
  -> Knowledge / LLM-Wiki
  -> Guidance / shared workflows + repo-local workflows
  -> Orchestration / human now, Gateway/API when justified
  -> Execution / worker -> MCP adapter -> services/tools
```

LLM-Wiki owns reusable knowledge and shared workflows. Real repos own current
implementation state and project-specific workflows. Agent Platform owns
active raw/evidence, WAP, gateway runtime, and audit artifacts.

Canonical model: [[wiki/knowledge/project-docs/agent_delivery_workflow.md]]

## Control files (root)

- [[active.md]] — current LLM-Wiki focus only
- [[TICK.md]] — current task, intent, context, knowledge route, and claim/release state
- [[llm-wiki-constitution.md]] — stable laws (source of truth, lifecycle, migration)
- [[global-rules.md]] — daily work rules
- [[program.md]] — operating procedures
- [[wiki/knowledge/project-docs/navigation_maps.md]] — map naming and directory cleanup rules
- [[wiki/projects/llm-wiki/docs/current_direction.md]] — current direction map; read before reconstructing from archive/history

## Projects

- [[projects/README.md]]
- [[projects/_registry.md]]
- [[projects/pdf_tool/pdf_tool.md]]
- [[projects/UniversityWeb/UniversityWeb.md]]

## LLM-Wiki as a pre-repo project (self-hosted source of truth)

- [[wiki/projects/llm-wiki/docs/project_index.md]] — detailed LLM-Wiki project map
- [[wiki/projects/llm-wiki/project_manifest.md]]
- [[wiki/projects/llm-wiki/docs/project_brief.md]]
- [[wiki/projects/llm-wiki/docs/project_status.md]]
- [[wiki/projects/llm-wiki/docs/current_direction.md]]
- [[wiki/projects/llm-wiki/docs/tasks.md]]
- [[wiki/projects/llm-wiki/docs/decisions.md]]
- [[wiki/projects/llm-wiki/docs/test_matrix.md]]
- [[wiki/projects/llm-wiki/docs/efficacy_dashboard.md]]
- [[wiki/projects/llm-wiki/docs/feedback_loop_queue.md]]
- [[wiki/projects/llm-wiki/wiki/architecture.md]]

Root `index.md` stays the workspace map. Project-specific issues, tasks, status,
validation, and architecture notes should link back here directly or through the
project map above.

## Agent Platform Runtime

- [[agent-platform/README.md]] — pointer to the external Agent Platform root
- Active platform root: `/home/admindebian/Agent-Platform`
- Raw namespace pattern: `/home/admindebian/Agent-Platform/raw/projects/<project-id>/`
- WAP proposals: `/home/admindebian/Agent-Platform/wap/proposals/`
- Audit log: `/home/admindebian/Agent-Platform/audit/events.jsonl`

LLM-Wiki is the knowledge/workflow vault. The Agent Platform owns raw snapshots,
derived indexes, gateway scripts, WAP proposals, and audit events.

## Subdirectory catalogs (pointers)

- Harness operating guides: [[harness/README.md]]
- Workflow audit catalog: [[workflows/README.md]]
- Human workflow/knowledge/manual-mode map: [[human/README.md]]
- Manual recovery router: [[RECOVERY.md]]
- Graph hygiene: [[harness/graph-hygiene.md]]
- Templates: [[templates/README.md]]
- Knowledge: [[wiki/knowledge/README.md]]
- Agent session packs: [[wiki/knowledge/project-docs/agent_session_packs.md]]
- Canonical bounded coding projection:
  [[wiki/knowledge/coding/bounded-coding-core.md]] (`P1-BOUNDED-CODING`)
- Agent Delivery Workflow: [[wiki/knowledge/project-docs/agent_delivery_workflow.md]]
- Default Human-Agent Hybrid Control: [[wiki/knowledge/project-docs/human_agent_hybrid_control.md]]
- Bounded Change Fast Path: [[wiki/knowledge/project-docs/bounded_change_fast_path.md]]
- Work-unit context budget pilot: [[wiki/knowledge/project-docs/work_unit_context_budget.md]]
- Codebase navigation and derived indexes: [[wiki/knowledge/project-docs/codebase_navigation.md]]
- Agent capability tiers/projections: [[wiki/knowledge/project-docs/agent_capability_tiers.md]]
- Post-task distillation: [[wiki/knowledge/project-docs/post_task_distillation.md]]
- Project closeout distillation: [[wiki/knowledge/project-docs/project_closeout_distillation.md]]
- Project orientation guide: [[wiki/knowledge/project-docs/project_orientation.md]]
- Architecture skill guide: [[wiki/knowledge/project-docs/architecture_skill.md]]
- Architecture approach selection: [[wiki/knowledge/project-docs/architecture_approach_selection.md]]
- Design system guide: [[wiki/knowledge/project-docs/design_system.md]]
- Architecture patterns: [[wiki/knowledge/architecture-patterns/README.md]]
- Frontend engineering: [[wiki/knowledge/frontend/README.md]]
- UI/UX implementation: [[wiki/knowledge/ui/README.md]]
- Contract knowledge: [[wiki/knowledge/contracts/README.md]]
- Data knowledge: [[wiki/knowledge/data/README.md]]
- Algorithms knowledge: [[wiki/knowledge/algorithms/README.md]]
- Math / Formal Analysis: [[wiki/knowledge/math/README.md]]
- AI / Agent / RAG / MCP: [[wiki/knowledge/ai-agent-rag-mcp/README.md]]
- MCP Server: [[wiki/knowledge/mcp-server/README.md]]
- Agent error cases: [[wiki/knowledge/agent-errors/README.md]]
- Security / Privacy: [[wiki/knowledge/security-privacy/README.md]]
- Platform / Infrastructure: [[wiki/knowledge/platform-infrastructure/README.md]]
- Reliability / SRE: [[wiki/knowledge/reliability-sre/README.md]]
- Content / CMS / SEO / i18n: [[wiki/knowledge/content-cms-seo-i18n/README.md]]
- Operations knowledge: [[wiki/knowledge/operations/README.md]]
- Concepts: [[wiki/concepts/README.md]]
- Education platform concepts: [[wiki/concepts/education-platforms/README.md]]
- Architecture concepts: [[wiki/concepts/architecture/README.md]]
- Security concepts: [[wiki/concepts/security/README.md]]
- Decisions: [[wiki/decisions/_index.md]]
- Vendors: [[wiki/vendors/README.md]]
- Research: [[wiki/research/README.md]]
- Research watchlist node: [[research/README.md]]
- Research watchlist: [[research/watchlist.md]]
- Research-on-request loop: [[harness/auto-research.md]]
- Research reports: [[reports/research/README.md]]
- Validation reports: [[reports/validation/README.md]]
- Legacy raw holdings: [[raw/README.md]]
- Reports overview: [[reports/README.md]]
- Archive (historical, non-canonical material): [[archive/README.md]]
- Test/command logs: [[logs/]]

## Compiled wiki

- [[wiki/index.md]]
