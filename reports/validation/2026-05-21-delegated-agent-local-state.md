# validation report

Date: 2026-05-21
Scope: Delegated agent local-state and audit model
Task/story: Standardize `agents/<agent>/tasks.md`, `agents/<agent>/status.md`, agent result reports, `REPO_RULES.md`, and long-rule escalation triggers
Validator: Codex

## source

- Project: LLM-Wiki
- Source-of-truth files:
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/agent_local_work.md`
  - `/home/admindebian/LLM-Wiki/templates/agent_tasks.template.md`
  - `/home/admindebian/LLM-Wiki/templates/agent_status.template.md`
  - `/home/admindebian/LLM-Wiki/templates/agent_result_report.template.md`
  - `/home/admindebian/LLM-Wiki/templates/repo_rules.template.md`
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/coding/repo-code-rules.md`
  - `/home/admindebian/LLM-Wiki/harness/agent-operating-guide.md`
- Commit/build/version: local working tree, no commit requested

## commands run

```text
grep -n "^## " llm-wiki-constitution.md
grep -R -n "agent_local_work\|agent_tasks.template\|agent_result_report\|repo_rules.template\|REPO_RULES\|Long Rule Escalation\|when to read this full guide\|agents/<agent>/tasks.md\|agents/<agent>/status.md\|reports/agent/<agent>" index.md global-rules.md program.md llm-wiki-constitution.md wiki/knowledge templates harness reports/README.md active.md
find templates wiki/knowledge/project-docs -maxdepth 1 -type f | sort
```

## results

| check | result | notes |
| --- | --- | --- |
| Agent-local guide | passed | `agent_local_work.md` defines tasks/status/result-report roles, read order, checkpoint rule, rollup rule, and audit trail. |
| Agent templates | passed | Added agent task, agent status, and agent result report templates. |
| Short repo rules | passed | Added `repo_rules.template.md` with source-of-truth order, Karpathy-style work principles, delegated read order, write rules, checkpoint/report rules, and long-rule escalation triggers. |
| Long-rule escalation | passed | `repo-code-rules.md` states delegated agents do not read the full guide by default and lists escalation triggers. |
| Repo-wide vs agent-local status | passed | `agent_status.md` guide distinguishes repo-wide assignment board from `agents/<agent>/status.md` execution trace. |
| Constitution numbering | passed | Constitution heading numbers are sequential after adding delegated agent local-state section. |

## evidence

- Agent local guide:
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/agent_local_work.md`
- Short repo rules template:
  - `/home/admindebian/LLM-Wiki/templates/repo_rules.template.md`
- Delegated agent templates:
  - `/home/admindebian/LLM-Wiki/templates/agent_tasks.template.md`
  - `/home/admindebian/LLM-Wiki/templates/agent_status.template.md`
  - `/home/admindebian/LLM-Wiki/templates/agent_result_report.template.md`

## gaps

- Tests not run: no application code was changed.
- Known issues: shell startup prints `/home/admindebian/.profile: line 29: export: QT-IM-MODULE=fcitx: not a valid identifier`; this did not affect validation commands.
- Residual risk: real repos still need actual `REPO_RULES.md`, `agents/<agent>/tasks.md`, `agents/<agent>/status.md`, and report folders created from these standards.

## decision

- implemented

Accepted model:

1. Codex/main owns repo-wide rollup docs.
2. Delegated agents read short repo rules and their own task/status files.
3. Delegated agents checkpoint to `agents/<agent>/status.md`.
4. Delegated agents produce `reports/agent/<agent>/<task-id>-result.md`.
5. Codex/main reviews, validates, and rolls accepted work into repo-wide docs.
6. Full `repo-code-rules.md` is read only on explicit requirement or escalation triggers.
