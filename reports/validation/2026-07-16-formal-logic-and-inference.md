# Formal Logic and Inference Validation

Date: 2026-07-16

Scope: Add one bounded classical formal-logic and verifier-routing guide to Math
Pack and close FLQ-006 without creating unsupported logic subpacks.

Task/story: LLMWIKI-092

Validator: Codex

## source

- Project: LLM-Wiki.
- Canonical source of truth:
  `wiki/knowledge/math/formal-logic-and-inference.md`.
- Research brief:
  `reports/research/2026-07-16-formal-logic-and-inference.md`.
- Raw source record:
  `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-16-formal-logic-and-inference-sources.md`.
- Snapshots: Open Logic Project PDF, SMT-LIB 2.7 PDF and examples, and
  official Lean proposition/quantifier HTML, all retained with byte counts and
  SHA-256 checksums.
- Commit/build/version: local Markdown workspace; this directory is not a Git
  worktree.

## commands run

```text
sha256sum of all five retained source snapshots
bash harness/feedback-loop-lint.sh
finite two-valued `awk` probe for modus ponens, affirming the consequent,
denying the antecedent, and quantifier-order separation
targeted rg/readback of scope, semantic distinctions, quantifier guards,
verifier routes, task/test/status rollups, and report indexes
```

## results

| Check | Result | Notes |
| --- | --- | --- |
| Source integrity | passed | Five retained files match the source-record byte counts and SHA-256 values. |
| Bounded scope | passed | One Math Pack file; classical propositional/FOL only; specialized logic families remain consumer-gated. |
| Semantic distinctions | passed | Syntax, semantics, satisfiability, validity, entailment, consistency, countermodels, and derivability are separated. |
| Propositional inference | passed | Safe rules and minimal countermodels for affirming the consequent, denying the antecedent, converse, disjunct, and examples-to-universal errors are explicit. |
| Quantifier safety | passed | Scope, dependency order, capture-free substitution, arbitrary/fresh universal introduction, and non-escaping existential witnesses are explicit. |
| Finite logic probes | passed | Two-valued enumeration found zero modus-ponens countermodels and one countermodel each for affirming the consequent and denying the antecedent; equality on a two-element domain separated `forall x exists y` from `exists y forall x`. |
| Verifier boundary | passed | Truth table, SAT, SMT, proof assistant/theorem prover, bounded state exploration, executable tests, and human semantic review have distinct evidence boundaries. |
| Solver-proof guard | passed | `sat`, `unsat`, `unknown`, timeout, selected theory, proof certificate, axioms, and formalization-to-requirement review are not conflated. |
| Routing and state | passed | Math README, FLQ queue, task ledger, test matrix, project status/direction, active/TICK, and report indexes link the canonical file and evidence. |
| Wiki lint/link validation | passed | `0 failure(s), 0 warning(s)`; 532 active wikilinks and 675 Markdown links resolved. |

## static acceptance probes

| Probe | Expected | Guide result |
| --- | --- | --- |
| `P -> Q`, `P`, therefore `Q` | valid modus ponens | routed as safe when both premises match |
| `P -> Q`, `Q`, therefore `P` | invalid | countermodel `P=false`, `Q=true` supplied |
| `forall x exists y R(x,y)` to `exists y forall x R(x,y)` | invalid in general | dependency/order countermodel strategy supplied |
| `Gamma |= phi` | seek model of `Gamma and not phi` | model disproves; unsat supports entailment inside encoded boundary |
| Integer/real/bit-vector arithmetic | semantics differ | smallest faithful SMT-LIB logic and theory required |
| Kernel-accepted proof | encoded proposition checked | separate review still required for axioms and real requirement mapping |

## gaps

- No local SAT/SMT/proof-assistant runtime was integrated or benchmarked; that
  is outside the approved knowledge scope.
- Manual human review is pending; user authorization started the task but does
  not by itself accept every wording choice.
- Empirical usability is `needs-review`: exercise the guide on 3-5 real
  formalization or correctness tasks and record invalid inference caught,
  countermodel usefulness, verifier mismatch, and reporting cost.

## decision

- Implemented with empirical usability `needs-review`.
- Keep one file as the baseline. Split or add a specialized logic family only
  when a named consumer, formal semantics, verifier contract, and measured
  navigation/maintenance benefit exist.
- Simplify or merge the guide if 3-5 real tasks show that its distinct checks
  add reporting cost without catching inference or verifier-boundary errors.
