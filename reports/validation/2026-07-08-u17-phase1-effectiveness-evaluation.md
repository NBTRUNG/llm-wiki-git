# Validation Report: U17 Phase 1 Effectiveness Evaluation

Date: 2026-07-08

## scope

File back the fresh-session UniversityWeb U17 effectiveness evaluation into
LLM-Wiki live state.

Evaluation target:

- Phase 1 workflow routing.
- Bug-fix funnel.
- Knowledge cache discipline.
- Broad-read avoidance.
- Source-of-truth and claim rules.

Evidence report:

```text
/home/admindebian/UniversityWeb-U17/reports/agent/session-20260707-2217/U17-phase-1-effectiveness-evaluation-result.md
```

## result

Verdict: pass with minor cleanup recommended.

The U17 session started from `AGENTS.md`, loaded the workflow catalog and
real-repo workflow, avoided broad harness/repo/history reads, used the bug-fix
workflow and knowledge cache discipline as triggered knowledge, and preserved
repo source-of-truth/claim boundaries.

Minor drift found:

```text
/home/admindebian/UniversityWeb-U17/agents/OPERATING_GUIDE.md
```

Its Standard Read Order omits the workflow catalog and real-repo workflow step,
although higher-priority U17 entry docs require them.

## changed files

- `wiki/knowledge/project-docs/agent_session_packs.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/current_direction.md`
- `wiki/projects/llm-wiki/docs/checkpoints/workflow-audit-layer.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## file-back

Added a read-order drift check to `agent_session_packs.md`: when a repo entry
route, workflow catalog route, or session-pack rule changes, compare the repo
entry file, repo rules, current-state/TICK file, operating guide, and task
packet instructions.

## token note

Reported U17 evaluation usage:

```text
total=62,175 input=56,605 (+ 258,816 cached) output=5,570 (reasoning 1,480)
```

Reported LLM-Wiki preparation thread usage:

```text
total=514,335 input=460,720 (+ 8,683,008 cached) output=53,615 (reasoning 8,505)
```

Interpretation: the fresh evaluation session was materially smaller than the
long LLM-Wiki preparation thread. This supports using fresh sessions for
evaluation and cache-discipline checks when prior context would bias results.

## contract checks

| contract | result | evidence |
| --- | --- | --- |
| U17 fresh-session evaluation report exists | pass | U17 report path above |
| Phase 1 routing was evaluated | pass | U17 report `Checks` section |
| Bug-fix funnel was evaluated | pass | U17 report `Checks` section |
| Knowledge cache discipline was evaluated | pass | U17 report `Checks` section |
| Broad-read avoidance was evaluated | pass | U17 report `Files intentionally not read` and `Checks` sections |
| Source-of-truth and claim rules were evaluated | pass | U17 report `Checks` section |
| Reusable read-order drift lesson was filed back | pass | `wiki/knowledge/project-docs/agent_session_packs.md` |
| Live state updated, not report-only | pass | `active.md`; `TICK.md`; `tasks.md`; `test_matrix.md`; `reports/validation/README.md` |

## validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 1 warning(s)
```

Warning:

```text
raw holding areas contain 2 file(s); review queue/evidence gate before filing
```

This warning is inherited from the source records intentionally placed under
`raw/research/` in LLMWIKI-068.

## closeout

Next decision: decide whether LLMWIKI-061 workflow contracts are worth piloting
after this pass, or whether the lighter read-order drift checklist is enough
for Phase 1.
