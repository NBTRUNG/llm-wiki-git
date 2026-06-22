# test matrix

The test matrix maps product behavior to proof.

Canonical template (includes proof layers and status values):

```text
../templates/test_matrix.template.md
```

Quality guide (criteria, anti-patterns):

```text
wiki/knowledge/project-docs/test_matrix.md
```

## rule

Code existing is not enough.

Behavior is `implemented` only when:

- the intended contract is written;
- proof exists or missing proof is explicitly documented;
- evidence path is recorded.

## update rules

- Add a row when a normal/high-risk task creates or changes behavior.
- Set status `planned` before implementation.
- Set status `in_progress` while building.
- Set status `implemented` only after evidence exists.
- Set status `changed` when the contract changes.
- Set status `retired` when behavior is removed from scope.

## evidence

Link to:

- `reports/validation/`;
- `logs/test-output/`;
- screenshots;
- reviewer notes.

Do not paste long logs into the matrix.