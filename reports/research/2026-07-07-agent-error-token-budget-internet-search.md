# Research Brief: Agent Error Cases, Internet Search, and Token Budgets

Date: 2026-07-07

## question

Should LLM-Wiki add a folder for agent workflow errors, and what guidance should
agents use for internet search, token budget, and human checkpointing while
debugging project errors?

## source log

- Anthropic Claude Code best practices:
  https://code.claude.com/docs/en/best-practices
- Anthropic Claude Code costs:
  https://code.claude.com/docs/en/costs
- Anthropic Claude Code context window:
  https://code.claude.com/docs/en/context-window
- GitHub Copilot cloud agent:
  https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-cloud-agent
- Microsoft `dotnet publish`:
  https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-publish
- Microsoft MSBuild project items:
  https://learn.microsoft.com/en-us/visualstudio/msbuild/common-msbuild-project-items
- Agentic coding token-consumption study:
  https://arxiv.org/abs/2604.22750
- U17 audit evidence:
  `/home/admindebian/UniversityWeb-U17/reports/agent/codex-20260707-token-audit/publish-token-overuse-audit.md`

## findings

- Public vendor docs do not publish a stable average token budget per bug-fix
  session. They instead publish cost controls, rate/time limits, context
  management guidance, or billing mechanics.
- Anthropic emphasizes context-window management as a primary constraint and
  notes that debugging/codebase exploration can consume tens of thousands of
  tokens.
- Anthropic cost guidance says costs vary widely by model, codebase size, and
  usage pattern; it recommends tracking token usage and reducing context with
  skills, hooks, specific prompts, subagents, and smaller base instructions.
- GitHub Copilot cloud agent documents a hard 59-minute cloud-agent session
  limit and recommends smaller/focused tasks for complex work.
- Microsoft docs confirmed that `dotnet publish` is the supported deploy-output
  command, invokes MSBuild `Publish`, and works from project-file dependencies.
- Microsoft MSBuild docs confirmed that modern .NET project references are
  transitive, which supports checking duplicate direct/transitive references
  early for publish failures.
- The 2026 token-consumption study reports that agentic coding token usage is
  highly variable, input tokens drive cost, and more tokens do not necessarily
  mean better accuracy.

## promoted guidance

Created:

- `wiki/knowledge/agent-errors/README.md`
- `wiki/knowledge/agent-errors/incident.template.md`
- `wiki/knowledge/agent-errors/internet-search-and-token-budget.md`
- `wiki/knowledge/agent-errors/universityweb-u17-publish-token-overuse.md`

## validation link

Promotion evidence:

- `reports/validation/2026-07-07-agent-error-cases-token-budget.md`
