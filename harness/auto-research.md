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

For AI-agent or "deep research" style work, also read
`wiki/knowledge/ai-agent-rag-mcp/autonomous-research-agents.md`. LLM-Wiki uses
bounded research autonomy: agents may search, compare, and draft candidate
updates, but canonical promotion still requires review, validation evidence,
and source-quality checks.

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

## search/tool bounds

Before searching, define the bounds for the run:

- scoped question and explicit exclusions;
- source family priority;
- search/tool budget when the tool supports it;
- allowed or blocked domains when the run should stay inside official,
  standards, vendor, or research sources;
- source log expectation.

Inline citations are not enough by themselves. When a research tool exposes all
consulted URLs, query records, source metadata, or search traces, record the
complete source set in the research brief or supporting notes, then cite only
the sources that actually support a finding. If the tool does not expose the
complete consulted-source list, say so in the brief.

## workflow

1. Open `research/watchlist.md`.
2. Select one topic, cadence reason, decision need, and exclusions.
3. Break the topic into subquestions when the research is broad.
4. Define search/tool bounds: source families, domain constraints, max searches
   or equivalent budget when available, and source-log expectations.
5. Search current internet sources using the source priority above.
6. For each high-impact or promotion-relevant claim, check source
   accessibility, relevance, support at the stated strength, freshness, and
   conflicts. Check substantive uncited claims too; citation count is not
   evidence quality.
7. Before expanding the search, name the unresolved decision/claim and what the
   next probe could change. Stop when scoped claims have adequate support,
   probes repeat evidence without changing the decision, no credible in-scope
   source path remains, a conflict must be surfaced, or the declared budget is
   reached. Do not use a universal tool-call cap.
8. Write a brief under `reports/research/YYYY-MM-DD-<topic>.md` from
   `templates/research_brief.template.md`.
9. Classify each finding:
   - `no-change`;
   - `watch`;
   - `candidate-update`;
   - `urgent-update`;
   - `project-specific-only`.
10. For candidate or urgent updates, name exact target docs and proposed edit.
11. Promote only after review:
   - update canonical knowledge/harness/templates;
   - create a validation report;
   - update indexes/wikilinks;
   - update `confidence_reviewed` where relevant.
12. If evidence is credible but not ready, queue it in
   `wiki/projects/llm-wiki/docs/feedback_loop_queue.md`.

## research run record

Every run must record:

```text
Topic:
Cadence reason:
Search/tool bounds:
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
- has claim-level evidence that distinguishes accessible links, relevant
  content, and support at the strength stated;
- has concrete impact on agent decisions or project outcomes;
- says when to apply and when not to apply;
- does not duplicate existing guidance;
- records why research stopped and any unresolved conflicts or unsupported
  claims;
- includes revision trigger if volatile;
- passes link/index/lint checks.

Canonical knowledge also needs enough operational evidence to evaluate:

- real-world applicability or reproducible validation evidence;
- performance and cost impact;
- security, privacy, reliability, and operational risks;
- implementation complexity, dependencies, migration effort, and maintenance
  burden;
- trade-offs against credible alternatives;
- verification, observability, rollback, and review triggers.

If these are missing, classify the material as `watch` or `candidate-update`
and keep it in a research brief, watchlist, or feedback-loop queue. Blog posts,
DEV articles, demos, social discussions, and vendor announcements are leads,
not policy.

## safety

- Do not run research merely because cadence is due; wait for human or task
  authorization.
- Do not browse broadly without a target decision.
- Do not treat autonomous/deep research output as canonical before source
  support, conflict, freshness, and promotion checks.
- Do not promote from memory; cite checked sources in the research brief.
- Do not treat citations as proof unless the cited source actually supports the
  claim.
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
