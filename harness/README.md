# harness

Harness is the operating guide for ai/dev work.

It does not replace:

- `../llm-wiki-constitution.md` for system laws;
- `../program.md` for wiki operations;
- `../templates/` for reusable artifact templates;
- project repo docs after a repo exists.

Harness answers:

```text
what kind of request is this?
how risky is it?
what packet/template should be used?
what proof is required?
when is the work done?
what may ai edit?
```

## read order

See [[read-workflow.md]].

## canonical files

- [intake.md](intake.md): classify request and choose operation.
- [read-workflow.md](read-workflow.md): choose source of truth, selective read path, and LLM-Wiki lookup decision (forward pass: wiki → project).
- [feedback-loop.md](feedback-loop.md): backward pass — flow real-project observations back into wiki/harness/constitution with trigger, classification, evidence gate, and per-class operations.
- [research-intake-loop.md](research-intake-loop.md): keep volatile guidance current through watchlists, research briefs, review, and validation before canonical promotion.
- [auto-research.md](auto-research.md): human-controlled research-on-request protocol for checking current internet sources before advisory briefs or canonical promotion.
- [graph-hygiene.md](graph-hygiene.md): keep Obsidian graph discoverability useful by linking canonical guidance while allowing intentional template/report/archive orphans.
- [knowledge-lookup-metric.md](knowledge-lookup-metric.md): score when real repo work should consult LLM-Wiki.
- [hermes-read-planning.md](hermes-read-planning.md): optional workflow for projects that enable Hermes as a read-only context indexer/read planner.
- [risk-lanes.md](risk-lanes.md): choose tiny/normal/high-risk lane.
- [task-packet.md](task-packet.md): structure work before implementation.
- [test-matrix.md](test-matrix.md): map behavior to proof.
- [validation-report.md](validation-report.md): record validation evidence.
- [done-criteria.md](done-criteria.md): decide whether work is done.
- [agent-operating-guide.md](agent-operating-guide.md): daily loop for ai/dev.
- [project-bootstrap.md](project-bootstrap.md): create pre-repo project source-of-truth docs from templates.
- [project-workflow.md](project-workflow.md): enter and work on existing projects without losing source-of-truth boundaries.
- [task-decomposition.md](task-decomposition.md): split broad project goals into phases, workstreams, tasks, complexity, delegation, ACID checks, and shared contracts.

## local helpers

- `feedback-loop-lint.sh`: filesystem check for feedback-loop queue, LWOE instrumentation fields, bootstrap templates, `confidence_reviewed` coverage, raw holding areas, known-gap rotation size, compiled entrypoints, and active Markdown wiki/inline links.

## operation map

| Request | Read |
| --- | --- |
| New source or document | `../program.md` operation `ingest` |
| User asks from wiki | `../program.md` operation `query` |
| Wiki cleanup | `../program.md` operation `lint` |
| Compile project docs | `../program.md` operation `compile` |
| Choosing what to read | `read-workflow.md` |
| Filing observation back into wiki/harness/constitution | `feedback-loop.md` |
| Refreshing volatile guidance such as deployment, frontend, CMS, security, AI agents, or project orientation | `research-intake-loop.md` + `../research/watchlist.md` |
| Human-requested current-source research | `auto-research.md` + `../research/watchlist.md` |
| Checking Obsidian graph orphan policy | `graph-hygiene.md` |
| Deciding whether repo work should consult LLM-Wiki | `knowledge-lookup-metric.md` |
| Choosing required agent knowledge packs for a session | `../wiki/knowledge/project-docs/agent_session_packs.md` |
| Optional Hermes read planning in a project | `hermes-read-planning.md` |
| Harness/process improvement | `intake.md`, `risk-lanes.md`, `task-packet.md` |
| Broad project planning | `task-decomposition.md` + `../templates/implementation_plan.template.md` |
| New pre-repo project | `project-bootstrap.md` |
| Existing project work | `project-workflow.md` + project source-of-truth docs |
| Multi-agent code work | `task-decomposition.md`, project `docs/contracts.md`, `../templates/tasks.template.md` |
| Validation/review | `test-matrix.md`, `validation-report.md`, `done-criteria.md` |

## guardrails specific to harness work

- Define shared names in repo `docs/contracts.md` before parallel code work.
- Delegate only tasks that are Atomic, have Clear input/output, are Idempotent, and Decidable (ACID).
- Use [[knowledge-lookup-metric.md]] before opening LLM-Wiki during real repo work when architecture, scope, contracts, security, production, or reusable-blueprint context may matter.
- Use [[../wiki/knowledge/project-docs/agent_session_packs.md]] to classify session type and load only the required packs. Coding sessions always include the Security Baseline; use the Security Deep Pack only on trigger.
- Use [[hermes-read-planning.md]] only for projects that explicitly enable Hermes. Hermes is advisory and never overrides repo or LLM-Wiki source-of-truth rules.

For general working rules see [[../global-rules.md]]. For stable laws see [[../llm-wiki-constitution.md]].
