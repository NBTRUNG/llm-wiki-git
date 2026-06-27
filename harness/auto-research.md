# research-on-request loop

Use this workflow when the human owner explicitly asks an agent to check
internet/current sources for LLM-Wiki knowledge updates.

This is not a background daemon and not an autonomous agent obligation. During
the current governance model, research is human-controlled: agents may suggest
that research would be useful, but they do not run it unless the human asks or
a task packet explicitly assigns it.

## purpose

LLM-Wiki can improve from two inputs:

- project evidence through [[feedback-loop.md]];
- internet/current-source research through this on-request loop.

Research findings are advisory until promoted through review and validation.
Do not let an agent rewrite canonical knowledge directly from one article,
vendor announcement, benchmark, or news item.

## request triggers

Run research only when the human owner, Lead, or explicit task packet asks for
it. Good reasons to request a run include:

- a watchlist cadence is due in `research/watchlist.md`;
- a project orientation depends on volatile guidance;
- a task touches deployment/runtime/frontend/security/AI agents/testing/
  observability/cloud cost and the latest guidance may matter;
- a source announces a breaking change, deprecation, vulnerability, or standard
  update;
- a knowledge file has not been confidence-reviewed within its expected cadence.

Cadence is advisory. It tells the human what may be worth asking for; it does
not grant agents permission to browse or promote updates on their own.

## source priority

Prefer:

1. official standards/specifications;
2. official project/framework/cloud/security docs;
3. foundation reports and ecosystem surveys;
4. peer-reviewed or reproducible research;
5. vendor docs for vendor-specific decisions;
6. practitioner essays only as trade-off input;
7. news/social posts only as leads.

For technical topics, use primary sources wherever possible.

## workflow

1. Open `research/watchlist.md`.
2. Select one topic and cadence reason.
3. Search current internet sources using the source priority above.
4. Write a brief under `reports/research/YYYY-MM-DD-<topic>.md` from
   `templates/research_brief.template.md`.
5. Classify each finding:
   - `no-change`;
   - `watch`;
   - `candidate-update`;
   - `urgent-update`;
   - `project-specific-only`.
6. For candidate or urgent updates, name exact target docs and proposed edit.
7. Promote only after review:
   - update canonical knowledge/harness/templates;
   - create a validation report;
   - update indexes/wikilinks;
   - update `confidence_reviewed` where relevant.
8. If evidence is credible but not ready, queue it in
   `wiki/projects/llm-wiki/docs/feedback_loop_queue.md`.

## research run record

Every run must record:

```text
Topic:
Cadence reason:
Sources checked:
Findings:
Classification:
Promotion decision:
Target docs:
Validation:
Next review trigger:
```

## promotion gates

Promote only when the finding:

- has credible sources;
- has concrete impact on agent decisions or project outcomes;
- says when to apply and when not to apply;
- does not duplicate existing guidance;
- includes revision trigger if volatile;
- passes link/index/lint checks.

## safety

- Do not run research merely because cadence is due; wait for human or task
  authorization.
- Do not browse broadly without a target decision.
- Do not promote from memory; cite checked sources in the research brief.
- Do not copy long copyrighted content.
- Do not let vendor marketing become policy without trade-offs.
- Do not override active repo source of truth.
- Do not change security/high-stakes guidance without strong sources and
  validation evidence.

## relationship to LLM-Wiki

- Watchlist: [[../research/watchlist.md]]
- Research brief template: [[../templates/research_brief.template.md]]
- Research reports: `reports/research/`
- Promotion evidence: `reports/validation/`
- Backward project evidence loop: [[feedback-loop.md]]
