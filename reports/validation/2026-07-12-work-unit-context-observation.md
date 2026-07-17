# Validation - work-unit context observation 2026-07-12

- Pilot: LLMWIKI-084
- Source: user-supplied cumulative provider counters for the active session
- Snapshot point: A/C/D review intake, before the review/build/update work in
  that turn completed
- Accepted-outcome state at snapshot: mixed completed work and active review;
  exact per-work-unit token boundaries were not available

## provider counters

| field | value | pilot interpretation |
| --- | ---: | --- |
| input | 552,173 | provider-reported input; direct/uncached semantics not stated |
| output | 105,957 | provider-reported output |
| total | 658,130 | exactly equals supplied input plus output |
| reasoning | 28,575 | separate counter; inclusion in output not stated |
| cached | 21,554,432 | separate cached counter; not added to total or treated as direct input |

Arithmetic readback:

```text
552,173 + 105,957 = 658,130
```

No start snapshot was supplied, so work-unit deltas are `not available`. Do not
derive direct input by subtracting cached tokens.

## threshold observation

- `150k` warning: crossed.
- `300k` checkpoint: crossed.
- Hard cap: none; this remains a workflow pilot.
- Decision: finish the current atomic A/C/D review, write repo and LLM-Wiki
  checkpoints, then recommend a fresh session.
- Emergency-continuity exception: not needed; no active migration,
  transaction, incident, destructive operation, or live-system mutation.

## work and evidence near the snapshot

Known durable work in the active conversation includes:

- canonical `P1-BOUNDED-CODING` implementation and validation under
  LLMWIKI-087;
- UniversityWeb-U17 panel-index review work, with A/C/D still pending at the
  snapshot point.

The snapshot cannot be divided reliably among those work units. Exact count,
first-edit deltas, and per-unit token cost remain unknown rather than inferred.

## checkpoint after the atomic review

- Goal/current state: A/C/D reports reviewed; correction packets, pack pointers,
  TICK, test matrix, and U17 review evidence updated.
- Validation: correct .NET 10 Release build passed with 0 warnings and 0 errors.
- Pending action: DeepSeek claims and corrects A/C/D from their explicit
  `Review Correction Scope`; human/Codex re-reviews before `implemented`.
- Minimum next-session reads: U17 `AGENTS.md`; the three task rows/packets;
  `reports/validation/2026-07-12-u17-panel-index-acd-review.md`; corrected agent
  reports only after DeepSeek finishes.
- Risk/rollback: docs/comments only; no runtime or live-system mutation.

## pilot status

This is another naturally observed `300k` crossing, but the promotion gate is
still unmet because the required session/work-unit sample and accepted-outcome
comparisons are incomplete. The observation supports checkpoint usefulness;
it does not validate `150k/300k` as universal limits.
