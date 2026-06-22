# Decisions index

Cross-project decision register. Compiled from project decision logs and LLM-Wiki
governance decisions.

See [[README.md]] for status values and rules.

## status values

`proposed`, `accepted`, `superseded`, `deprecated`, `rejected`.

## index

| ID | Date | Status | Title | Source project | Link |
|---|---|---|---|---|---|
| DEC-0001 | 2026-05-23 | accepted | Link constitution amendments to feedback-loop.md procedure | llm-wiki | [[DEC-0001-constitution-amendment-feedback-loop-linkage.md]] |

## pending amendments

Entries with `Status = proposed` whose `Title` proposes a change to `llm-wiki-constitution.md` are constitutional amendments per [[../../harness/feedback-loop.md#amendment-proposal]]. While proposed:

- Date column shows `drafted YYYY-MM-DD`; the seed-format "date accepted" rule kicks in only on acceptance.
- AI must not edit `llm-wiki-constitution.md` while the entry remains `proposed`.
- Acceptance: human owner replies "accept DEC-NNNN"; AI then applies the change, switches Status to `accepted`, sets Date to acceptance day, and adds a §19 changelog row.
- Rejection: human replies "reject DEC-NNNN"; AI switches Status to `rejected` and preserves the file for audit.

## seed format

When filing a new decision row, also add a full decision file under this folder
or link to the source project decision log. Required fields per row:

- `ID`: `DEC-NNNN` zero-padded
- `Date`: `YYYY-MM-DD` (date accepted, not proposed)
- `Status`: one of the values above
- `Title`: imperative, short
- `Source project`: project that produced the decision, or `llm-wiki` for governance
- `Link`: relative path to the decision file
