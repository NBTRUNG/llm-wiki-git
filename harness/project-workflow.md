# project workflow

Use this workflow when entering an existing project from LLM-Wiki.

## purpose

Project workflow helps AI agents enter a project without confusing:

- current user request;
- LLM-Wiki `active.md`;
- LLM-Wiki compiled notes;
- pre-repo project docs;
- repo source-of-truth docs;
- generated reports and logs.

`active.md` is only for LLM-Wiki work. It is not the status board for a project repo.

## source-of-truth rule

For every project request, identify the source of truth before editing.

Use this priority:

1. Current user request.
2. Safety and explicit constraints.
3. Project repo docs, if a repo exists.
4. Project repo wiki/architecture docs.
5. LLM-Wiki project pointer in `projects/`.
6. LLM-Wiki concepts/research/vendors.
7. Model background knowledge.

If project repo docs exist, update those docs first. Do not update LLM-Wiki compiled summaries or `active.md` as the source of truth.

## entry workflow

1. Read `index.md`.
2. Identify the project named or implied by the user.
3. Read the project pointer in `projects/` or `wiki/projects/`.
4. Determine whether a separate repo exists.
5. Read relevant LLM-Wiki knowledge/playbooks for the work type:
   - repo documentation standards: `../wiki/knowledge/project-docs/`
   - repo code rules: `../wiki/knowledge/coding/repo-code-rules.md`
6. If a repo exists, read repo guidance next:
   - `AGENTS.md`
   - `AI_CODEX.md`
   - `docs/project_brief.md` or equivalent
   - `docs/project_status.md`
   - `docs/agent_status.md` if the repo has multi-agent work
   - `docs/contracts.md` if code tasks may touch shared names
   - `docs/tasks.md`
   - `docs/decisions.md`
   - relevant architecture/security/workflow docs
7. If no repo exists, read the pre-repo project docs under `wiki/projects/<project>/`.
8. Classify the request using `intake.md`.
9. Choose a risk lane using `risk-lanes.md`.
10. For implementation work, identify the business workflow ID or
    `CROSS-CUTTING` affected workflows before technical work starts.
11. Check whether the task touches shared names in repo `docs/contracts.md`.
12. Check map references when relevant: UI map, code map, data map, and raw
    verification anchor.
13. For multi-agent or Human-orchestrated work, identify coordination mode,
    review target, integration owner, and any shared-file section/row locks
    before dispatch.
14. Use `TICK.md`, task packets, repo maps, and session packs for read routing.
    Hermes is retired from active LLM-Wiki workflow.
15. For normal/high-risk work, create or mentally follow an ACID task packet
    with workflow ID, workflow slice, user/business outcome, explicit input,
    and explicit output.
16. If multiple agents propose edits to the same shared section/row, require
    Markdown staging in `AGENT.md`, `reports/agent/`, or
    `reports/integration/<task-id>-merge-plan.md`.
17. Make the smallest useful change.
18. Verify with tests, checks, or documented manual review.
19. Update the source-of-truth status/tasks/contracts/decisions/test matrix when the work changes project state.
20. File reusable lessons back into LLM-Wiki knowledge only after they are general, not project-specific.
21. Create a validation report when evidence matters for future sessions.

## allowed write targets

### if repo exists

Allowed by default:

- project repo files needed for the task;
- project repo docs/status/tasks/decisions/test matrix;
- project repo `docs/contracts.md` when shared names change;
- project repo `docs/agent_status.md` when assignments change;
- project repo `reports/integration/` when multiple agent outputs need a merge
  plan before updating a shared source file;
- LLM-Wiki project pointer only when repo path/source-of-truth links changed;
- LLM-Wiki validation report if evidence should live outside the repo.

Not allowed by default:

- duplicate editable project docs under LLM-Wiki;
- LLM-Wiki `active.md` for project implementation status;
- unrelated LLM-Wiki concepts or global rules;
- other project folders.

### if project is pre-repo

Allowed by default:

- `wiki/projects/<project>/project_manifest.md`
- `wiki/projects/<project>/docs/`
- `wiki/projects/<project>/wiki/`
- relevant validation report under `reports/validation/`

