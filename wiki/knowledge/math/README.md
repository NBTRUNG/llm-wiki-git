---
name: math-knowledge-pack
description: Companion pack for coding and formal analysis: reasoning navigation, formal logic, precise claims, proofs, functions, rates, measurement, algorithms, data, optimization, statistics, numerical precision, and domain calculations.
date_ingested: 2026-07-01
status: active
source_type: research-plus-distilled-practice
source_urls:
  - https://arxiv.org/abs/2606.08728
  - https://mathcs.clarku.edu/~djoyce/java/elements/bookI/bookI.html
  - https://ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-spring-2015/
  - https://builds.openlogicproject.org/open-logic-complete.pdf
  - https://smt-lib.org/papers/smt-lib-reference-v2.7-r2025-04-09.pdf
  - https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/
  - https://ocw.mit.edu/courses/18-01sc-single-variable-calculus-fall-2010/pages/syllabus/
  - https://www.nist.gov/metrology/metrological-traceability
  - https://google.github.io/benchmark/user_guide.html
  - https://deepmind.google/blog/ai-solves-imo-problems-at-silver-medal-level/
  - https://openai.com/index/improving-mathematical-reasoning-with-process-supervision/
  - https://ai.meta.com/research/publications/astro-teaching-language-models-to-reason-by-reflecting-and-backtracking-in-context/
raw_sources:
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-08-classical-math-agent-reasoning-sources.md
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-12-math-reasoning-navigation-sources.md
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-16-formal-logic-and-inference-sources.md
confidence: medium
confidence_reviewed: 2026-07-16
---

# math knowledge pack

Use this pack when a task needs formal reasoning, classical logic and inference,
formulas, proof, probability, statistics, optimization, numerical precision,
classical mathematical thinking, domain calculations, or bounded
search/backtracking with verifier feedback.

This pack supports Coding, Algorithms, Data, AI/RAG evaluation, and domain
role packs. It is trigger-based. Do not load it for ordinary CRUD, UI copy,
simple config, or business logic that does not require formal reasoning.

## relationship to algorithms

```text
math/ = concepts, assumptions, formulas, proof patterns, numerical caveats
algorithms/ = implementation choices, libraries, complexity, benchmarks, proof evidence
```

Use both packs when implementation depends on formal correctness.

## relationship to coding

Coding Pack and Math Pack are complementary, not seniority levels.

```text
Coding Pack = implementation discipline, security, tests, delivery evidence
Math Pack   = precise statements, logical dependencies, proof, models,
              rates, measurement, uncertainty, and comparison
```

Load Coding Pack for every code-facing session. Add Math Pack when the task has
a reasoning trigger: a non-trivial invariant, algorithm, state transition,
performance claim, capacity model, metric, optimization, numerical rule, or a
requirement whose meaning must be formalized. Junior, senior, and expert
developers are equally capable of skipping hidden assumptions; experience does
not remove the proof or measurement obligation.

Do not load Math Pack for every ordinary code edit. The pairing is triggered by
the problem shape, not by the job title or a desire to make simple work look
formal.

## recommendation trade-off rule

Whenever an agent recommends an option, it must make the comparison decidable
instead of reporting only benefits. This rule applies even when the agent gives
one preferred option: compare it with the status quo or nearest feasible
alternative.

```text
Recommendation/option:
Objective or decision criterion:
Constraints and assumptions:
Baseline or alternative:
Pros (which objective improves, and by how much when measured):
Cons (which objective worsens, new risk, or opportunity cost):
Evidence and uncertainty:
Sensitivity/revision trigger:
```

Treat correctness, safety, privacy, and mandatory contracts as constraints
unless the decision owner explicitly makes them negotiable. Preserve units and
baselines for quantitative claims. For competing objectives, present a vector
of effects or Pareto trade-off rather than inventing weights or a single score.
If no disadvantage is known within the stated domain, write that explicitly and
retain the uncertainty/revision trigger.

## triggers

- proving invariants, preconditions, postconditions, or correctness;
- translating informal requirements into quantified, checkable claims;
- separating syntax, semantics, satisfiability, validity, entailment, and
  derivability before choosing a verifier;
- checking propositional or quantified inference, countermodels, variable
  capture, witness freshness, or solver-theory assumptions;
- reviewing whether an argument proves the stated problem or a weaker converse;
- clarifying definitions, assumptions, counterexamples, and proof obligations
  before coding or debugging;
- estimating runtime, capacity, growth, probability, or risk;
- using finite differences, rates/derivatives, sensitivity, bounds, or
  approximation to understand behavior as inputs change;
- defining a measurand, baseline, repetitions, uncertainty, and fair comparison
  before claiming one implementation is more efficient;
- estimating migration batch size, cutover window, reconciliation tolerance,
  shard distribution, or load/capacity headroom;
- statistical metrics, experiments, A/B tests, confidence intervals, or
  evaluation quality;
- AI/RAG retrieval metrics, ranking quality, embeddings, vector similarity, or
  model-quality evaluation;
- optimization, scheduling, routing, allocation, constraints, or linear
  programming;
- numerical precision, rounding, floating point, money, tax, customs, scoring,
  finance, or units/conversions;
- domain calculations where formula assumptions must be explicit.

## read order

