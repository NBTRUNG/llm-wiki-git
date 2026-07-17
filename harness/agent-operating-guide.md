# agent operating guide

This is the daily loop for ai/dev work.

## start

1. Read `../index.md`.
2. Follow [[read-workflow.md]] universal start.
3. Classify current request.
4. Read only relevant files.
5. Identify source of truth.
6. Choose risk lane.
7. Check the Lead-owned capability envelope and task capability gate; unrated/
   expired=`C0`, and mismatch stops/hands off.
8. Classify the session pack using `../wiki/knowledge/project-docs/agent_session_packs.md` when the assigned projection permits it.
9. Read relevant LLM-Wiki knowledge/playbooks through the assigned `P0/P1/P2` projection.
10. For repo code work, use full Coding Pack only for eligible `P2`; qualified
    `C2-C3` bounded work uses task-named `P1-BOUNDED-CODING`; other lower tiers
    require an approved task-named projection or handoff.
11. For delegated repo work, read only the capability note, assigned projection, and task `Required read files`.

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
4. For completed LLM-Wiki work, index the validation report and add the concise
   evidence link in `active.md` when durable state changed.
5. Link evidence instead of pasting long logs.
6. State changed files, checks, gaps, and next action.

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
| Agent session packing | `../wiki/knowledge/project-docs/agent_session_packs.md` |
| Agent capability/task fit | `../wiki/knowledge/project-docs/agent_capability_tiers.md`, Lead-owned profile, task capability gate |
| Repo code work | assigned `P0/P1/P2` projection; full `../wiki/knowledge/coding/` Coding Pack only for eligible `P2`, otherwise approved task-named projection |
| Coding Pack | `../wiki/knowledge/coding/agent-coding-workflow.md`, `karpathy-guidelines.md`, `repo-code-rules.md`, `code-quality.md`, `output-quality.md`, `security-baseline.md`, `testing-strategy.md` |
| Web/UI work | `../wiki/knowledge/project-docs/agent_session_packs.md`, `../wiki/knowledge/frontend/README.md`, `../wiki/knowledge/ui/README.md`, repo design-system/UI map files |
| Security-sensitive work | Coding Pack Security Baseline plus Security Deep Pack from `../wiki/knowledge/project-docs/agent_session_packs.md` when triggers apply |
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
