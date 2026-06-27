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
- [contracts/](contracts/): reusable API, data, event, and integration contract guidance.
- [operations/](operations/): deployment readiness, observability, rollback, and release evidence guidance.
- [architecture-patterns/](architecture-patterns/): architecture pattern catalog and selection matrix.

## important guides

- [project-docs/project_orientation.md](project-docs/project_orientation.md): choose design driver, guide pack, first proof, and research freshness before project implementation planning.
- [project-docs/agent_session_packs.md](project-docs/agent_session_packs.md): classify agent sessions and load the required Repo Base, Coding, Security, Web/UI, Architecture, Contracts, and Operations packs.
- [project-docs/post_task_distillation.md](project-docs/post_task_distillation.md): require agents to decide whether reusable knowledge should be filed after review and before Done.
- [project-docs/project_closeout_distillation.md](project-docs/project_closeout_distillation.md): close project phases by moving generalized lessons to LLM-Wiki while keeping project state in the repo.
- [project-docs/knowledge_lookup_metric.md](project-docs/knowledge_lookup_metric.md): decide when real repo agents should consult LLM-Wiki.
- [project-docs/architecture_skill.md](project-docs/architecture_skill.md): architecture work/review guide backed by C4, arc42, ADR, CNCF platform, and OpenTelemetry sources.
- [project-docs/architecture_approach_selection.md](project-docs/architecture_approach_selection.md): choose backend-first, data-first, API-first, frontend-first, feature-first, event-first, platform-first, or monolith-first by workload shape.
- [project-docs/design_system.md](project-docs/design_system.md): design-system guide for tokens, components, UI contracts, accessibility, and UI-heavy repo maps.
- [architecture-patterns/README.md](architecture-patterns/README.md): architecture pattern catalog and selection matrix.
- [frontend/README.md](frontend/README.md): frontend engineering guide for React, Next.js, browser performance, and data flow.
- [ui/README.md](ui/README.md): UI/UX implementation guide for accessibility, visual quality, interaction patterns, and components.
- [contracts/README.md](contracts/README.md): API/data/event contract guidance.
- [operations/README.md](operations/README.md): deployment, observability, and rollback guidance.
- [project-docs/definition_of_done.md](project-docs/definition_of_done.md): evidence-based done criteria.
- [project-docs/review_checklist.md](project-docs/review_checklist.md): review and acceptance checklist.
- [project-docs/scaffold_examples.md](project-docs/scaffold_examples.md): example scaffold boundaries.
- [coding/agent-coding-workflow.md](coding/agent-coding-workflow.md): required full Coding Pack bootstrap for code/review/refactor/test/validation sessions.
- [coding/repo-code-rules.md](coding/repo-code-rules.md): long-form repo coding rules.
- [coding/code-quality.md](coding/code-quality.md): reusable code quality guidance.
- [coding/output-quality.md](coding/output-quality.md): delivery-quality gate for accepted output.
- [coding/implementation-quality-matrix.md](coding/implementation-quality-matrix.md): code, technology, design-system, security, output, and test evidence matrix.
- [coding/security-baseline.md](coding/security-baseline.md): baseline security checks.
- [coding/testing-strategy.md](coding/testing-strategy.md): proof-layer and test strategy guidance.