| Intent | Read |
| --- | --- |
| Select a reasoning mode, manage candidate paths, use verifier feedback, backtrack, or decide when to stop/escalate | [reasoning-navigation.md](reasoning-navigation.md) |
| Formalize classical propositional/first-order claims, check inference and quantifier guards, seek countermodels, or route truth-table/SAT/SMT/proof-assistant verification | [formal-logic-and-inference.md](formal-logic-and-inference.md) |
| Frame a problem with definitions, assumptions, constructions, counterexamples, or proof obligations | [classical-mathematical-thinking.md](classical-mathematical-thinking.md) |
| Express a precise claim, select a proof method, prove correctness/invariants, or review an argument | [proof-techniques.md](proof-techniques.md) |
| Model functions, finite differences, rates/derivatives, sensitivity, measurement, or efficiency comparisons | [functions-rates-and-measurement.md](functions-rates-and-measurement.md) |
| Count, reason about graphs/sets, or complexity foundations | [discrete-math.md](discrete-math.md) |
| Evidence updates, metrics, experiments, uncertainty, calibration, causal reasoning, or statistical evaluation | [probability-statistics.md](probability-statistics.md) |
| Embeddings, vectors, ranking, PCA-like transforms, or ML foundations | [linear-algebra.md](linear-algebra.md) |
| Allocation, routing, scheduling, constraints, or objective functions | [optimization.md](optimization.md) |
| Floating point, rounding, money, precision, or numerical stability | [numerical-methods.md](numerical-methods.md) |
| Tax/customs/finance/domain formulas | [domain-calculations.md](domain-calculations.md) |

## pack composition

Use Math Pack with other packs when the formal reasoning depends on system
context:

| Situation | Also read |
| --- | --- |
| Non-trivial code correctness, state transitions, refactoring equivalence, or performance claims | [../coding/README.md](../coding/README.md), [proof-techniques.md](proof-techniques.md), [functions-rates-and-measurement.md](functions-rates-and-measurement.md) when measurement is involved |
| Data migration/backfill sizing, sampling, reconciliation, or cutover-risk estimate | [../data/migrations-operations.md](../data/migrations-operations.md), [probability-statistics.md](probability-statistics.md) |
| Sharding, partition-key distribution, hot-partition analysis, or capacity model | [../data/performance-scale.md](../data/performance-scale.md), [discrete-math.md](discrete-math.md), [probability-statistics.md](probability-statistics.md) |
| Load balancing, queue capacity, saturation, or performance target | [../reliability-sre/capacity-performance.md](../reliability-sre/capacity-performance.md), [probability-statistics.md](probability-statistics.md) |
| Optimization target, placement, routing, scheduling, or allocation | [optimization.md](optimization.md), [../algorithms/optimization-scheduling.md](../algorithms/optimization-scheduling.md) |

## required output

Math-heavy work must report:

```text
Statement/decision question:
Definitions and quantifiers:
Logic, domain, theory, and signature:
Premises, conclusion, and quantifier scope:
Countermodel query and result:
Verifier semantics/configuration:
Quantity/formula:
Assumptions:
Units and domain:
Inputs and valid range:
Invariant or correctness condition:
Proof method or comparison design:
Error/rounding/precision policy:
Edge cases:
Counterexample/falsification attempt:
Evidence/test:
Proved, measured, inferred, and still unknown:
```

When the output includes a recommendation, append the recommendation trade-off
fields above even if the rest of the task is not calculation-heavy.

## AI-assisted mathematical reasoning

AI models may help with conjecture generation, search, explanation drafts,
translation between informal and formal notation, and finding likely proof
paths. They are not proof authorities. Treat model output as a candidate until
it is checked by a verifier, proof assistant, independent solver, property
tests, symbolic checker, numerical error analysis, or human mathematical review.

For AI-assisted math work, report the evaluation mode:

```text
Reasoning target:
Verifier used:
pass@1 / pass@k / verifier-assisted result:
Benchmark or contamination risk:
Failure mode considered:
Human review needed:
```

Use verifier-assisted workflows for high-stakes calculations, algorithm
correctness, optimization claims, cryptography, finance, or scientific results.
Do not treat chain-of-thought length, model confidence, or majority voting as a
substitute for proof.

For inspectable proof-writing and claim-normalization rules, use
[proof-techniques.md](proof-techniques.md). For performance or effectiveness
claims, use [functions-rates-and-measurement.md](functions-rates-and-measurement.md)
and separate mathematical growth arguments from empirical measurements.

## anti-patterns

- Applying formulas without units, assumptions, or input ranges.
- Assuming seniority or intuition removes the need to state definitions,
  quantifiers, invariants, baselines, or counterexamples.
- Writing formal-looking prose without a checkable premise-to-conclusion chain.
- Using floating point equality for money, scoring, or threshold decisions.
- Reporting statistical improvement without sample size and baseline.
- Treating correlation as causation.
- Optimizing a model/objective that does not match the business goal.
- Hiding domain/legal/tax assumptions inside code constants.
- Treating average load as enough evidence when tail latency, burst rate, hot
  keys, or uneven shard distribution can dominate the failure mode.
- Promoting AI-generated math without an independent verification path.
- Claiming efficiency from one timing, one input size, or an unexplained
  percentage.
