---
name: internet-search-and-token-budget
description: Guidance for using internet search, local investigation, token budgets, and human checkpoints during agent bug-fix sessions.
date_ingested: 2026-07-07
status: active
source_type: research-plus-project-file-back
raw_sources:
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-08-debug-funnel-sources.md
confidence: medium
confidence_reviewed: 2026-07-08
---

# internet search and token budget for agent bug fixes

## core rule

Agents should not replace human search habits with blind repo grep loops.

For unknown, vendor-specific, or current-tool behavior, run a bounded source
check early. For project-specific topology, config, and code ownership, local
source remains primary.

Bug-fix sessions should follow the short workflow card at
`workflows/bug-fix-investigation.workflow.md`: anchor the failure, localize the
scope, state two to four hypotheses, use narrow probes to confirm or rule them
out, and escalate only when the previous scope no longer explains the evidence.

Saying "I am not sure" or "I do not know yet" is an acceptable and preferred
checkpoint when evidence is weak. The user can join the search, choose sources,
or narrow the next probe. This is better than an agent silently spending tokens
on broad grep, broad logs, or speculative fixes.

## debugging funnel

Use this loop before reading broadly:

1. Anchor the exact failure: command, test, route, request, log slice, or user
   symptom.
2. Identify the smallest local scope tied to that anchor.
3. List two to four likely hypotheses in probability order.
4. Run one probe at a time, naming what it will confirm or rule out.
5. Escalate from file to component, subsystem, repo, dependency/vendor docs, or
   human checkpoint only after the current scope stops explaining the evidence.
6. Verify the fix against the original failure anchor.

`rg` and logs are useful only when they are surgical probes. A good query names
a symbol, error string, config key, route, test, migration id, feature flag, or
contract term. A broad query that returns many candidates usually pollutes the
agent context and should trigger narrowing or checkpointing.

## when internet search helps

Use internet search early when:

- the error string names a vendor tool, SDK, framework, package, or cloud
  service;
- local commands fail silently or produce a target/phase but no explanation;
- the behavior may have changed by version;
- official docs, release notes, GitHub issues, or vendor forums likely contain
  the same symptom;
- the user asks whether humans would normally search forums/docs first.

Search order:

1. Official docs and release notes.
2. Official issue trackers or vendor-maintained repositories.
3. Highly specific community/forum results.
4. General web only after the first three fail.

Bound the search to two to four targeted queries before returning to local
evidence or checkpointing with the user.

## when local investigation wins

Prefer local investigation when:

- the error is caused by repo-specific graph shape, local config, or generated
  artifacts;
- logs already identify a concrete target, file, or phase;
- the fix requires understanding active project source of truth;
- web results only explain general behavior, not the local root cause.

The UniversityWeb U17 publish issue is an example: official Microsoft docs
confirmed `dotnet publish` and `ProjectReference` semantics, but the root cause
was the local `.csproj` reference graph.

## token budget bands

Public vendor docs do not publish a reliable "average tokens per bug fix" target
that can be used as a universal standard. Use these LLM-Wiki bands for agent
sessions and tune them with local evidence.

| Band | Task shape | Expected total tokens | Checkpoint |
| --- | --- | ---: | ---: |
| L0 | read-only answer, known file/report, no tools beyond narrow reads | 10k-30k | 30k |
| L1 | narrow bug, known symptom, one subsystem, local validation | 30k-80k | 80k |
| L2 | multi-file bug, build/test failure, package/publish issue | 80k-200k | 150k |
| L3 | deploy/runtime/data issue with server, config, backup, smoke | 200k-400k | 250k |
| L4 | unclear cross-system investigation | split task; approve continuation | 400k-500k |

Anything above 500k tokens for one bug-fix session requires an explicit
checkpoint and user approval to continue. Anything above 1M tokens should be
treated as a workflow incident unless the task was intentionally broad and
pre-approved.

## hard checkpoint triggers

Stop and ask the user, Lead, or integration owner when:

- two command variants fail without new information;
- token use reaches the checkpoint band;
- user gives a hard time/token cap;
- internet search and local probes disagree;
- the next probe requires broad log output, broad grep, production access, or
  repeated expensive validation;
- the agent cannot state the current hypothesis in one sentence.
- the agent would otherwise continue because it feels it "should know" the
  answer, but the evidence does not support a clear next action.

Checkpoint format:

```text
Current phase:
Evidence found:
Current hypothesis:
Token/time spent:
Next 1-2 probes:
Why not keep grepping:
Where I am uncertain:
Approval needed:
```

## source notes

- Anthropic Claude Code best practices emphasize that context fills quickly,
  debugging sessions can consume tens of thousands of tokens, and context is the
  main resource to manage:
  https://code.claude.com/docs/en/best-practices
- Anthropic cost guidance says per-developer costs vary widely, recommends
  tracking token usage, and names context management, subagents, hooks, specific
  prompts, and smaller base instructions as cost controls:
  https://code.claude.com/docs/en/costs
- Claude Code context-window docs recommend clearing unrelated tasks and
  delegating large reads so verbose content does not pollute the main context:
  https://code.claude.com/docs/en/context-window
- GitHub Copilot cloud agent docs describe agent sessions as research-plan-code
  workflows and state that cloud-agent sessions have a hard 59-minute maximum:
  https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-cloud-agent
- Microsoft `dotnet publish` docs state that publish compiles the app, reads
  dependencies from the project file, invokes MSBuild `Publish`, and supports
  verbosity levels including `diag`:
  https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-publish
- Microsoft MSBuild docs state that .NET Core/.NET 5+ project references are
  transitive:
  https://learn.microsoft.com/en-us/visualstudio/msbuild/common-msbuild-project-items
- The 2026 agentic coding token-consumption study reports high variance, input
  tokens as the main driver, and cases where higher token use does not improve
  accuracy:
  https://arxiv.org/abs/2604.22750
- Google SRE Effective Troubleshooting describes troubleshooting as
  hypothesis-driven diagnosis with telemetry/logs, simplify-and-reduce,
  divide-and-conquer, bisection, recent-change checks, and explicit negative
  results:
  https://sre.google/sre-book/effective-troubleshooting/
- GitHub Copilot cloud agent docs describe a bounded research/plan/branch-change
  workflow and a hard session time limit, with complex work split into smaller
  tasks:
  https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-cloud-agent
- PROBE research describes software-agent recovery as failed-run telemetry to
  structured evidence, structured diagnosis, and bounded recovery guidance:
  https://arxiv.org/abs/2605.08717

## related

- [[README.md]]
- [[../../../workflows/bug-fix-investigation.workflow.md]]
- [[../operations/deployment-diagnostics.md]]
- [[../coding/agent-coding-risks.md]]
