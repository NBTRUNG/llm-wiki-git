# test matrix

Guide before filling: `wiki/knowledge/project-docs/test_matrix.md`

## status values

| status | meaning |
| --- | --- |
| planned | Accepted as intended behavior, not implemented |
| in_progress | Actively being built |
| implemented | Implemented and proof exists |
| changed | Contract changed after earlier implementation |
| retired | No longer part of the product contract |

## proof layers

| layer | proves |
| --- | --- |
| unit | Domain logic, pure functions, isolated rules |
| integration | Backend enforcement, database, provider, service contract |
| e2e | User-visible workflow |
| platform | Shell, deployment, runtime, OS, infra behavior |
| release | Migration, rollback, smoke test, config, secrets, backup |
| manual review | Product owner/user confirmation |

## matrix

| story/task | contract | unit | integration | e2e | platform | release | manual review | status | evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| TBD | Add rows when task/story is created | no | no | no | no | no | no | planned | none |

## evidence rules

- A proof column can be `yes`, `no`, or `n/a`.
- If a proof layer is `n/a`, explain why in evidence.
- Do not paste long logs here; link to `reports/validation/` or `logs/test-output/`.
