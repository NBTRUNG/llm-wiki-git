---
type: Playbook
title: Open Knowledge Format and TICK for LLM-Wiki
description: Git-backed Markdown knowledge bundle and coordination conventions for humans and agents.
tags: [okf, tick, git-backed, markdown, coordination]
timestamp: 2026-06-30T00:00:00-07:00
status: active
source_urls:
  - https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md
  - https://skillsllm.com/skill/llm-wiki/
---

# Open Knowledge Format and TICK

Use this guide when creating or reviewing project knowledge meant for both
humans and agents.

## Position

LLM-Wiki follows a git-backed Markdown model:

- knowledge lives in files;
- source-of-truth files are human-readable;
- agents consume ordinary Markdown and YAML frontmatter;
- indexes provide progressive disclosure;
- evidence and citations stay linked;
- no derived cache or database is required for correctness.

Hermes has been retired from active workflow. Its reports remain historical
evidence, but active read planning now uses `TICK.md`, `index.md`, task packets,
session packs, maps, and source files.

## OKF Alignment

The OKF draft defines a knowledge bundle as a directory tree of Markdown files
with YAML frontmatter. Required conformance is intentionally small: each
non-reserved Markdown concept should have parseable frontmatter and a non-empty
`type` field. `index.md` supports progressive disclosure, `log.md` can hold
chronological history, and citations should back external claims.

LLM-Wiki already matches the spirit:

- Markdown bundle with links and indexes.
- Validation reports and evidence links.
- Producer/consumer independence: humans can edit; agents can parse.
- Git-friendly file layout.

LLM-Wiki does not yet require OKF conformance for every existing file. Treat OKF
as a forward standard: new durable knowledge/concept files should include
frontmatter with at least `type`, `title`, `description`, `tags`, `timestamp`,
and `status`.

## TICK

`TICK.md` is the current coordination entrypoint:

| Section | Purpose |
| --- | --- |
| Task | Current work or phase. |
| Intent | Why the work exists and what outcome matters. |
| Context | Source of truth, constraints, risk, and boundaries. |
| Knowledge | Minimal read order and conditional knowledge packs. |
| Claims | Who owns active work, scope, timestamp, and release rule. |

`TICK.md` does not replace detailed task packets. It prevents agents from
starting with stale assumptions and gives humans one short place to see active
coordination state.

## Claim / Release

Every multi-agent task board should support explicit claims.

Required fields:

```text
Claim status: unclaimed | claimed | released | blocked | stale
Claimed by:
Claim scope:
Claimed at:
Release reason:
Next eligible owner:
```

Rules:

- Claim before implementation, not after the first edit.
- Do not work on a task claimed by another active session.
- Release when done, blocked, paused, reassigned, or stale.
- Keep claim scope narrow: task id, file/section, workflow slice, or row.
- Shared-file claims must name file and section/rows.
- A human, Lead, or integration owner resolves stale or conflicting claims.

## Recommended Bundle Shape

```text
TICK.md
AGENTS.md
REPO_RULES.md
docs/
  project_index.md
  tasks.md
  agent_status.md
  project_status.md
  test_matrix.md
wiki/
reports/
```

Use `index.md` or `project_index.md` for progressive disclosure. Use `log.md`
only when a directory needs chronological history separate from validation
reports.

## Citation Rule

External or volatile claims need citations. Internal workflow claims should link
to validation reports, decisions, or task reports. Do not promote conversation
notes into durable knowledge without an evidence path.

## Knowledge Promotion Gate

Durable LLM-Wiki knowledge must be operationally usable, not merely plausible.

Before promoting a note, article, demo, vendor post, or discussion into
canonical `wiki/knowledge/`, require enough evidence to judge:

- context of use and explicit non-use cases;
- practical experience or validation evidence from a real project, benchmark,
  incident, reproducible test, or reviewed implementation;
- performance impact such as latency, throughput, cost, resource profile, and
  scaling limits where relevant;
- security, privacy, reliability, data-loss, lock-in, and operational failure
  modes;
- implementation complexity, dependencies, migration cost, required team skill,
  and maintenance burden;
- trade-offs against at least one credible alternative;
- verification plan, observability signals, rollback criteria, and review
  trigger.

If these are not known, keep the material as research, draft, watchlist, or
feedback-loop input. Practitioner essays, DEV posts, demos, social threads, and
vendor announcements can seed questions or candidate updates, but they are not
canonical knowledge until validated and reviewed.

## Anti-patterns

- Replacing Markdown source-of-truth with a cache, index, or database.
- Letting `TICK.md` become a long task board.
- Starting work from a task row without claiming it.
- Claiming broad files when a section/row claim is enough.
- Treating OKF frontmatter as a rigid taxonomy; unknown types must be tolerated.
- Filing every session note into knowledge without review.
- Promoting plausible blog/demo content as policy without performance, risk,
  complexity, and validation evidence.

# Citations

[1] [Open Knowledge Format draft spec](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md)
[2] [SkillsLLM llm-wiki listing](https://skillsllm.com/skill/llm-wiki/)
