---
name: deep-research-claim-verification
description: Current-source refresh for claim-level citation verification, research-agent evaluation, and evidence-value stopping.
date_updated: 2026-07-16
status: promoted
---

# Deep Research Claim Verification

Topic: Deep research / autonomous research agents

Date: 2026-07-16

Owner: Codex

Cadence reason: weekly and human-requested auto-research

Status: promoted

## decision need

- What decision or guideline may change: whether a research run may use
  citation count, working links, or search depth as sufficient evidence, and
  how it should decide when to stop searching.
- Target docs if promoted:
  `wiki/knowledge/ai-agent-rag-mcp/autonomous-research-agents.md`,
  `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`,
  `harness/auto-research.md`, and
  `templates/research_brief.template.md`.
- Exclusions: model ranking, universal search/tool-call limits, general RAG
  architecture, and broad security/privacy policy.

## search/tool bounds

- Budget: four web queries in one batch, followed only by opening and targeted
  readback of returned primary/official sources.
- Source priority: original papers and official product/evaluation
  documentation; vendor pages support only their own controls and risks.
- Query families: citation correctness; trajectory/stopping/abstention;
  official deep-research safety/evaluation; official DeepMind evaluation.
- The web result stream exposed query results but was truncated, so it did not
  provide a reliable export of every surfaced URL. The four queries and every
  source opened for evidence are recorded here; un-opened result snippets were
  not treated as consulted evidence.

## sources checked

