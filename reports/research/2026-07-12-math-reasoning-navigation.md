# Math Reasoning Navigation Refresh

Topic: Bounded reasoning navigation for AI agents
Date: 2026-07-12
Owner: Codex
Cadence reason: ad hoc, explicitly authorized by the human owner
Status: promoted

## decision need

- What decision or guideline may change: whether Math Pack needs an operational
  controller for method selection, search, verifier feedback, backtracking,
  uncertainty updates, and stopping.
- Target docs if promoted: Math Pack router, new reasoning guide,
  probability/statistics guide, and direct session/coding pack projections.
- Exclusions: reproducing Big Tech training infrastructure, hidden
  chain-of-thought capture, universal branch budgets, or model rankings.

## search/tool bounds

- Official company research pages and original papers only for promoted
  company-specific claims.
- Sources checked: Google DeepMind, OpenAI, Meta AI, and Microsoft Research.
- Durable official snapshots retained when download and integrity checks
  succeeded. The Microsoft Lean page was checked online but its server rejected
  the bounded raw download, so no partial file was retained.

## sources checked

| Source | Type | Accessed | Relevance | Promotion use |
| --- | --- | --- | --- | --- |
| [AlphaProof and AlphaGeometry 2](https://deepmind.google/blog/ai-solves-imo-problems-at-silver-medal-level/) | official research | 2026-07-12 | Learned proposal, formalization, search/RL, Lean verification, and verified feedback. | Operational propose-search-verify loop. |
| [Improving mathematical reasoning with process supervision](https://openai.com/index/improving-mathematical-reasoning-with-process-supervision/) | official publication + primary paper | 2026-07-12 | Step-level labels and process reward models; explicitly limits generalization beyond math. | Auditable step obligations without treating final outcome alone as enough. |
| [ASTRO](https://ai.meta.com/research/publications/astro-teaching-language-models-to-reason-by-reflecting-and-backtracking-in-context/) | official primary-research page | 2026-07-12 | Search-derived traces, reflection, recovery from failed paths, and verifiable rewards. | Bounded exploration and explicit backtracking. |
| [Meta neural theorem proving](https://ai.meta.com/blog/ai-math-theorem-proving/) | official research | 2026-07-12 | Proof states as graph nodes, candidate steps as edges, tree search, Lean feedback. | Candidate frontier and verifier-localized progress. |
| [Microsoft Lean](https://www.microsoft.com/en-us/research/project/lean/) | official project page | 2026-07-12 | Machine-checkable mathematics and proof automation. | Verification boundary; URL reference only. |

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| Separate proposal/search from verification and feed verifier results back into the next bounded step. | high | candidate-update | Several proof, debugging, or solution paths exist. | Routine edits with one obvious verified action. |
| Record rejected paths and invalidated assumptions so the agent can backtrack without restarting or repeating work. | medium | candidate-update | A path fails after non-trivial exploration. | As a demand for hidden chain-of-thought. |
| Select reasoning mode from claim shape before choosing tools or formulas. | high | candidate-update | Formal, empirical, causal, optimization, or numerical claims. | Simple factual lookup. |
| Statistical evidence updates need base rates, dependence checks, calibration, causal guards, and stopping rules. | high | candidate-update | Noisy evaluations, experiments, forecasts, or causal claims. | Pure deductive proof with accepted premises. |
| Copy Big Tech reinforcement-learning/search infrastructure into LLM-Wiki. | high | rejected | N/A | LLM-Wiki is a knowledge/workflow vault, not a model-training lab. |

## promotion decision

- Added `wiki/knowledge/math/reasoning-navigation.md` as an execution-time
  controller rather than a new workflow.
- Expanded `probability-statistics.md` for evidence updates, dependence,
  calibration, causal inference, sequential stopping, and value of information.
- Updated only direct Math Pack routing projections. No real repo was
  backfilled and no model-training/runtime system was added.

## validation

- Report:
  `reports/validation/2026-07-12-math-reasoning-navigation.md`.
- Empirical gap: exercise on 3-5 reasoning-heavy tasks before adding fixed
  branch budgets, more templates, or automation.

## next review

- Next trigger: a repeated reasoning search loop, failed backtrack, causal
  misattribution, poorly calibrated forecast, or evidence that the router adds
  overhead without changing decisions.
- Watchlist row: AI agents/RAG/evaluation/tool use and testing/proof strategy.

