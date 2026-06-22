# LLM-Wiki architecture snapshot refresh

Date: 2026-06-14

## scope

Refresh `wiki/projects/llm-wiki/wiki/architecture.md` so the LLM-Wiki
self-project architecture snapshot reflects the current model after the June
2026 Hermes and multi-agent workflow passes.

## files changed

- `wiki/projects/llm-wiki/wiki/architecture.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `active.md`
- `reports/validation/README.md`

## checks

- Confirmed the old `compact core rules` architecture gap is no longer a live
  gap in `active.md` or `project_status.md`.
- Updated the architecture snapshot with:
  - evidence-backed feedback loop and LWOE measurement flow;
  - `agents/<agent>/AGENT.md` single control-card standard;
  - Lead-orchestrated and Human-orchestrated multi-agent modes;
  - integration-owner requirement before combining outputs;
  - shared-file section/row lock delegation;
  - Markdown merge-plan staging;
  - Hermes as optional read-only advisory infrastructure.
- Ran `harness/feedback-loop-lint.sh`.

## result

Implemented locally.

Validation result: `harness/feedback-loop-lint.sh` passed with 0 failures and
0 warnings.

## residual risk

No full wiki link checker exists yet; validation remains targeted plus
feedback-loop lint.