| Source | Type | Published/accessed | Relevance | Decision |
| --- | --- | --- | --- | --- |
| [Cited but Not Verified](https://arxiv.org/abs/2605.06635) | primary preprint | 2026-05-07 / 2026-07-16 | Separates link accessibility, relevance, and factual support; reports an ablation where more calls reduced citation fact accuracy in two tested models. | promote structure; numeric results remain evidence/qualification only |
| [DeepResearch Bench](https://arxiv.org/abs/2506.11763) | primary preprint; ICLR 2026 note | 2025-06-13 / 2026-07-16 | Evaluates report quality separately from effective citation count and citation accuracy across expert-created tasks. | promote multi-axis evaluation structure |
| [ReportBench](https://arxiv.org/abs/2508.15804) | primary preprint | 2025-08-14 / 2026-07-16 | Checks cited-source quality/relevance, statement faithfulness, and uncited claims. | promote cited plus uncited claim checks |
| [DRACO](https://arxiv.org/abs/2602.11685) | primary preprint with vendor affiliation | 2026-02-12 / 2026-07-16 | Uses task-specific rubrics for accuracy, completeness, objectivity/presentation, citation quality, and reports efficiency trade-offs. | promote dimensions, not vendor ranking |
| [Google DeepMind Evals](https://deepmind.google/research/evals/) | official research index | accessed 2026-07-16 | DeepSearchQA tests multi-step search-plan execution and exhaustive answer lists; FACTS Grounding separates long-context grounding. | corroborates process/coverage separation |
| [OpenAI deep research help](https://help.openai.com/en/articles/10500283-deep-research) | official product docs | accessed 2026-07-16 | Exposes plan review, source selection, interruption, activity history, and source review as human control surfaces. | no-change; human control already canonical |
| [OpenAI deep research system card](https://openai.com/index/deep-research-system-card/) | official system card | 2025-02-25 / 2026-07-16 | Documents multi-step browsing plus privacy, prompt-injection, hallucination, and safety evaluation concerns. | no-change; bounded autonomy already canonical |

Search queries recorded verbatim:

1. `site:arxiv.org deep research agents citation correctness benchmark source quality 2025 2026`
2. `site:arxiv.org deep research agent evaluation trajectory benchmark stopping abstention 2025 2026`
3. `site:openai.com deep research system card citations evaluation official`
4. `site:deepmind.google research agent deep research benchmark citations official`

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| Citation accessibility, topical relevance, and support for the stated claim are distinct checks; cited and uncited substantive claims both need review. | high | candidate-update | Research may inform durable guidance or a consequential decision. | Low-stakes brainstorming with no truth/promotion claim. |
| Research-agent evaluation should separate scope/plan, acquisition coverage, claim support, synthesis, control/abstention, and efficiency. | medium-high | candidate-update | Evaluating a deep-research workflow or comparing configurations. | As a universal blended score or vendor leaderboard. |
| More retrieval is not monotonically better; search expansion should name the unresolved claim and expected evidence value. | medium | candidate-update | A run is near its declared budget or probes repeat evidence. | As authority for a fixed universal call cap; the direct ablation is limited. |
| Human plan review, source restriction, interruption, and reviewable activity/source history remain appropriate controls. | high | no-change | Human-controlled deep research. | Fully autonomous canonical promotion. |

## claim-support checks

| Claim | Importance | Source | Accessible | Relevant | Supports stated strength | Conflict/freshness | Decision |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Working links and relevance do not establish factual support. | high | Cited but Not Verified; ReportBench | yes | yes | yes | both are recent preprints; methods differ but direction agrees | promote |
| Evaluate cited and uncited substantive claims. | high | ReportBench | yes | yes | yes | one benchmark; operationally low-risk and consistent with existing source checks | promote |
| Report/research quality needs multiple separate dimensions. | high | DeepResearch Bench; DRACO; DeepMind Evals | yes | yes | yes | task distributions and vendor affiliations differ | promote without rankings/thresholds |
| More calls can reduce factual citation accuracy. | medium | Cited but Not Verified | yes | yes | partial for general use | two-model ablation does not establish a universal curve | qualify; use only as anti-monotonicity evidence |
| A fixed numeric search cap should be canonical. | high | none | n/a | no | no | unsupported and configuration-dependent | reject |

## stop record

- Unresolved decision/claims before the final probe: whether more search has a
  general monotonic benefit and whether stopping can use one numeric threshold.
- What the final probe could have changed: an independent primary study with a
  general stopping threshold could have justified a stronger rule.
- Why research stopped: all promotion-relevant structural claims had multiple
  or directly applicable sources; further returned results repeated benchmark
  dimensions, while no credible universal threshold was found within scope.
- Remaining conflicts or unsupported claims: the shape of quality versus tool
  calls is configuration-specific; no universal call budget is supported.

## decision analysis

- Objective: improve factual support and decision quality without turning each
  research run into an unbounded audit.
- Constraints/assumptions: one watchlist topic, four-query budget, primary or
  official sources, no local research-agent benchmark, recent papers include
  preprints and vendor-affiliated work.
- Baseline: current workflow checks whether a citation supports a claim but
  does not require an explicit accessibility/relevance/support split or a
  marginal-evidence stop record.
- Promoted option: add a claim ledger for consequential claims plus a
  decision-value stop record.
- Pros: makes overstatement and decorative citations visible; gives search
  expansion a concrete purpose; is statically reviewable in Markdown.
- Cons: adds review effort and table overhead for broad runs; automated or
  model-based claim judges can still be biased or wrong.
- Alternative: keep only the existing narrative source check. It is cheaper,
  but easier to satisfy with working yet non-supporting links and gives no
  explicit reason for stopping.
- Evidence/uncertainty: multiple benchmarks support the evaluation split; the
  stopping inference is conservative because direct depth evidence is limited
  to a recent preprint and two-model ablation.
- Sensitivity/revision trigger: simplify the ledger if 3-5 natural runs show
  high reporting cost without catching claim errors; strengthen or automate it
  only after calibrated human comparisons show reliable gains.

## impact on LLM-Wiki

- Canonical docs updated: the two AI-agent knowledge guides named above.
- Templates/harness files updated: auto-research workflow and research brief
  skeleton.
- Project docs affected: task, test-matrix, project-status, active/TICK, and
  report indexes.
- Agent workflow affected: broad promotion runs now record claim-support and
  stopping evidence; simple direct lookups do not need the full ledger.

## reviewer decision

- Decision: promote
- Reason: the structural controls are supported by multiple primary/official
  sources, close concrete audit gaps, include applicability limits, and avoid
  unsupported numeric thresholds.
- Validation report:
  `reports/validation/2026-07-16-deep-research-claim-verification.md`.

## next review

- Next cadence trigger: weekly before broad auto-research, after 3-5 natural
  runs, or when citation/source metadata and research-agent eval methods change.
- Watchlist row: Deep research / autonomous research agents.
