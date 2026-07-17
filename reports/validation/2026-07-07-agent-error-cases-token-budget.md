# Validation Report: Agent Error Cases and Token Budget Guidance

Date: 2026-07-07

## scope

Implemented LLMWIKI-064: add a dedicated `wiki/knowledge/agent-errors/`
folder for reusable agent workflow incidents, including internet-search
decision rules, token-budget bands, human checkpoints, and the UniversityWeb U17
publish token-overuse case.

## changed files

- `wiki/knowledge/agent-errors/README.md`
- `wiki/knowledge/agent-errors/incident.template.md`
- `wiki/knowledge/agent-errors/internet-search-and-token-budget.md`
- `wiki/knowledge/agent-errors/universityweb-u17-publish-token-overuse.md`
- `wiki/knowledge/README.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `wiki/index.md`
- `index.md`
- `reports/research/README.md`
- `reports/research/2026-07-07-agent-error-token-budget-internet-search.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/tasks_archive.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## contract checks

| contract | result | evidence |
| --- | --- | --- |
| Agent error folder exists with index | pass | `wiki/knowledge/agent-errors/README.md` |
| Future incidents have a template | pass | `wiki/knowledge/agent-errors/incident.template.md` |
| U17 publish token-overuse case is filed | pass | `wiki/knowledge/agent-errors/universityweb-u17-publish-token-overuse.md` |
| Internet-search and token-budget guidance exists | pass | `wiki/knowledge/agent-errors/internet-search-and-token-budget.md` |
| Session packs route agent error/token reviews | pass | `wiki/knowledge/project-docs/agent_session_packs.md` |
| Knowledge indexes point to the folder | pass | `index.md`; `wiki/index.md`; `wiki/knowledge/README.md` |
| Research evidence is recorded | pass | `reports/research/2026-07-07-agent-error-token-budget-internet-search.md` |
| Live state updated, not report-only | pass | `active.md`; `TICK.md`; `tasks.md`; `tasks_archive.md`; `test_matrix.md`; `reports/validation/README.md` |

## source-backed conclusions

- No reliable public vendor benchmark was found for average tokens per bug-fix
  session.
- LLM-Wiki therefore uses internal budget bands and checkpoint thresholds.
- Internet search should be bounded and source-prioritized; local repo source
  remains primary for project-specific graph/config/root-cause work.

## validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

## next discussion

Discuss with the user whether U17 repo-local deployment docs should point to
the new `agent-errors` folder and Operations Pack deployment diagnostics.
