---
name: functions-rates-and-measurement
description: Mathematical guidance for functions, finite differences, derivatives, sensitivity, measurement design, and fair software-efficiency comparisons.
date_ingested: 2026-07-10
status: active
source_type: current-source-research-plus-distilled-practice
source_project: llm-wiki
source_urls:
  - https://ocw.mit.edu/courses/18-01sc-single-variable-calculus-fall-2010/pages/syllabus/
  - https://ocw.mit.edu/courses/18-01sc-single-variable-calculus-fall-2010/pages/1.-differentiation/part-a-definition-and-basic-rules/session-3-derivative-as-rate-of-change/
  - https://www.nist.gov/metrology/metrological-traceability
  - https://google.github.io/benchmark/user_guide.html
  - https://google.github.io/benchmark/tools.html
  - https://docs.python.org/3/library/timeit.html
confidence: medium
confidence_reviewed: 2026-07-10
revision_trigger: Review when a real performance study exposes a missing metric, comparison bias, derivative/sensitivity misuse, or tool-specific benchmarking caveat.
---

# functions, rates, and measurement

Use this guide when code maps inputs to outputs, behavior changes with scale,
small input changes may amplify, or two implementations must be compared.

The mathematical goal is not to add formulas for appearance. It is to name the
function being studied, how change is measured, which variables are controlled,
and what evidence supports a decision.

## model the function

Write the system as a mapping before optimizing it:

```text
Inputs and domain:
Output and unit:
Parameters/configuration:
Hidden state or external dependencies:
Constraints:
Function or relation:
Valid comparison range:
```

Examples:

- `latency = f(input_size, concurrency, cache_state, hardware)`;
- `memory = f(records, representation, batch_size)`;
- `quality = f(model, prompt, dataset, threshold)`;
- `cost = f(requests, tokens, storage, retry_rate)`.

If important inputs are omitted, an apparent improvement may be a workload or
environment change rather than a better implementation.

## discrete change before derivatives

Most software variables are discrete. Start with finite differences:

```text
absolute change:      Delta y = y_new - y_old
relative change:      (y_new - y_old) / y_old
discrete marginal:    f(n + h) - f(n)
difference quotient:  (f(n + h) - f(n)) / h
```

State the denominator and handle zero or sign-changing baselines explicitly.
Percentage change is undefined when the baseline is zero and can mislead when
the baseline is very small.

Use a derivative only when a continuous or locally smooth model is meaningful:

```text
f'(x) = local rate of output change per unit input change
```

For software reasoning, derivatives and gradients are useful for:

- marginal latency/cost as load grows;
- sensitivity of an output to a parameter or measurement error;
- local linear approximation near an operating point;
- locating candidate extrema in a continuous optimization model;
- understanding which variable has the largest local influence.

Do not infer global behavior from a local derivative. Branches, thresholds,
cache eviction, queue saturation, integer choices, and discontinuities can
invalidate smooth approximations.

## sensitivity and propagation

For `y = f(x)`, a small change can be approximated locally by:

```text
Delta y approximately f'(x) * Delta x
```

With several inputs, inspect one-at-a-time finite differences or a gradient,
but also check interactions. A variable with a small local derivative may still
matter after a threshold or across a larger range.

Use sensitivity analysis to ask:

- Which assumption most changes the conclusion?
- How much input error can the result tolerate?
- Does a threshold create unstable behavior?
- Is an optimum robust or only valid at one operating point?
- Which parameter needs better measurement or tighter control?

## accumulation and conservation

Sums and integrals express accumulated work:

- per-request cost times request volume;
- bytes per item accumulated over a dataset;
- queue arrivals minus completions over time;
- error accumulated across numerical steps;
- resource consumption across pipeline stages.

Before averaging, check totals and conservation laws. A lower mean latency can
coexist with more total work, a worse tail, or a growing backlog.

## define efficiency as a vector

Efficiency is not one universal scalar. Select dimensions that match the
decision:

```text
correctness and safety constraints
latency distribution
throughput
CPU and memory
I/O and network calls
allocations and storage
financial or energy cost
implementation/maintenance complexity
failure and retry rate
```

Treat correctness, security, and required quality as constraints, not weights
that a faster result may offset. When no option dominates every dimension,
show the trade-off or Pareto frontier instead of inventing an unexplained
combined score.

## comparison formulas

For a metric where lower is better, such as latency:

```text
absolute reduction = old - new
relative reduction = (old - new) / old
speedup            = old / new
```

Example: `120 ms -> 90 ms` is a `30 ms` reduction, a `25%` latency reduction,
and approximately `1.33x` speedup. These are related but not interchangeable.

For a metric where higher is better, such as throughput:

```text
absolute increase = new - old
relative increase = (new - old) / old
factor             = new / old
```

Always distinguish percentage points from percentage change. A success rate
moving from `40%` to `50%` rises by `10 percentage points` or `25%` relative.

## complexity and measurement answer different questions

