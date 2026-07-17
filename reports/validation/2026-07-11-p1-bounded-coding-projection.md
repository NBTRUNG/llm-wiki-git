# Validation - canonical P1 bounded coding projection

- Date: 2026-07-11
- Task: LLMWIKI-087
- Decision: `wiki/decisions/DEC-0006-p1-bounded-coding-projection.md`
- Workflow used: Architecture workflow -> approved decision -> LLM-Wiki change impact review
- Actual deviations: none

## outcome

Implemented one canonical cross-repo projection, `P1-BOUNDED-CODING`, for
capability-qualified `C2-C3` bounded coding work. It separates three concerns:

```text
shared coding floor -> repo coordinates -> exact task slice
```

Fast Path may reduce source and domain exploration but cannot replace the
coding floor. Repo maps, profiles, and capsules cannot be promoted into an
agent-authored Coding Pack projection.

## incident evidence

The UniversityWeb-U17 Homepage pilot showed the ambiguity concretely. Its
DeepSeek correction report called three selected Coding Pack files, including
two partial reads, a “full load”. The task output also retained a stale symbol.
This is evidence of a shared projection gap, not evidence that every repo needs
its own coding pack.

The U17 report remains owned by U17 and is not modified by LLMWIKI-087.

## canonical and projection changes

- Added `wiki/knowledge/coding/bounded-coding-core.md`.
- Clarified `agent_session_packs.md`, `agent_capability_tiers.md`,
  `agent-coding-workflow.md`, `repo-code-rules.md`, and Bounded Change Fast
  Path.
- Updated Real Repo Work, task packet, repo bootstrap/profile templates, and
  result-report semantics.
- Registered baseline/projection impact and accepted `DEC-0006`.
- Did not create a U17-specific or per-domain coding projection.

## validation

- Exact projection ID appears in canonical routing and task/result templates.
- Full P2 Coding Pack, complete P1 projection, and partial full-pack reads have
  distinct report fields.
- Bounded Change rule explicitly says repo maps cannot replace the coding floor.
- Repo profile template points to the shared core and remains local-coordinate
  only.
- Specialist pack and P2 escalation triggers remain intact.
- Project task/status/test/decision/projection/report indexes were updated.

## security and agent-risk impact

- Security impact: low, governance-only. No runtime, credentials, permissions,
  production data, dependency, or external service changed.
- Security Baseline remains mandatory inside the P1 core.
- Agent risk reduced: less self-authored context projection, false pack-load
  evidence, excessive source reading, and per-repo rule drift.
- Human review: the architecture decision was explicitly approved before edits.

## trade-off and revision trigger

- Baseline: full nine-file Coding Pack for all coding tasks.
- Benefit: lower fixed context cost and one deterministic P1 identity across
  repos while preserving mandatory constraints.
- Cost: maintainers must check the compact core when full-pack hard constraints
  change; it offers less explanatory depth.
- Revisit after 3-5 comparable bounded coding tasks, a projection-drift or
  false-eligibility incident, or a mandatory security/output/test rule change.
