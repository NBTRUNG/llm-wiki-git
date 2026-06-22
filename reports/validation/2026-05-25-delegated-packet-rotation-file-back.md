---
title: delegated-packet-rotation knowledge doc — file-back from UniversityWeb
date: 2026-05-25
author: Lead (Claude, replacing Codex on UniversityWeb)
source_project: UniversityWeb
target_project: LLM-Wiki
status: applied
---

# 2026-05-25 — file-back: delegated-packet-rotation pattern

## Summary

New knowledge doc filed at `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/delegated-packet-rotation.md`. Documents the pattern of rotating completed/accepted delegation packets out of `agents/<agent>/tasks.md` into a sibling `agents/<agent>/tasks_archive.md` so delegated bootstrap cost stays bounded as the project ships more packets.

This is the second knowledge-doc file-back in the same family as `token-economy-bootstrap.md`: the first bounds session-start *reads*, this one bounds file *growth* over time.

## What the pattern does

- `agents/<agent>/tasks.md` keeps only the header (read-first list, tables, rules) + currently-assigned packet + a one-row-per-archived-packet pointer table.
- `agents/<agent>/tasks_archive.md` holds full text of every accepted packet, appended chronologically.
- Bootstrap reads include `tasks.md` only. The archive is explicitly excluded.
- Rotation happens at lead acceptance: cut the accepted packet's body, paste into the archive, add a pointer row, update both Index tables.

## Triggering observation

UniversityWeb's `agents/deepseek/tasks.md` reached 1410 lines after 4 accepted packets + 1 active packet. ~59% historical. The cost of delegated bootstrap scaled with `O(packets_ever_shipped)`. User asked whether this was a problem; lead confirmed numerically; rotation pattern was designed, applied, and dogfooded on the same day's UW-P3-005 acceptance.

## What was added to LLM-Wiki

| Artifact | Path |
|---|---|
| Knowledge doc (new) | `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/delegated-packet-rotation.md` |
| README entry (new row) | `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/README.md` |
| Cross-link from token-economy-bootstrap | `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/token-economy-bootstrap.md` (relationship-to-LLM-Wiki section) |
| Cross-link from multi-agent-coordination | `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/multi-agent-coordination.md` (relationship-to-LLM-Wiki section + inline reference) |
| Template (already existed) | `/home/admindebian/LLM-Wiki/templates/agent_tasks_archive.template.md` |

## Doc structure (mirrors `token-economy-bootstrap.md`)

The new doc follows the established LLM-Wiki knowledge-doc shape:

- YAML frontmatter: `name`, `description`, `source_type: file-back`, `source_project: UniversityWeb`, `source_evidence` list, `date_ingested`, `confidence: high`, `applicable_contexts`, `status: active`.
- Sections: the problem (with numeric table) → the pattern (5 sub-components) → who does what → measurement → acceptance criteria → anti-patterns → relationship to LLM-Wiki → sources → measured results.

## Evidence cited in the doc

All evidence paths in `source_evidence` point to UniversityWeb artifacts created during the rotation:

- `agents/deepseek/tasks.md` (post-rotation, 72 lines)
- `agents/deepseek/tasks_archive.md` (5 archived packets, 1389 lines)
- `agents/deepseek/status.md` (bootstrap shortcut updated)
- `reports/validation/2026-05-24-deepseek-tasks-rotation.md` — typo in original draft; the UW-side validation report's filename is `reports/validation/2026-05-25-deepseek-tasks-rotation.md`. The doc references the correct path; this file-back validation report aligns.

## Acceptance criteria for the pattern

Per the knowledge doc's "acceptance criteria" section, the pattern is correctly applied when:

1. `agents/<agent>/tasks.md` contains only header + currently-assigned packet + pointer table.
2. `agents/<agent>/tasks_archive.md` exists with an Index + full text of every accepted packet, oldest first.
3. New archives start from `templates/agent_tasks_archive.template.md` (or an equivalent skeleton).
4. The bootstrap shortcut in `agents/<agent>/status.md` explicitly tells the agent not to read the archive.
5. Delegated bootstrap line count is independent of how many packets the agent has previously completed.
6. Rotation happens in the same lead turn as `docs/tasks.md` / `docs/test_matrix.md` / `docs/agent_status.md` / Lead state file updates.

All 6 hold on UniversityWeb post-2026-05-25.

## Relationship to existing knowledge docs

- Extends `token-economy-bootstrap.md` along a different axis (file growth vs read set).
- Compatible with `multi-agent-coordination.md`'s 3-tier task board — only tier-2 (delegated packets) gets the rotation; tier-1 (`agents/agent_status.md`) and tier-3 (`agents/<agent>/status.md`) are append-light by their own conventions.
- Does NOT change `agent_local_work.md`'s read-order rules — `tasks.md` is still the 4th read in bootstrap; the archive is just a sibling file the bootstrap doesn't open.
- `harness/task-packet.md` packet shape unchanged.

## Risks / follow-ups for adopting projects

- **Pattern variant**: per-task file (`agents/<agent>/tasks/UW-P3-005.md`) is flagged as anti-pattern in the doc — bigger structural change for the same bound.
- **Project-wide variant**: UW also applied the same archive-not-compress pattern to `docs/tasks.md` ↔ `docs/tasks_archive.md`. This is a natural extension but not part of this knowledge doc's scope (which focuses on `agents/<agent>/tasks.md`). A future LLM-Wiki update could document the project-wide variant as a separate section or a sibling doc.
- **Lead-only operation**: the rotation step belongs in the lead's acceptance-turn rollup checklist. Delegated agents must never touch the archive. The knowledge doc's "who does what" section makes this explicit.

## Measured results (UniversityWeb 2026-05-25)

Per the knowledge doc's "measured results" section:

| Bootstrap component | Pre-pattern | Post-pattern | Δ |
|---|---|---|---|
| `agents/deepseek/tasks.md` | 1410 lines | 72 lines (idle) / ~300-600 lines (active packet drafted) | **−95% idle / −60% steady-state** |
| Delegated bootstrap total | ~1900 lines | ~480 lines | **−75%** |

Pattern works. Numbers should be re-measured per applying project.

## Sign-off

Filed back by Lead (Claude) on 2026-05-25 from UniversityWeb to LLM-Wiki. Cross-links to existing knowledge docs in place. README index updated. UW-side validation: `/home/admindebian/UniversityWeb/reports/validation/2026-05-25-deepseek-tasks-rotation.md`.