```text
complexity model -> how cost grows as input size changes
benchmark        -> observed cost for a pinned workload and environment
```

Big-O can miss constants, caches, vectorization, I/O, and the current input
range. A benchmark at one small size cannot establish the growth class. Use
both when scale matters:

1. derive the expected operation/memory/I/O growth;
2. measure several representative sizes;
3. compare the observed curve with the expected model;
4. investigate thresholds, discontinuities, and residuals.

For a continuous approximation such as `T(n) = a * n * ln(n)`, the derivative
`a * (ln(n) + 1)` describes local marginal growth. For the actual discrete
program, also inspect `T(n + 1) - T(n)` and measured behavior.

## measurement contract

NIST measurement framing is useful beyond physical instruments: a measurement
result needs a defined quantity, a comparison/reference, and an account of
remaining uncertainty.

Before measuring software, record:

```text
Question/decision:
Measurand and unit:
Baseline/reference:
Implementation versions:
Workload and input distribution:
Hardware/runtime/environment:
Warm-up and setup policy:
Timer/counter and resolution:
Repetitions and ordering:
Controlled variables:
Known noise/systematic bias:
Raw results and summary statistics:
Practical decision threshold:
```

One timing is not a distribution. Repeat measurements, retain raw observations,
and report spread. Randomized or interleaved ordering can reduce drift from
changing machine state. Pair runs when the same inputs should be compared.

## fair comparison protocol

1. Verify both implementations are functionally equivalent on the comparison
   domain.
2. Define the primary metric and guardrail metrics before seeing results.
3. Pin code, compiler/runtime, dependencies, hardware, workload, and config.
4. Separate setup, warm-up, and measured work deliberately.
5. Prevent dead-code elimination, cache artifacts, or fixture reuse from
   changing what is measured.
6. Measure representative input sizes, shapes, concurrency, and cold/warm
   states.
7. Repeat enough times to expose variance; inspect median, spread, tails, and
   failures, not only a favorable run.
8. Report absolute change, relative change, and units with the same baseline.
9. Separate statistical evidence of a difference from practical importance.
10. Re-run in a production-like environment before making a production claim.

Microbenchmark tools have different goals. Python `timeit` commonly uses the
best repeated time to reduce interference for small snippets. Google Benchmark
can report repeated-run mean, median, standard deviation, and coefficient of
variation. Choose and explain the summary based on the noise model; do not mix
tool conventions without context.

## recommendation as a decision comparison

A recommendation is a comparison over a feasible set, not a list of favorable
properties. Let each option have an outcome vector rather than assuming one
universal score:

```text
option x -> (correctness, latency, cost, risk, maintainability, delivery time)
```

Use this contract:

1. State the objective and direction for each material dimension.
2. State hard constraints and reject infeasible options before ranking.
3. Name the status quo or nearest feasible alternative as the baseline.
4. Report pros as favorable deltas and cons as unfavorable deltas, with units
   and common workload/domain where measurable.
5. Separate measured deltas from estimates and qualitative judgments.
6. Test sensitivity: identify which assumption, input range, threshold, or
   weight could reverse the recommendation.
7. If one option is no worse in every dimension and better in at least one, say
   that it dominates on the stated dimensions. Otherwise expose the Pareto
   trade-off and let the decision owner choose or supply weights.

Do not fabricate numeric scores, probabilities, weights, or precision. A
qualitative `Pros`/`Cons` comparison with explicit uncertainty is more rigorous
than unsupported arithmetic. Opportunity cost, reversibility, and the cost of
being wrong are valid disadvantages even when direct runtime metrics improve.

## decision record

```text
Correctness equivalence:
Function/model:
Baseline and candidate:
Inputs/range:
Expected growth or sensitivity:
Metrics and units:
Repetitions/raw evidence:
Absolute and relative result:
Uncertainty/noise:
Trade-offs and guardrails:
Decision:
Revision/rollback trigger:
```

## related guides

- [proof-techniques.md](proof-techniques.md)
- [probability-statistics.md](probability-statistics.md)
- [optimization.md](optimization.md)
- [numerical-methods.md](numerical-methods.md)
- [../algorithms/complexity.md](../algorithms/complexity.md)
- [../algorithms/numerical-statistics.md](../algorithms/numerical-statistics.md)
- [../coding/testing-strategy.md](../coding/testing-strategy.md)

## anti-patterns

- Calling one run a benchmark or treating the fastest screenshot as typical.
- Comparing different inputs, environments, correctness levels, or cache states.
- Reporting a percentage without its baseline and denominator.
- Confusing percentage points, percentage change, and multiplicative speedup.
- Applying derivatives to discontinuous or purely discrete behavior without a
  model and finite-difference check.
- Inferring global scaling from a local slope or one input size.
- Declaring a statistically detectable difference practically important.
- Improving average latency while ignoring tail latency, errors, memory, cost,
  security, or maintainability.
- Combining incomparable units into an unexplained efficiency score.
