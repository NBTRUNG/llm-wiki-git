# research watchlist

This is the standing watchlist for LLM-Wiki research intake.

Use `harness/research-intake-loop.md` before promoting findings into canonical
guidance.

Use `harness/auto-research.md` only when the human owner or an explicit task
packet asks an agent to check current internet sources for a watchlist topic.
The watchlist cadence is advisory; it does not authorize autonomous browsing.
Research creates advisory briefs first; canonical promotion still requires
validation evidence.

## high-volatility topics

| Topic | Cadence | Why it matters | Canonical targets |
| --- | --- | --- | --- |
| Project orientation taxonomy | quarterly, and before broad new projects | Decides workflow-first/UI-first/API-first/etc. before agents write plans | `wiki/knowledge/project-docs/project_orientation.md`, `templates/project_orientation.template.md` |
| Deployment/runtime models | monthly, and before deployment decisions | VPS/app service/container/Kubernetes/serverless/edge choices age quickly | `wiki/knowledge/project-docs/architecture_approach_selection.md`, `wiki/knowledge/architecture-patterns/`, project orientation |
| Frontend rendering/UI architecture | monthly | SSR/SSG/ISR/SPA/islands/edge choices affect UX, SEO, cost, and complexity | `wiki/knowledge/project-docs/design_system.md`, `ui_map` templates, architecture selection |
| CMS/headless/content architecture | monthly | Content-first projects can be overbuilt or under-modeled | project orientation, contracts, UI map, architecture selection |
| Security/privacy/auth/upload/payment | weekly | High-stakes and fast-changing attack surface | `wiki/knowledge/coding/security-baseline.md`, `output-quality.md`, repo rules |
| AI agents/RAG/evaluation/tool use | weekly | Agent behavior, eval methods, MCP/tooling, and safety patterns change quickly | project orientation, agent workflow, output quality |
| Testing/proof strategy | monthly | Agents need proof that catches regressions, not just passing commands | `wiki/knowledge/coding/testing-strategy.md`, `test_matrix.md`, output quality |
| Observability/operability/platform engineering | monthly | Deployment success depends on logs, traces, health checks, rollback, golden paths | architecture skill, project bootstrap, output quality |
| Code quality and architecture fitness | quarterly | Large-file, boundary, duplicate-logic, and static-analysis rules need refinement | repo rules, task packet, output quality |

## source families

- Standards/specs: ISO, OpenAPI, W3C, OWASP, CNCF, NIST when relevant.
- Ecosystem reports: Stack Overflow Survey, DORA, CNCF reports, Datadog reports.
- Official docs: framework/cloud/project documentation for selected stack.
- Research: peer-reviewed papers or serious preprints with reproducible method.
- Project evidence: validation reports and lessons from real repos.

## pending research ideas

- Compare deployment default choices for small/medium CMS monolith projects.
- Refresh project orientation taxonomy after 3 real project bootstraps.
- Track AI-agent evaluation methods suitable for code-generation workflows.
- Track frontend rendering choices for content-heavy public sites.

## research-on-request rules

- Run only when requested by the human owner, Lead, or task packet.
- Pick one watchlist topic per run.
- Prefer primary/official sources.
- Write the brief under `reports/research/`.
- Promote only through validation report and index updates.
- Queue credible but not-yet-general findings in
  `wiki/projects/llm-wiki/docs/feedback_loop_queue.md`.
