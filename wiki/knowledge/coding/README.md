# coding knowledge

Canonical coding/repo implementation rules:

- [agent-coding-workflow.md](agent-coding-workflow.md) — required capability-aware coding bootstrap. Eligible `P2` agents read the full pack once; `P0/P1` agents require a validated task-named projection.
- [bounded-coding-core.md](bounded-coding-core.md) — canonical cross-repo
  `P1-BOUNDED-CODING` projection for qualified C2-C3 bounded work; compose with
  repo coordinates and exact task reads.
- [karpathy-guidelines.md](karpathy-guidelines.md) — behavioral principles, invariants, pre/postconditions, stepwise refinement, and large-surface guard.
- [repo-code-rules.md](repo-code-rules.md) — long-form rules for code/review/test/docs in a real repo.
- [code-quality.md](code-quality.md) — naming, function shape, error handling, types, banned patterns.
- [output-quality.md](output-quality.md) — delivery gate for correctness, user fit, security, performance, reviewability, evidence, handoff, and residual risk. Use beside code-quality.
- [implementation-quality-matrix.md](implementation-quality-matrix.md) — acceptance matrix for code, technology, design-system, security, output, and test evidence.
- [security-baseline.md](security-baseline.md) — code-level security baseline; cross-references OWASP Top 10 2025.
- [testing-strategy.md](testing-strategy.md) — proof layers, test structure, error coverage.
- [agent-coding-risks.md](agent-coding-risks.md) — agent-specific coding risks: context injection, excessive agency, false evidence, destructive tool use, data damage, dependency drift, and handoff loss.

Keep examples, testing strategy, review checklists, and lessons learned in separate files when they become reusable. Do not duplicate the canonical rules here.

## Math Pack companion rule

Coding Pack is always the code-facing baseline. Add
[../math/README.md](../math/README.md) when implementation or review requires:

- precise definitions, quantified requirements, invariants, or proof;
- algorithms, state machines, recursion, concurrency, or refactor equivalence;
- performance/complexity, rates of change, capacity, or sensitivity;
- metrics, experiments, numerical precision, optimization, or a fair
  effectiveness comparison.

Use [../math/proof-techniques.md](../math/proof-techniques.md) for expressing
and checking arguments. Use
[../math/functions-rates-and-measurement.md](../math/functions-rates-and-measurement.md)
for functions, finite differences/derivatives, measurement, baselines, and
efficiency claims. This trigger applies to junior, senior, and expert work;
experience is not evidence that an unstated assumption or comparison is valid.
