---
name: probability-statistics
description: Probability and statistics guidance for evidence updates, metrics, experiments, uncertainty, calibration, causal guards, sampling, and AI/RAG quality.
date_ingested: 2026-07-01
status: active
source_type: official-research-plus-distilled-practice
source_urls:
  - https://openai.com/index/improving-mathematical-reasoning-with-process-supervision/
  - https://ai.meta.com/research/publications/astro-teaching-language-models-to-reason-by-reflecting-and-backtracking-in-context/
raw_sources:
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-12-math-reasoning-navigation-sources.md
confidence: medium
confidence_reviewed: 2026-07-12
revision_trigger: Review after a real evaluation or experiment exposes a calibration, dependence, stopping-rule, causal, or value-of-information gap.
---

# probability and statistics

Use this guide for metrics, experiments, AI/RAG evaluation, anomaly detection,
risk, forecasting, and data-driven claims.

## core checks

- Define the population, sample, unit of analysis, and time window.
- Separate count, rate, ratio, average, percentile, and distribution.
- Report baseline before claiming improvement.
- Prefer percentiles for latency and skewed distributions.
- Check sample size and selection bias.
- Use confidence intervals or uncertainty notes for estimates.
- Keep train/eval/test data separate for model or retrieval evaluation.

## evidence and belief state

Keep these labels distinct:

```text
proved       deductive result under stated premises
verified     accepted by a named independent checker
measured     observed under a pinned measurement contract
estimated    inferred from a sample or model with uncertainty
supported    evidence favors the hypothesis but does not prove it
plausible    consistent with known facts but weakly tested
unknown      evidence cannot yet distinguish material alternatives
```

Model confidence, fluent prose, repeated restatement, and agreement among
models sharing training data are not independent evidence.

## conditional reasoning and hypothesis updates

For hypothesis `H` and evidence `E`, ask about `P(E | H)`, not only whether `E`
is compatible with `H`. Evidence is discriminating when it is substantially
more expected under one live hypothesis than another.

Bayes' rule provides the formal update:

```text
P(H | E) = P(E | H) * P(H) / P(E)
```

Use numeric probabilities only when priors and likelihoods have defensible
data or elicitation. Otherwise update qualitatively:

```text
more supported | less supported | falsified | still unresolved
```

Always check the base rate. A rare cause can remain unlikely after a weakly
positive signal, and a selected sample can have a different base rate from the
production population.

Use a hypothesis ledger:

```text
Hypothesis:
Base-rate or prior evidence:
Prediction if true:
Prediction if false/alternative true:
Probe and observed result:
Dependence on earlier evidence:
Updated status:
Remaining uncertainty:
Next discriminating probe:
```

## dependence and repeated evidence

Do not multiply confidence from observations that share a cause, fixture,
cache, prompt, model family, source article, or evaluator. Repeated trials are
not independent when they share mutable state, rate limits, retrieved answers,
or correlated failure modes.

Record the unit of analysis and dependence structure. If independence is not
justified, report the observed repeated outcomes directly and use grouped,
paired, clustered, or task-level summaries appropriate to the design.

## estimation and uncertainty

- Report numerator, denominator, sample size, and selection method for rates.
- Use intervals or explicit uncertainty notes, not only point estimates.
- Distinguish statistical uncertainty from systematic bias, measurement error,
  grader error, contamination, and dataset shift.
- Predeclare the primary metric, practical effect threshold, and stopping rule
  before inspecting results.
- Separate statistical evidence from practical importance.

For a binary outcome, do not rely on a normal approximation when the sample is
small or the rate is near zero or one; use an appropriate binomial interval or
report the raw count with its limitation. Do not claim a narrow interval if the
sample itself is biased or non-representative.

## calibration

When an agent emits probabilities, evaluate whether events assigned probability
`p` occur about `p` of the time across a relevant held-out population. Report
calibration by bins or a reliability diagram, alongside discrimination and
task outcome.

The Brier score for binary events is:

```text
mean((forecast_probability - observed_outcome)^2)
```

Lower is better on the same event population, but the score mixes calibration
and resolution and depends on event prevalence. Do not compare it across
different populations without accounting for the baseline.

## causal reasoning guard

Correlation, temporal order, and pre/post improvement do not by themselves
establish causation. Before claiming `X caused Y`, record:

```text
Intervention or exposure:
Outcome:
Candidate causal path:
Confounders affecting both X and Y:
Mediators on the path:
Selection/collider risks:
Counterfactual or comparison group:
Assignment/control method:
Negative control or falsification check:
```

Prefer randomized assignment when ethical and feasible. Otherwise use a
matched comparison, interrupted time series, natural experiment, or explicit
causal model whose assumptions are visible. Changing model, prompt, tool,
budget, data, and environment together identifies the combined system change,
not the isolated effect of one component.

## AI/RAG evaluation

Useful metrics:

- retrieval hit rate / recall at k;
- precision at k;
- citation support rate;
- unsupported claim rate;
- answer exactness or rubric score;
- false positive / false negative rates;
- inter-rater agreement when humans grade outputs.

Do not report one aggregate score without error categories. RAG systems need
failure classes: missing source, stale source, wrong source, unsupported
inference, conflict ignored, and permission leak.

## experiments

For A/B or workflow experiments, record:

```text
Hypothesis:
Metric:
Population:
Sample size:
Assignment method:
Baseline:
Minimum useful effect:
Stopping rule:
Risks:
```

During sequential experiments, repeated peeking and stopping when a favorable
result appears inflates false-positive risk. Use a predeclared fixed sample or
an appropriate sequential design. Stop early for safety or hard-invariant
failure regardless of statistical convenience.

## value of information and stopping

Before another measurement or tool call, ask:

```text
Decision that could change:
Uncertainty the probe addresses:
Possible results and resulting actions:
Cost, delay, risk, and reversibility:
Would every plausible result lead to the same decision?
```

If every result leads to the same feasible decision, the probe has little
decision value. Stop when additional information is unlikely to change the
decision enough to justify its cost, or escalate when the needed information
requires new authority or expertise.

## anti-patterns

- Treating correlation as causation.
- Optimizing a proxy metric that users do not care about.
- Comparing averages when outliers dominate.
- Changing the metric after seeing results.
- Reporting model/RAG quality without a held-out eval set.
- Treating correlated observations as independent confirmation.
- Inventing precise priors, probabilities, or confidence levels without data.
- Stopping an experiment only when the preferred result appears.
- Claiming causation from a pre/post chart with uncontrolled changes.
- Gathering more data when no possible result would change the decision.
