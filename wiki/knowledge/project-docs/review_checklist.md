---
name: review-checklist
description: Quick-scan and deep-review checklist before accepting implementation or merging work. Use before reviewing agent output or PRs.
date_ingested: 2026-05-23
status: active
---

# review checklist guide

## purpose

Use this guide before accepting implementation from an agent or before merging work in a real repo.

For procedural usage (when to review, how to record results), see `harness/validation-report.md`.
For delivery-quality gates beyond code style, apply
`../coding/output-quality.md` beside this checklist.

## quick scan (before deep review)

Run these checks first. If any fail, request changes immediately.

```
SCOPE
[ ] Changed files match the task's allowed write targets
[ ] No forbidden targets were edited
[ ] No unrelated refactors, formatting churn, or scope creep

CONTRACTS
[ ] No new shared name, route, alias, role, or permission added without approval
[ ] No new dependency, service, or external call added without approval

EVIDENCE
[ ] Validation evidence exists (commands run, tests passed, manual checks done)
[ ] Or: missing proof is explicitly documented with a reason

HYBRID CONTROL
[ ] Human sponsor/acceptance owner and agent responsibility are clear
[ ] Capability, autonomy, permission, action risk, and reversibility fit the task
[ ] Required human approval occurred at the consequential action boundary
[ ] Reviewer inspected outcome/evidence rather than rubber-stamping agent prose
[ ] Agent completed routine bounded verification rather than outsourcing it to review
```

If all quick scan items pass, proceed to detailed review.

---

## detailed review

### contract compliance

- [ ] Paths, schemas, aliases, roles, permissions, components, and shared helpers match `docs/contracts.md`
- [ ] Endpoint or interface signatures match the task's contract references
- [ ] Error response format matches the project convention

### scope

- [ ] Only the requested behavior was implemented
- [ ] No unapproved feature, architecture change, or framework addition
- [ ] No removal or weakening of existing behavior without approval

### security

- [ ] Inputs are validated at every entry point
- [ ] Authentication and authorization are enforced where required
- [ ] No secrets, tokens, keys, or passwords in code or logs
- [ ] Sensitive data is not logged, returned unnecessarily, or exposed

### human-agent hybrid control

- [ ] Human intent, risk boundary, permission, and acceptance are explicit
- [ ] Agent stayed within its claim/write/tool grant and disclosed uncertainty
- [ ] Interrupt/rollback controls are labeled verified, manual, unverified, or unavailable
- [ ] No self-upgrade, privilege expansion, unapproved delegation, or audit tampering
- [ ] Human and agent dependence was balanced; neither side abdicated its responsibility

### test quality

- [ ] Tests prove the required behavior, not just exercise code
- [ ] Error paths and important boundaries are covered
- [ ] Tests are independent (no order dependency)
- [ ] Test names describe scenario and expected result
- [ ] No trivial assertions (`assert True`, `assert response is not None`)

### code quality

- [ ] Change is small, readable, and follows local repo patterns
- [ ] No debug prints, commented-out code, or dead code
- [ ] Functions are small enough to review in one pass
- [ ] No magic numbers or hardcoded strings

### docs and status

- [ ] `docs/tasks.md` updated (status, owner, evidence)
- [ ] `docs/test_matrix.md` updated if behavior changed
- [ ] `docs/project_status.md` updated if project state changed
- [ ] `docs/contracts.md` or `docs/decisions.md` updated if shared names or decisions changed
- [ ] Agent report created and linked

---

## result format

### accepted

```md
[ACCEPTED] <task-id> - <title>
Reviewer:
Date:

Quick scan: passed
Evidence:
Notes (if any):
```

### changes requested

```md
[CHANGES REQUESTED] <task-id> - <title>
Reviewer:
Date:

Required before acceptance:
1. [BLOCKER] <specific issue, file, line if applicable>
2. [BLOCKER] ...

Improvements (do not block merge, fix in this phase):
1. [MINOR] ...
2. [MINOR] ...
```

### blocked

```md
[BLOCKED] <task-id> - <title>
Reviewer:
Date:

Blocker: <what is blocking>
Decision needed: <specific question for user or main agent>
```

---

## acceptance criteria pattern

Use concrete, checkable criteria. Prefer Given/When/Then for behavior-driven tasks:

```text
Given <starting state>
When <action>
Then <observable result>
```

For docs, architecture, or workflow tasks, use checkable bullets:

- [ ] Required files exist at the specified paths
- [ ] Source-of-truth rule is explicit
- [ ] Links and indexes are updated
- [ ] Validation evidence is recorded

---

## anti-patterns

- Approving without running the quick scan checks.
- Accepting "it compiles" or "tests pass" without checking what the tests prove.
- Letting MINOR items accumulate across phases without fixing them.
- Reviewing only the diff without reading the task's acceptance criteria.
