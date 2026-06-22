# Hermes read-planning workflow

Use this workflow only for projects that explicitly enable Hermes.

Hermes is a read-only context indexer and read planner. It helps agents decide
which source slices to read, but it does not change source-of-truth rules.

Canonical guide: [[../wiki/knowledge/project-docs/hermes_context_indexer.md]].
Templates:

- [[../templates/hermes_config.template.md]]
- [[../templates/hermes_read_plan.template.md]]

## when to use

Use Hermes read planning when a project has enabled Hermes and at least one is
true:

- agent bootstrap reads are repeatedly too large;
- project has several active agents;
- project uses Human-orchestrated mode with shared-file write delegation;
- agent control cards or legacy task/status files remain hard to navigate;
- cross-file lookup is frequent;
- agents have previously read stale or wrong context;
- Knowledge Lookup Metric often reaches the consult range.

Do not use Hermes as a default requirement for every project. First apply the
existing Markdown-first patterns: one current-slice `agents/<agent>/AGENT.md`
control card per delegated agent, repo-level task indexes, and accepted-packet
archives.

## authority rule

Hermes output is advisory.

```text
Current user / Lead assignment
  > active repo docs and code
  > LLM-Wiki reusable knowledge when consulted by rule
  > Hermes derived index/cache/read plan
```

If Hermes conflicts with a source file, the source file wins. Mark Hermes stale
and re-index before trusting a later plan.

## workflow

1. Confirm the project has enabled Hermes and has a local Hermes config or
   project doc.
2. Identify request type and source of truth using [[read-workflow.md]].
3. Ask Hermes for a read plan only after the source-of-truth class is known.
4. Require the plan to include source files, anchors or line ranges, cache
   freshness, conflict risks, and shared-file section-lock risks when relevant.
5. Read the source slices Hermes recommends.
6. If the slice does not match the task or cache evidence is stale, ignore the
   plan and read the source file directly.
7. Record Hermes use in the task result report when it affected read scope,
   Knowledge Lookup Metric scoring, or source-of-truth risk.

## acceptable outputs

Hermes may output:

- read plan;
- source-of-truth risk note;
- stale-cache warning;
- line-range references;
- Knowledge Lookup Metric draft score;
- list of files not to read.
- shared-file delegation overlap warning.

Hermes must not output:

- code changes;
- rule changes;
- accepted task state;
- project status rollup;
- contract edits;
- final source-of-truth decisions.
- write permission, lock transfer, or acceptance decisions.
- draft content that later becomes the merge source.

When several agents propose changes for the same section, Hermes may point to
their Markdown proposal/report paths and warn about overlap. The integration
owner uses source Markdown files, agent handoffs/reports, and optional
`reports/integration/<task-id>-merge-plan.md` as the merge source.

## result report note

When Hermes materially shaped a task, include:

```md
## Hermes read planning

Used: yes | no
Cache status:
Read plan:
Source slices used:
Stale/conflict findings:
Decision:
```

This section is separate from `Knowledge lookup`. Hermes may help score or
locate sources, but LLM-Wiki lookup remains governed by the Knowledge Lookup
Metric.

## LLM-Wiki adoption gate

LLM-Wiki should not depend on Hermes until at least two real projects have
piloted Hermes and produced measurement evidence. Until then, LLM-Wiki is the
framework for configuring Hermes correctly in projects.
