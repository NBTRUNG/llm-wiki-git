# global rules for LLM-Wiki

## purpose

This file defines daily working rules for agents operating inside
`/home/admindebian/LLM-Wiki`.

For stable laws (what LLM-Wiki is, source-of-truth hierarchy, folder roles,
project phases, migration, checkpoint), see [[llm-wiki-constitution.md]].

For the canonical read path and source-of-truth decision, see
[[harness/read-workflow.md]].

For operating procedures (ingest, query, lint, compile, file-back, validation),
see [[program.md]].

Repo coding, review, test, and implementation rules live at:

```text
wiki/knowledge/coding/repo-code-rules.md
```

## active.md boundary

Use `active.md` for:

- current LLM-Wiki organization work;
- current harness/template/knowledge cleanup;
- pre-repo concept work when LLM-Wiki is still source of truth;
- immediate next step for the LLM-Wiki vault.

Do not use `active.md` for:

- real repo sprint/task state;
- real repo multi-agent assignments;
- project status after a repo has `docs/project_status.md`.

For real repo status, update the repo files:

```text
<repo>/docs/project_status.md
<repo>/docs/tasks.md
<repo>/docs/test_matrix.md
<repo>/docs/agent_status.md
```

## work rules

- Keep scope tied to the current user request.
- Identify source of truth before editing (see [[llm-wiki-constitution.md#3. source-of-truth hierarchy]]).
- Make small, traceable changes.
- Keep every durable idea in one canonical place. Other files reference, not duplicate.
- Templates stay skeletons; long guidance belongs in knowledge.
- Harness files describe workflow; they should not become project status.
- Reports store evidence/history; they do not replace current status files.
- Mark work done only with proof or documented missing proof.
- Update indexes/read orders when a path or workflow changes.
- Every substantive suggestion or recommendation must include its objective,
  constraints/assumptions, baseline or alternative, mathematical pros and cons,
  evidence/uncertainty, and the sensitivity or revision trigger. If several
  dimensions conflict, show the trade-off or Pareto relation; do not hide a
  hard constraint inside an invented aggregate score. If no disadvantage is
  known under the stated assumptions, say so explicitly instead of omitting
  the `Cons` field.
- Capability-managed agents must follow
  `wiki/knowledge/project-docs/agent_capability_tiers.md`: use only the assigned
  capability envelope and context projection, treat unrated/expired profiles as
  `C0`, and stop or hand off when the task requirement exceeds the envelope.
  Agents may self-downgrade but must never assign or upgrade their own tier.
  Provider name, product tier, parameter count, fluent prose, or a single good
  run is not capability evidence.
- For agent task files, accepted-history archive writes are owned by the Lead /
  review owner, even when the same AI is both implementer and Lead. The
  executing role may prepare status, result report, and archive-row proposal;
  the review role accepts and archives. See
  [[wiki/knowledge/project-docs/delegated-packet-rotation.md#archive-authority-rule]].

## checkpoint

See [[llm-wiki-constitution.md#15. checkpoint law]] for the law.

Practical reminder: do not wait until the end of a long session. Token, power,
or session loss must not lose state.

When the user says "dừng tại đây", "dung tai day", "stop here", or asks to
pause/save, agents must run [[workflows/session-closeout.workflow.md]] before
ending: update live state, task ledger, evidence matrix, report index, and
archive completed task history when the active ledger is over budget.

## wiki-gap reporting

When an agent encounters a situation not covered by any existing wiki rule, use this format to report to the user or main agent:

```text
[WIKI-GAP] <one-line situation description>

Situation: <what happened, what was expected>
Files checked: <list of files already read>
Nearest rule: <closest existing rule, and why it is not enough>
Proposed option A: <description> — pros/cons
Proposed option B: <description> — pros/cons
Decision needed: <specific question>

Waiting for approval before continuing.
```

Do not silently invent a rule or guess when the wiki has no coverage.

## safety

- Do not silently guess missing data.
- Mark low-confidence extraction as `needs-review`.
- Do not overwrite user-reviewed content without a clear reason.
- Store new active raw artifacts under
  `/home/admindebian/Agent-Platform/raw/projects/<project-id>/`; local `raw/` is
  legacy-only. Keep captured raw sources read-only unless explicitly asked.
- Do not push/sync/publish public GitHub output unless the user asks.
- Do not publish local/private paths, `active.md`, raw local concepts, or validation reports without review.
