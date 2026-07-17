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
| DEC-0002 | 2026-07-10 | accepted | Make Agent Platform the owner of active raw artifacts | llm-wiki | [[DEC-0002-agent-platform-owns-active-raw.md]] |
| DEC-0003 | 2026-07-11 | accepted | Adopt the LLM-Wiki Agent Delivery Workflow | llm-wiki | [[DEC-0003-agent-delivery-workflow.md]] |
| DEC-0004 | 2026-07-11 | accepted | Adopt a human projection and manual recovery path | llm-wiki | [[DEC-0004-human-projection-and-manual-recovery.md]] |
| DEC-0005 | 2026-07-11 | accepted | Adopt a shared Bounded Change Fast Path | llm-wiki | [[DEC-0005-bounded-change-fast-path.md]] |
| DEC-0006 | 2026-07-11 | accepted | Adopt one cross-repo P1 bounded coding projection | llm-wiki | [[DEC-0006-p1-bounded-coding-projection.md]] |
| DEC-0007 | 2026-07-16 | accepted | Make Human-Agent Hybrid Control the default operating model | llm-wiki | [[DEC-0007-human-agent-hybrid-control-default.md]] |

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
