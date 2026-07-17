---
name: knowledge-effectiveness
description: Report rule for evaluating whether LLM-Wiki knowledge packs helped an agent task and what should be improved.
date_updated: 2026-06-30
status: active
---

# knowledge effectiveness

## purpose

Use this guide in agent result reports to evaluate whether LLM-Wiki knowledge
actually helped the work.

This is not a popularity score. It is a practical feedback loop:

- did the required pack prevent a mistake;
- did it speed up correct file selection or proof;
- did it conflict with active repo docs;
- was it missing, stale, too broad, or hard to apply;
- should reusable knowledge be improved after review.

## when required

Add a Knowledge Effectiveness section to every non-trivial result report when
any of these are true:

- Coding Pack was loaded;
- Security Baseline or Security Deep Pack was used;
- Web/UI, Data, Data Knowledge, Algorithms/Math, Architecture, Contracts, or
  Operations packs were used;
- the task used `docs/knowledge_lookup_metric.md`;
- the task outcome depends on a reusable LLM-Wiki rule, pattern, or quality
  gate.

For status-only or trivial copy edits, write `n/a` and explain why.

## report fields

Use these fields:

```text
## LLM-Wiki knowledge effectiveness

- Packs used:
- Most useful file(s):
- What changed because of the knowledge:
- Time/read benefit: high | medium | low | none | unknown
- Mistake avoided: yes | no | unknown
- Conflict with repo docs/code: none | summary
- Missing/stale/unclear knowledge: none | summary
- Improvement action: none | file-back now | queue follow-up | human decision needed
- Suggested LLM-Wiki target:
```

## scoring

Optional score when the task is large enough to justify it:

| Score | Meaning |
| --- | --- |
| 0 | Pack was unnecessary noise or actively misleading. |
| 1 | Minor value; most work came from repo docs/code. |
| 2 | Useful reminder or quality gate. |
| 3 | Materially improved correctness, safety, speed, or proof. |
| 4 | Prevented a likely bug/security/design failure. |
| 5 | Essential to finishing or accepting the work. |

Scores are evidence, not performance grading. A low score is useful when it
points to a pack that is stale, too broad, too hard to apply, or missing a real
project pattern.

## file-back rule

Do not update LLM-Wiki immediately from every report.

After review passes:

- file back reusable knowledge only when it applies beyond one repo/task;
- queue a follow-up when the knowledge gap needs research or human decision;
- leave repo-specific facts in the repo.

Use `post_task_distillation.md` for the final distillation gate.
