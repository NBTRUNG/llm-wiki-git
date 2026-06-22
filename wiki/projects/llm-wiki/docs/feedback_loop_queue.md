# feedback-loop queue

Last updated: 2026-05-25

## purpose

This queue tracks credible backward-pass candidates that are not ready to file
into canonical LLM-Wiki knowledge, harness, or constitution files.

It is not a knowledge file. It is a review queue for deferred evidence-gated
items. The filing rules remain in `harness/feedback-loop.md`.

## rules

- Add a row when a feedback-loop candidate is deferred instead of filed.
- Keep project-specific execution detail in the source project report.
- Close a row only by filing, rejecting with a reason, or converting it to a
  known gap.
- Review this file during each feedback-loop session before rotating
  `wiki/index.md#known-gaps`.

## open candidates

| ID | Candidate | Proposed class | Evidence | Missing gate / reason deferred | Next review trigger | Disposition |
|---|---|---|---|---|---|---|
| FLQ-001 | Razor `<partial>` tag-helper silent failure: build/test did not catch unregistered tag helpers; browser smoke found it. | `lesson` candidate | `/home/admindebian/UniversityWeb/reports/agent/antigravity/UW-P3-002-master-layout-result.md`; `wiki/projects/llm-wiki/docs/efficacy_dashboard.md` cycle 2 | Generalization gate not met; only one ASP.NET Core MVC/Razor project has produced the observation. | A second ASP.NET Core MVC/Razor project using LLM-Wiki confirms or contradicts the same failure mode. | deferred |
| FLQ-002 | LWOE cycle 3 instrumentation: 1b and 2c still need per-task source fields; 5a/5c need broader result-report rollout. | `harness improvement` / measurement follow-up | `wiki/projects/llm-wiki/docs/efficacy_dashboard.md` cycle 2 next measurement; `reports/validation/2026-05-23-backward-pass-housekeeping.md` next actions | Needs live post-cutoff session data, not another retrospective estimate. | First UniversityWeb post-cutoff Lead session on a calendar day after 2026-05-23 with at least 3 fresh tasks, or the next project adopting LWOE measurement. | in progress: result-report and LWOE templates instrumented 2026-05-25 |
| FLQ-003 | Token Economy bootstrap first independent application: pattern is validated on UniversityWeb but not yet proven by a second project. | `confidence review` / validation follow-up | `reports/validation/2026-05-23-token-economy-bootstrap-file-back.md`; `wiki/knowledge/project-docs/token-economy-bootstrap.md` | Confidence is high from source-project evidence, but independent-project application is still deferred. | Any non-UniversityWeb project applies `agents.template.md`, `lead_state.template.md`, and the L1-L6 bootstrap pattern. | waiting |

## closed candidates

| ID | Candidate | Closed as | Evidence |
|---|---|---|---|
| FLQ-000 | Initial queue creation and operational feedback-loop support. | filed as harness/project-doc support | `reports/validation/2026-05-25-feedback-loop-operational-optimization.md` |
