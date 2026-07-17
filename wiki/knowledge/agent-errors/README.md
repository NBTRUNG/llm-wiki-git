---
name: agent-errors
description: Reusable incident cases and prevention rules for errors, inefficiencies, and quota failures encountered while using coding agents.
date_ingested: 2026-07-07
status: active
---

# agent errors

This folder records reusable lessons from real project work with agents.

Use it for agent-specific failure modes such as:

- excessive token or time use;
- broad grep/log reading loops;
- missed human checkpoint;
- wrong source-of-truth selection;
- unnecessary internet or missing internet lookup;
- repeated validation without new evidence;
- unsafe tool use, overbroad edits, or false evidence.

Project-specific live state stays in the project repo. This folder stores the
generalized incident pattern, prevention rule, and links to source evidence.

## index

- [[internet-search-and-token-budget.md]] - when agents should use internet
  search, when local investigation is better, and token/time checkpoint bands.
- [[../../../workflows/bug-fix-investigation.workflow.md]] - workflow card
  for failure anchoring, hypothesis-driven probes, bounded `rg`/log use, and
  escalation checkpoints.
- [[universityweb-u17-publish-token-overuse.md]] - U17 publish/deploy token
  overuse case study.
- [[incident.template.md]] - template for future agent error case files.

## filing rule

Create a case file when any of these are true:

- total token usage exceeded the expected band for the task;
- the user reported quota/time frustration;
- two or more command variants failed without new information;
- the agent repeated expensive validation after a change that did not affect
  that validation layer;
- internet search would likely have reduced local probing, or internet search
  was used when local evidence was enough;
- the fix or prevention rule is likely to recur across projects.

## related

- [[../operations/deployment-diagnostics.md]]
- [[../coding/agent-coding-risks.md]]
- [[../project-docs/post_task_distillation.md]]
- [[../project-docs/agent_session_packs.md]]
