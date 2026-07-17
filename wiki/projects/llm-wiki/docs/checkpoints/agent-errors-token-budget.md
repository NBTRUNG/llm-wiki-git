# Agent Errors / Token Budget Checkpoint

Status: active  
Last updated: 2026-07-08

## current position

Agent errors, token overuse, broad grep/log loops, missed human checkpoints, and
internet-vs-local search decisions are now first-class reusable knowledge.
Bug-fix investigations now have a short workflow card that turns this guidance
into an operational debugging funnel.

Agents may say "not sure" or "do not know yet" when evidence is weak. That is a
preferred checkpoint, not a failure.

## already done

- `wiki/knowledge/agent-errors/` exists.
- U17 publish token-overuse case is filed.
- `deployment-diagnostics.md` defines narrow log/probe behavior.
- Token budget bands and hard checkpoint triggers exist.
- U17 `docs/deployment.md` points future deploy agents to diagnostics and
  human checkpoint rules.
- `workflows/bug-fix-investigation.workflow.md` defines failure anchoring,
  hypothesis-driven probes, bounded `rg`/log use, internet-search triggers, and
  escalation checkpoints.

## not done yet

- No automated extraction of token incidents into Agent Platform.
- No dashboard for budget bands or checkpoint compliance.
- No project-wide backfill of deploy/debug pointers beyond U17.
- No automated enforcement that bug-fix probes are tied to hypotheses.

## do not repeat

- Do not keep running broad grep or full logs when evidence is weak.
- Do not use `rg` as default context gathering; use it as a targeted probe tied
  to a hypothesis.
- Do not spend beyond checkpoint bands without asking.
- Do not treat "I don't know yet" as a defect in the agent.
- Do not repeat Level 3/4 deploy validation unless the later change affects
  runtime or data state.

## next likely step

Use U17 evaluation or the next real bug-fix incident to test whether the funnel
reduces broad grep/log loops. If token incidents recur, define an Agent
Platform JSONL schema for `agent_error_cases` and extract cases from reports.

## evidence

- `wiki/knowledge/agent-errors/README.md`
- `wiki/knowledge/agent-errors/internet-search-and-token-budget.md`
- `workflows/bug-fix-investigation.workflow.md`
- `wiki/knowledge/agent-errors/universityweb-u17-publish-token-overuse.md`
- `wiki/knowledge/operations/deployment-diagnostics.md`
- `reports/validation/2026-07-07-agent-error-cases-token-budget.md`
- `reports/validation/2026-07-07-human-checkpoint-u17-deployment-pointer.md`
- `reports/validation/2026-07-08-bugfix-debugging-funnel.md`
