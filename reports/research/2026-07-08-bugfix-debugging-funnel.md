# Research Brief: Bug-Fix Debugging Funnel

Date: 2026-07-08

## topic

Current-source check for how mature engineering organizations and agent tooling
handle bug-fix investigation without broad, noisy context gathering.

## cadence reason

Human asked whether big tech already has a method for avoiding broad grep/noisy
debugging loops and for escalating gradually while localizing bugs.

## search/tool bounds

- Source families: official SRE/tool docs first, then current research.
- Included sources: Google SRE, Anthropic Claude Code docs, GitHub Copilot
  cloud agent docs, PROBE software-agent recovery paper.
- Exclusions: generic blogs, social posts, and forum advice not tied to a
  concrete vendor or research artifact.
- Search budget: targeted web searches plus direct opens of relevant official
  pages.

## sources checked

- Raw source record:
  `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-08-debug-funnel-sources.md`
- Google SRE, Effective Troubleshooting:
  https://sre.google/sre-book/effective-troubleshooting/
- Anthropic Claude Code, Best practices:
  https://code.claude.com/docs/en/best-practices
- Anthropic Claude Code, Common workflows:
  https://code.claude.com/docs/en/common-workflows
- GitHub Docs, Copilot cloud agent overview:
  https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-cloud-agent
- Debugging the Debuggers: Failure-Anchored Structured Recovery for Software
  Engineering Agents:
  https://arxiv.org/abs/2605.08717

## findings

| finding | classification | support |
| --- | --- | --- |
| Mature troubleshooting is hypothesis-driven, not broad search driven. | candidate-update | Google SRE frames troubleshooting as observations, hypotheses, tests, and corrective action. |
| Localizing by component, data flow, recent change, divide-and-conquer, and bisection is a reusable debugging pattern. | candidate-update | Google SRE Effective Troubleshooting. |
| Broad codebase exploration can pollute an agent's context; large exploration should be scoped or delegated. | candidate-update | Anthropic Claude Code best practices and common workflows. |
| Agent work should be bounded by task/session scope and split when it becomes too broad. | candidate-update | GitHub Copilot cloud agent docs. |
| Failed agent attempts should be converted into structured evidence, diagnosis, and bounded recovery guidance. | candidate-update | PROBE paper. |

## promotion decision

Promote as a short workflow card and cross-link it from existing agent-error
token/search guidance.

## target docs

- `workflows/bug-fix-investigation.workflow.md`
- `workflows/catalog.md`
- `workflows/README.md`
- `wiki/knowledge/agent-errors/internet-search-and-token-budget.md`
- `wiki/knowledge/agent-errors/README.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`

## validation

Promotion validation is recorded in
`reports/validation/2026-07-08-bugfix-debugging-funnel.md`.

## next review trigger

Review after the U17 Phase 1 effectiveness evaluation or after the next agent
bug-fix incident involving broad grep/log loops, missed internet lookup, or
missed human checkpoint.