Not allowed by default:

- external project repo paths that do not exist yet;
- unrelated project notes;
- broad wiki reorganization.

## project handoff

At the end of a project task, leave enough state for the next AI session:

- current status;
- completed task evidence;
- next action;
- tests/checks run;
- known gaps;
- files changed;
- whether LLM-Wiki project pointer links are stale.

## validation

Minimum project-task validation:

- Source of truth identified.
- Allowed write targets respected.
- Relevant tests/checks run or explicitly not run with reason.
- Task input and output were explicit before implementation.
- Implementation task names a workflow ID or `CROSS-CUTTING` affected workflows.
- Implementation task names a workflow slice and user/business or enabling
  outcome.
- Code tasks that touch shared names reference `docs/contracts.md`.
- Tasks that touch mapped UI/code/data reference the relevant map anchors.
- Delegated tasks pass Atomic, Clear input/output, Idempotent, and Decidable checks.
- Human-orchestrated tasks name review target and integration owner when
  multiple agents contribute to one outcome.
- Shared-file writes name file, section/rows, operation, lock owner, review
  target, and rollback note.
- Retired cache/index systems are not draft content stores.
- Status/task docs updated when project state changed.
- Repo `docs/agent_status.md` updated when assignments changed.
- Validation evidence linked when proof matters.

## stop conditions

Stop and ask or mark `unknown` when:

- source of truth is unclear;
- the project path does not exist;
- repo docs and LLM-Wiki summaries conflict;
- task input or output is unclear;
- implementation task has no business workflow ID, no affected workflow, and no
  explicit reason it is cross-cutting;
- a code task needs a shared function/API/component/CMS alias but no contract row exists;
- a delegated task is not ACID-complete;
- requested scope would touch multiple projects;
- credentials, secrets, production data, or destructive operations are involved.

## non-goals

- Do not migrate a project unless explicitly asked.
- Do not create public GitHub exports from private project notes unless explicitly asked.
- Do not turn a small project request into a wiki cleanup task.

## anti-patterns

Evidence-backed anti-patterns from LLM-Wiki cleanup history. Same `The "..." trap` style as [[../wiki/knowledge/project-docs/multi-agent-coordination.md#anti-patterns]].

- **The "duplicate-editable-docs" trap** — keeping editable copies of repo docs under `wiki/projects/<project>/` after the repo exists. Two source-of-truth files for the same state cause drift; the agent next session does not know which to read. Migration law (§9 of [[../llm-wiki-constitution.md]]) is move-not-copy. Evidence: [[../reports/validation/2026-05-22-real-repo-payload-cleanup.md]].
- **Updating `active.md` with project implementation status** — `active.md` is LLM-Wiki work only; real-repo task status goes in repo `docs/tasks.md`. The boundary is binding per [[../global-rules.md#active-md-boundary]]. Violating it makes `active.md` a sprint board and silently demotes repo docs.
- **The "reflect-the-latest" trap** — updating LLM-Wiki compiled summaries to "stay in sync" with the repo state. Wrong direction: repo docs win; summaries reference, not duplicate. Updating summaries first creates dual-write drift. Evidence: [[../reports/validation/2026-05-23-canonical-consolidation.md]].
- **Reading the entire vault before touching a project** — bootstrap should start from the project pointer in `projects/<ProjectName>/` then escalate by intent (L1 → L2-L6 per Token Economy Law). Reading `wiki/knowledge/` "to have context" burns tokens. Evidence: [[../wiki/knowledge/project-docs/token-economy-bootstrap.md]].
- **Filing project-specific lessons into `wiki/knowledge/` without generalization** — `wiki/knowledge/` is reusable. Project-specific execution details belong in the project repo. The evidence gate in [[feedback-loop.md#evidence-gate]] requires the observation to apply to ≥1 context beyond its source project.
- **Auto-migrating because a repo path appeared** — §9 migration is intentional and asked-for. Do not migrate based on the existence of a repo path; that path may be exploratory or unrelated.
- **Editing repo docs in a `wiki improvement` request (or vice versa)** — the intake classification binds allowed write targets. Cross-boundary edits require new intake. See [[intake.md#hard-rules]].
