---
name: deployment-readiness
description: Deployment readiness checks for release, test-server rollout, environment config, smoke tests, and handoff evidence.
date_ingested: 2026-06-27
status: active
source_type: project-file-back
confidence: medium
confidence_reviewed: 2026-06-27
---

# deployment readiness

## purpose

Use this guide when a task prepares, changes, or validates deployment,
test-server rollout, CI/CD, runtime config, build output, or release handoff.

## checklist

- Identify target environment and source of deployment truth.
- Confirm required config and secrets are documented without exposing values.
- Build/test the artifact with the repo's accepted command when possible.
- Run route/API/service smoke checks relevant to the change.
- Confirm logs expose enough context without leaking secrets.
- Record rollback or recovery path.
- Update repo test matrix/status docs when the deployment state changes.

## anti-patterns

- Calling deployment complete because a build passed locally.
- Publishing config changes without readback or smoke proof.
- Logging secrets while troubleshooting.
- Changing production posture without decision or rollback notes.

## related

- Observability: [[observability.md]]
- Rollback: [[rollback.md]]
- Output quality: [[../coding/output-quality.md]]
