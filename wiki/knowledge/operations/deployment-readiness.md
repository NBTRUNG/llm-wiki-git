---
name: deployment-readiness
description: Deployment readiness checks for release, test-server rollout, environment config, smoke tests, and handoff evidence.
date_ingested: 2026-06-27
status: active
source_type: project-file-back
confidence: medium
confidence_reviewed: 2026-07-01
---

# deployment readiness

## purpose

Use this guide when a task prepares, changes, or validates deployment,
test-server rollout, CI/CD, runtime config, build output, or release handoff.

## checklist

- Identify target environment and source of deployment truth.
- Confirm runtime support status for the deployed stack. As of the 2026-07-01
  research run, official sources show:
  - Node.js production apps should use Active LTS or Maintenance LTS releases;
    Node 24 and 22 are LTS, Node 26 is Current, and Node 25 is EOL.
  - .NET 10 is LTS, .NET 9 is STS maintenance, and .NET 8 is LTS maintenance.
  - Kubernetes maintains patch branches for the most recent three minor
    releases; 1.36, 1.35, and 1.34 are the current maintained minors.
  - Python 3.14 and 3.13 are bugfix releases; 3.12, 3.11, and 3.10 are
    security-only; Python 3.9 is end-of-life.
- Confirm required config and secrets are documented without exposing values.
- Build/test the artifact with the repo's accepted command when possible.
- For build, publish, package, or smoke failures, use
  [[deployment-diagnostics.md]] before broad log reading or repeated command
  variants.
- Run route/API/service smoke checks relevant to the change.
- Confirm logs expose enough context without leaking secrets.
- Record rollback or recovery path.
- Update repo test matrix/status docs when the deployment state changes.

## anti-patterns

- Calling deployment complete because a build passed locally.
- Publishing config changes without readback or smoke proof.
- Logging secrets while troubleshooting.
- Printing full diagnostic logs into the conversation when a narrow clue search
  and small output window would be enough.
- Repeating runtime smoke or database backup verification when the later change
  did not affect runtime behavior or data state.
- Changing production posture without decision or rollback notes.
- Deploying on an EOL runtime or unsupported Kubernetes minor without an
  explicit risk acceptance and upgrade plan.

## related

- Observability: [[observability.md]]
- Rollback: [[rollback.md]]
- Deployment diagnostics: [[deployment-diagnostics.md]]
- Output quality: [[../coding/output-quality.md]]
