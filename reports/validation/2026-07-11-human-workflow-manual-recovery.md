# Validation - Human workflow projection and manual recovery

- Date: 2026-07-11
- Task: LLMWIKI-082
- Decision: `wiki/decisions/DEC-0004-human-projection-and-manual-recovery.md`
- Workflow used: Session Start -> Manual Recovery design -> Session Closeout
- Canonical workflows: `workflows/session-start.workflow.md`,
  `workflows/manual-recovery.workflow.md`,
  `workflows/session-closeout.workflow.md`
- Actual deviations: none

## Outcome

Implemented a Vietnamese-first human projection for workflow discovery,
knowledge navigation, and manual operation. It links to canonical sources and
explicitly cannot authorize agent execution. Added an independent recovery
router and canonical Manual Recovery workflow with evidence preservation,
fail-closed mutation, safe read-only degradation, owner routing, approval, and
smoke-verification boundaries.

Agents now self-route without showing the whole catalog and disclose the
selected workflow, canonical file, and actual deviations at handoff/report.

## Impact and ROI

- Baseline: humans rely on memory or reconstruct workflow names from agent-first
  maps and conversation history.
- Benefit: fewer navigation failures and a survivable manual path when agents
  are unavailable.
- Cost: four short human projection files, one recovery router, one workflow,
  and linked governance rows.
- Drift control: `human/workflows.md` contains identity/purpose/link summaries,
  while canonical behavior stays in `workflows/` and `harness/`; the Change
  Impact Map and projection registry name the dependency.
- Revision trigger: a manual drill finds the router unusable, catalog and human
  map drift repeatedly, or maintenance cost exceeds the navigation benefit.

## Checks

- Active canonical workflow cards: 11.
- Human workflow identity/link rows: 11.
- One-to-one workflow mapping: passed by basename/link comparison.
- Recovery boundary review: passed; no destructive action, secret handling,
  off-host backup, Git recovery, or runtime emergency-stop capability is
  falsely claimed.
- Feedback-loop lint: passed with 0 failures and 0 warnings; 521 wikilinks and
  541 Markdown links checked.

## Residual risks

- No approved and verified off-host recovery copy is documented.
- This workspace's Git-based recovery path is not verified.
- Runtime emergency shutdown, safe mode, and fallback implementation require
  later system-specific decisions and drills.
- Passive rereading alone does not preserve operating skill; change-triggered
  refresh plus occasional manual drills are recommended.
