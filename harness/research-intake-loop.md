# research intake loop

Use this workflow to keep LLM-Wiki guidance current without letting trend
research rewrite canonical rules automatically.

## purpose

Technology, deployment models, security practices, AI-agent patterns, and
project-orientation methods change continuously. LLM-Wiki needs a regular
research loop, but canonical docs must still change only after review.

## rule

Research output is advisory until promoted into `wiki/knowledge/`,
`harness/`, or `templates/` through a validation report.

Do not let an agent auto-edit canonical guidance directly from one source,
vendor post, benchmark, or news item.

## cadence

| Cadence | Topics |
| --- | --- |
| Weekly | security advisories, AI-agent/tooling changes, breaking framework/runtime changes |
| Monthly | deployment models, frontend/rendering, CMS/headless, testing, observability, platform engineering |
| Quarterly | project orientation taxonomy, architecture approach selection, coding workflow, output quality gates |
| Ad hoc | before a new project, before choosing a major stack/deployment model, after a failed project workflow |

## source priority

Prefer sources in this order:

1. Official standards/specifications and project docs.
2. Foundation reports and ecosystem surveys.
3. Major cloud/vendor docs when the topic is vendor-specific.
4. Peer-reviewed or serious industry research.
5. Practitioner essays only when they explain trade-offs and match observed
   project evidence.
6. News/social posts only as leads, not as canonical evidence.

## workflow

1. Open `research/watchlist.md`.
2. Pick the topic and cadence reason.
3. Search current sources if the topic is time-sensitive.
4. Write a research brief under `reports/research/YYYY-MM-topic.md` using
   `templates/research_brief.template.md`.
5. Classify each finding:
   - `no-change`;
   - `watch`;
   - `candidate-update`;
   - `urgent-update`;
   - `project-specific-only`.
6. For `candidate-update` or `urgent-update`, identify the exact target docs.
7. Apply canonical changes only after review.
8. Create a validation report under `reports/validation/`.
9. Update `active.md` if the change affects LLM-Wiki current rules.

## promotion criteria

Promote a finding into canonical docs only when:

- it has at least one credible source and a concrete project impact;
- it says when to use and when not to use the pattern;
- it does not contradict active repo source-of-truth docs;
- it improves decision quality, safety, performance, operability, or agent
  execution reliability;
- it includes a rollback/revision trigger if the guidance may age quickly.

## project bootstrap hook

Before project orientation is accepted, check whether the project depends on
time-sensitive guidance:

- deployment/runtime/platform choice;
- frontend rendering or UI framework choice;
- CMS/headless/content architecture;
- security/privacy/auth/payment/upload;
- AI/agent/RAG/evaluation;
- observability/testing/toolchain;
- cloud cost/operability.

If yes, create or read the latest relevant research brief before finalizing
`docs/project_orientation.md`.

## anti-patterns

- Treating old model memory as current research.
- Copying vendor claims into canonical rules without trade-offs.
- Updating canonical rules without validation evidence.
- Researching broadly without a target decision.
- Keeping research only in chat.
