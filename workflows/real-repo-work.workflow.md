# workflow: real repo work

## purpose

Use this workflow when the user asks an agent to implement, review, test, or
update work inside a project that already has a real repository.

## trigger

- Code/UI/API/database/test work in a repo.
- Repo task/status update.
- User asks whether a requested repo change is already in the task plan.

## start file

`<repo>/AGENTS.md`

## source of truth

The real repo wins for code, docs, tasks, status, decisions, and test matrix.
LLM-Wiki is a knowledge layer only.

## inputs

- User request.
- Agent capability note and evidence status.
- Task minimum tier, required capability dimensions, context projection,
  autonomy ceiling, verifier, and fallback owner.
- `<repo>/AGENTS.md`
- Repo `TICK.md` or Lead/current-state file.
- Repo `docs/tasks.md`.
- Repo `docs/test_matrix.md` or equivalent.
- Relevant LLM-Wiki knowledge packs only when the repo entry file or task
  triggers them.

## allowed writes

- Repo source code and docs named by the task.
- Repo live state: task/status/test matrix.
- Repo validation reports.
- Agent Platform raw/evidence namespace when the workflow captures raw proof.

## forbidden writes

- Do not store active repo state in LLM-Wiki.
- Do not write raw snapshots into the repo.
- Do not update code before checking task ownership/claim rules when present.

## bounded change fast path

For a small, clear, low-risk change, use the shared Bounded Change Fast Path as
an execution mode inside this workflow. It is not a separate catalog workflow.

- Apply the repo-owned Bounded Change Profile after `AGENTS.md`.
- For code-facing work, load the task-assigned coding floor before editing:
  canonical `P1-BOUNDED-CODING` for qualified `C2-C3` bounded work, or the full
  Coding Pack for eligible `P2` work. Repo maps/profiles do not replace it.
- Use exact map anchors and targeted symbol/selector/route reads before whole
  maps or large files.
- Record actual reads and explain large full-file reads or budget warnings.
- Exit this mode when architecture/contracts, data/schema/migration, auth,
  permissions, sensitive data, dependencies, deployment/live mutation,
  cross-workflow scope, unclear rollback/evidence, or capability mismatch
  appears.
- Never use the fast path to skip required security, validation, human review,
  or source-of-truth rules.

## approval gate

Before normal task approval, stop when:

- the capability profile is missing/expired and the task exceeds `C0`;
- assigned tier or any mandatory capability dimension is below the task;
- assigned context projection exceeds the agent ceiling;
- the agent would need to self-upgrade, broaden autonomy, or invent its own
  knowledge projection.

Request a smaller packet, lower projection, deterministic support, or a
higher-tier/human handoff. Then apply the normal gates below.

Stop for user/Lead/integration-owner approval when:

- the request is not in the current task plan;
- architecture, data contract, permissions, deployment, or sensitive data
  boundaries change;
- a write to live systems or raw source-of-truth data is proposed.

## evidence

Before Done, update repo task/status/test-matrix files and validation evidence.
If reusable knowledge was discovered, propose a separate file-back into
LLM-Wiki instead of mixing it into repo status.

## canonical details

- `../harness/project-workflow.md`
- `../harness/read-workflow.md`
- `../wiki/knowledge/project-docs/agent_session_packs.md`
- `../wiki/knowledge/project-docs/bounded_change_fast_path.md`
