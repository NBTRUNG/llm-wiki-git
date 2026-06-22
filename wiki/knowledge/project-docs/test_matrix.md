# test matrix guide

## purpose

`docs/test_matrix.md` maps project tasks or behavior to proof.

It prevents "done" from meaning only "code was written".

For procedural usage (update workflow, evidence rules), see `harness/test-matrix.md`.

For the fillable template, see `templates/test_matrix.template.md`.

## include

- Task/story ID matching `docs/tasks.md`.
- Contract or behavior being proven.
- Proof layers (see below).
- Status.
- Evidence links.

## proof layers

| Layer | Proves |
| --- | --- |
| Unit | Domain logic, pure functions, isolated rules |
| Integration | Backend enforcement, database, provider, service contract |
| E2E | User-visible workflow |
| Platform | Shell, deployment, runtime, OS, infra behavior |
| Release | Migration, rollback, smoke test, config, secrets, backup |
| Manual review | Product owner/user confirmation |

## status values

| Status | Meaning |
| --- | --- |
| `planned` | Accepted as intended behavior, not implemented |
| `in_progress` | Actively being built |
| `implemented` | Implemented and proof exists |
| `changed` | Contract changed after earlier implementation |
| `retired` | No longer part of the product contract |

## quality criteria

- Every task row has a matching test matrix row.
- Implemented rows link to evidence.
- Missing proof is explicit.
- Long logs are linked, not pasted.
- The matrix distinguishes planned proof from completed proof.

## anti-patterns

- Marking proof as yes without evidence.
- Copying full logs into the matrix.
- Reusing a row after task scope changes.
- Ignoring manual/release proof for high-risk work.