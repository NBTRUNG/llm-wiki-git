# Validation report: distillation, closeout, research-on-request

Date: 2026-06-27

## scope

Implemented `LLMWIKI-037`:

- post-task distillation gate after review and before Done;
- project closeout distillation for transferring reusable knowledge without
  mirroring project state;
- human-controlled research-on-request protocol for internet/current-source
  research.

## changes checked

- Added `wiki/knowledge/project-docs/post_task_distillation.md`.
- Added `wiki/knowledge/project-docs/project_closeout_distillation.md`.
- Added `harness/auto-research.md`, now explicitly human-controlled and
  on-request.
- Added `reports/research/README.md`.
- Updated `research/watchlist.md` so cadence is advisory and does not authorize
  autonomous browsing.
- Updated `templates/research_brief.template.md` with next-review fields.
- Updated `wiki/knowledge/project-docs/agent_local_work.md` with post-task
  distillation gate.
- Updated `templates/agent_result_report.template.md` with distillation fields.
- Updated `templates/agents.template.md` and `templates/repo_rules.template.md`
  with distillation requirements.
- Updated root/knowledge/harness/compiled indexes.
- Updated LLM-Wiki task/status/test/evidence rollups.

## validation

| Layer | Check | Result |
| --- | --- | --- |
| Unit | New distillation, closeout, research-on-request, and research report files exist. | pass |
| Integration | Root index, compiled wiki index, knowledge README, project-docs README, harness README, templates, and watchlist reference the new model. | pass |
| E2E | Agent can follow: review passed -> distillation gate -> file/queue/skip -> archive/done; human asks research -> brief -> review -> optional promotion. | pass |
| Platform | Local filesystem paths exist. | pass |
| Release | GitHub sync not requested. | n/a |
| Manual review | User explicitly chose human-controlled research instead of autonomous research. | pass |

## lint

`bash harness/feedback-loop-lint.sh`

Result: pass, 0 failures, 0 warnings.

## notes

Research-on-request intentionally does not run internet research automatically.
Watchlist cadence is retained as a planning signal for the human owner.
