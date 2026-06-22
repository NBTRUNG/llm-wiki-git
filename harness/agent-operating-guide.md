# agent operating guide

This is the daily loop for ai/dev work.

## start

1. Read `../index.md`.
2. Follow [[read-workflow.md]] universal start.
3. Classify current request.
4. Read only relevant files.
5. Identify source of truth.
6. Choose risk lane.
7. Read relevant LLM-Wiki knowledge/playbooks for the work type.
8. For repo code work, read repo `AGENTS.md` and `REPO_RULES.md` first when present.
9. For any coding session, read the full `../wiki/knowledge/coding/` Coding Pack once at session/assignment start.
10. For delegated repo work, read `agents/<agent>/AGENT.md`, then task `Required read files`.

## execute

1. Use the smallest useful change.
2. Do not expand scope silently.
3. Do not use LLM-Wiki `active.md` as project repo status.
4. Do not write duplicate source-of-truth files.
5. Do not invent shared names when a contract row should exist.
6. For delegated work, keep the task Atomic, Clear input/output, Idempotent, and Decidable.
7. Run or define validation.
8. Record uncertainty as `unknown`, `needs-review`, `stale`, or `contradiction`.

## finish

1. Update the correct source-of-truth files.
2. Update test matrix if behavior/proof changed.
3. Create validation report if evidence is meaningful.
4. Link evidence instead of pasting long logs.
5. State changed files, checks, gaps, and next action.

## checkpoint rule

Do not wait until the end of a long session to write status.

After each meaningful unit of work:

1. Update the relevant source-of-truth status file.
2. Record evidence or missing evidence.
3. Record next action/blocker.

For LLM-Wiki work, update `active.md` and validation evidence when durable state changes. For delegated repo work, update the agent-owned checkpoint sections of `agents/<agent>/AGENT.md` and create `reports/agent/<agent>/<task-id>-result.md` when the report threshold is met; Codex/main rolls accepted state into repo-wide docs.

## read map

| Situation | Read |
| --- | --- |
| Source-of-truth or migration question | `../llm-wiki-constitution.md` |
| Repo code work | repo `AGENTS.md`, `REPO_RULES.md`, Lead state for Lead work, assigned `agents/<agent>/AGENT.md` for delegated work, plus full `../wiki/knowledge/coding/` Coding Pack |
| Coding Pack | `../wiki/knowledge/coding/agent-coding-workflow.md`, `karpathy-guidelines.md`, `repo-code-rules.md`, `code-quality.md`, `output-quality.md`, `security-baseline.md`, `testing-strategy.md` |
| Repo docs creation/review | `../wiki/knowledge/project-docs/`, repo docs |
| Ingest/query/lint/compile | `../program.md` |
| Request classification | `intake.md` |
| Risk assessment | `risk-lanes.md` |
| Normal/high-risk task | `task-packet.md` |
| Proof mapping | `test-matrix.md` |
| Validation evidence | `validation-report.md` |
| Done check | `done-criteria.md` |
| New pre-repo project | `project-bootstrap.md` |
| Existing project work | `project-workflow.md` |
| Broad project planning | `task-decomposition.md` |
| Multi-agent code split | `task-decomposition.md`, `task-packet.md`, `../wiki/knowledge/project-docs/agent_local_work.md` |

## final note format

```text
Changed:
- 

Checked:
- 

Not done / gaps:
- 

Next:
- 
```
