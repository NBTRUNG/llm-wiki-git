---
name: autonomous-research-agents
description: Guidance for bounded deep-research / auto-research agents, inspired by deep research surveys and Karpathy-style caution about current agent autonomy.
date_ingested: 2026-07-01
date_updated: 2026-07-16
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://arxiv.org/abs/2508.12752
  - https://arxiv.org/abs/2512.02038
  - https://arxiv.org/abs/2602.22401
  - https://arxiv.org/abs/2606.15367
  - https://www.businessinsider.com/andrej-karpathy-ai-agents-timelines-openai-2025-10
  - https://developers.openai.com/api/docs/guides/tools-web-search
  - https://openai.github.io/openai-agents-python/
  - https://platform.claude.com/docs/en/agents-and-tools/tool-use/web-search-tool
  - https://ai.google.dev/gemini-api/docs/google-search
  - https://arxiv.org/abs/2506.11763
  - https://arxiv.org/abs/2508.15804
  - https://arxiv.org/abs/2602.11685
  - https://arxiv.org/abs/2605.06635
  - https://deepmind.google/research/evals/
  - https://help.openai.com/en/articles/10500283-deep-research
confidence: medium
confidence_reviewed: 2026-07-16
revision_trigger: Recheck weekly before a broad auto-research run, or when search tooling, citation metadata, source access, or research-agent evaluation methods change.
---

# autonomous research agents

## purpose

Use this guide when an agent is asked to run research, monitor current sources,
compare sources, synthesize findings, or propose updates to LLM-Wiki.

The term "Karpathy auto research" is not a stable official term found in the
2026-07-01 research pass. The useful file-back is the combined lesson from:

- Karpathy-style caution about current fully autonomous agents;
- deep-research survey literature;
- LLM-Wiki's human-requested research-on-request loop.

## core stance

Auto research should be **bounded autonomy**, not background autonomy.

```text
human/task authorization
  -> scoped research question
  -> search/tool bounds and source-log plan
  -> source priority and search plan
  -> multi-source collection
  -> source quality and conflict checks
  -> synthesis with citations
  -> candidate updates only
  -> human/Lead/review promotion
  -> validation report
```

Agents may accelerate search, comparison, and drafting. They must not silently
rewrite canonical knowledge from one source, vendor claim, benchmark, or social
post.

## claim-evidence contract

A citation is not a binary proof flag. For every high-impact or promotion-
relevant claim, check the chain explicitly:

```text
claim
  -> source can be opened
  -> cited passage is relevant to that claim
  -> passage supports the claim at the stated strength
  -> freshness, authority, and conflicts are acceptable
  -> claim is promoted, qualified, deferred, or rejected
```

Record a compact claim ledger in the research brief when several claims may be
promoted:

| Claim | Importance | Source | Accessible | Relevant | Supports stated strength | Conflict/freshness | Decision |
| --- | --- | --- | --- | --- | --- | --- | --- |
| | high / medium / low | | yes / no | yes / partial / no | yes / partial / no | | promote / qualify / defer / reject |

Link validity, topical relevance, and factual support are separate checks. A
large citation count, a working URL, or a relevant page cannot substitute for
claim-level support. Review uncited substantive claims as well as cited ones.

## deep research pipeline

Research-agent surveys describe deep research as more than single-shot search
or normal RAG. The reusable pipeline for LLM-Wiki is:

| Stage | LLM-Wiki adaptation |
| --- | --- |
| Query planning | Define decision need, scope, freshness, and source priority. |
| Question development | Break the research question into subquestions and exclusion criteria. |
| Information acquisition | Search official/primary sources first, then research/surveys, then practitioner/news leads. Set search/tool budgets and domain filters when the tool supports them. |
| Memory/source management | Record sources, dates, source type, confidence, conflicts, and complete consulted-source logs when available in a research brief. |
| Answer generation | Produce concise findings with apply/avoid conditions and target docs. |
| Evaluation | Check source support, freshness, contradictions, unsupported inference, citation/source-log quality, and promotion gates. |

## bounded search and stopping

Start with a declared search/tool budget, but do not treat consuming the whole
budget as success. Before expanding the search, name the unresolved decision
or high-impact claim and the evidence the next probe could add.

Continue when a new probe has a credible path to one of these outcomes:

- resolve a material source conflict;
- replace a weak source with a primary or official source;
- verify a promotion-relevant claim that is still unsupported;
- cover a decision-relevant subquestion that is still missing.

Stop searching and synthesize, qualify, defer, or ask for review when:

- the scoped questions have adequate claim-level support;
- recent probes repeat the same evidence without changing a decision;
- the remaining gap has no credible accessible source path in scope;
- a material conflict remains and must be reported rather than averaged away;
- the declared tool/time budget is reached; or
- the next probe's expected decision value is lower than its cost or risk.

Recent citation-evaluation evidence suggests that more tool calls can reduce
factual citation accuracy in some configurations. Treat that as a reason to
measure marginal evidence, not as authority for a universal numeric call cap:
the reported ablation covered only two frontier models and a particular setup.

## Karpathy-style caution

Current agents are useful as collaborators, not trusted replacements for human
research judgment. Apply these boundaries:

- Ask or stop when the task is under-scoped.
- Show source paths and assumptions.
- Prefer "candidate update" over direct canonical rewrite.
- Treat citations as support pointers, not proof, until the cited source is
  checked against the exact claim.
- Keep humans in the loop for high-stakes, domain, security, legal, tax,
  medical, production, or architecture-changing conclusions.
- Optimize for helping the human/Lead learn and decide, not for producing a
  large confident report that hides uncertainty.
- Treat multi-step agent chains as error-amplifying unless each stage has
  evidence and acceptance checks.

## evaluation checklist

Before promotion, check:

- Is the source primary/official, peer-reviewed, or only a lead?
- Does each promotion-relevant source open, address the claim, and support it
  at the strength stated?
- Were uncited substantive claims checked rather than hidden behind a strong
  citation elsewhere in the paragraph?
- Is the source current enough for the topic?
- Were search/tool bounds and complete source logs recorded when available?
- Are there conflicting sources?
- Is the finding generally reusable or project-specific?
- Does the update say when to apply and when not to apply?
- Are high-stakes conclusions escalated?
- Did lint/link checks pass after promotion?
- Did the run stop because the decision had adequate evidence, or merely
  because the agent exhausted attention, time, or tool calls?

## output shape

```text
Research question:
Scope and exclusions:
Search/tool bounds:
Sources checked:
Findings:
Conflicts:
Candidate updates:
Rejected/no-change findings:
Promotion decision:
Validation:
Next review trigger:
```

## anti-patterns

- Treating "deep research" output as canonical truth without source review.
- Running broad autonomous browsing because a cadence is due.
- Optimizing for report length instead of decision quality.
- Optimizing citation count or search depth instead of claim support.
- Hiding contradictions or unsupported inferences.
- Letting an agent update high-stakes guidance without human/Lead review.
- Confusing research automation with domain authority.
