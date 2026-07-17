# Validation Report: Bug-Fix Debugging Funnel

Date: 2026-07-08

## scope

Implemented LLMWIKI-067: add a short bug-fix investigation workflow that keeps
agents localized around the failure anchor, hypotheses, narrow probes, bounded
`rg`/log use, bounded internet search for vendor/version behavior, and human
escalation checkpoints.

## changed files

- `workflows/bug-fix-investigation.workflow.md`
- `workflows/catalog.md`
- `workflows/README.md`
- `wiki/knowledge/agent-errors/internet-search-and-token-budget.md`
- `wiki/knowledge/agent-errors/README.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `wiki/projects/llm-wiki/docs/checkpoints/agent-errors-token-budget.md`
- `wiki/projects/llm-wiki/docs/current_direction.md`
- `reports/research/2026-07-08-bugfix-debugging-funnel.md`
- `reports/research/README.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## source checks

| source | finding used |
| --- | --- |
| Google SRE Effective Troubleshooting | Troubleshooting should be hypothesis-driven, use telemetry/logs tied to the problem, simplify/reduce, divide-and-conquer, bisection, recent-change checks, and negative results. |
| Anthropic Claude Code docs | Broad codebase exploration can pollute context; large reads should be scoped or delegated. |
| GitHub Copilot cloud agent docs | Agent work is bounded by repository, branch/PR, and session time; complex work should be split. |
| PROBE software-agent recovery paper | Failed runs should become structured evidence, structured diagnosis, and bounded recovery guidance. |

Research brief:
`reports/research/2026-07-08-bugfix-debugging-funnel.md`

## contract checks

| contract | result | evidence |
| --- | --- | --- |
| Bug-fix workflow card exists | pass | `workflows/bug-fix-investigation.workflow.md` |
| Workflow catalog routes bug/error work to the funnel | pass | `workflows/catalog.md` |
| Workflow README lists the card | pass | `workflows/README.md` |
| `rg`/log use is treated as targeted probe, not default context gathering | pass | `bug-fix-investigation.workflow.md`; `internet-search-and-token-budget.md` |
| Internet search is bounded and source-prioritized | pass | `bug-fix-investigation.workflow.md`; `internet-search-and-token-budget.md` |
| Human escalation checkpoint exists for no-progress, weak hypothesis, broad output, or boundary-changing probes | pass | `bug-fix-investigation.workflow.md` |
| Agent Error / Token Budget Pack points to the workflow | pass | `wiki/knowledge/project-docs/agent_session_packs.md` |
| Live state updated, not report-only | pass | `active.md`; `TICK.md`; `tasks.md`; `test_matrix.md`; `reports/validation/README.md` |

## validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

## closeout

Next step: run the U17 Phase 1 effectiveness evaluation and include at least
one bug/error scenario if available, checking whether the funnel reduces broad
grep/log loops and missed human checkpoints.
