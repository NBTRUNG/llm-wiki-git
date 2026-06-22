---
name: delegated-packet-rotation
description: Legacy split-file pattern for keeping agents/<agent>/tasks.md bounded as completed packets accumulate. Rotate accepted packets out of the live file into agents/<agent>/tasks_archive.md after each acceptance. New or updated projects should prefer one agents/<agent>/AGENT.md control card.
source_type: file-back
source_project: UniversityWeb
source_evidence:
  - /home/admindebian/UniversityWeb/agents/deepseek/tasks.md (post-rotation, ~587 lines)
  - /home/admindebian/UniversityWeb/agents/deepseek/tasks_archive.md (4 archived packets, 871 lines)
  - /home/admindebian/UniversityWeb/agents/deepseek/status.md (bootstrap shortcut updated to skip archive)
  - /home/admindebian/UniversityWeb/reports/validation/2026-05-24-deepseek-tasks-rotation.md
date_ingested: 2026-05-24
date_updated: 2026-05-25
confidence: high
confidence_reviewed: 2026-05-25
applicable_contexts:
  - multi-agent projects where delegated agents bootstrap from agents/<agent>/tasks.md
  - any project shipping ≥ 3 packets per agent per phase
  - any project where one agent has > 800 lines of accepted-packet history in their tasks file
status: legacy-compatible
---

# Delegated packet rotation pattern

## the problem

This is a compatibility pattern for projects that still use the older split-file
agent model:

```text
agents/<agent>/tasks.md
agents/<agent>/status.md
agents/<agent>/tasks_archive.md
```

New or updated projects should prefer the single-file control-card model in
[[agent_local_work.md]], where delegated agents read `agents/<agent>/AGENT.md`
as their only local file.

[[token-economy-bootstrap.md]] keeps the **session-start read set** small. For
delegated agents that means entry file + repo rules + role card + live task
file + live status file + Required Read Files; it does not include Lead state
by default. But the law does not by itself bound the **size of those files** as
a project runs.

`agents/<agent>/tasks.md` is the worst offender. The original convention appends every new packet to the bottom of the file. After a few accepted packets, ~60% of the file is historical packets that are no longer operationally needed — yet the delegated agent's bootstrap still reads every byte.

Numbers from UniversityWeb 2026-05-24 (before rotation):

| Section | Lines | Operational? |
|---|---|---|
| Header (read first, current assignment, tables, rules) | 60 | yes |
| UW-P3-DESIGN-SYSTEM-001 (completed, accepted) | 127 | no |
| UW-P3-003 (completed, accepted) | 216 | no |
| UW-P3-003B (completed, accepted) | 273 | no |
| UW-P3-004 (completed, accepted) | 219 | no |
| UW-P3-005 (currently assigned) | 514 | yes |
| **Total** | **1409** | **41% operational** |

Bootstrap cost scales with `O(packets_ever_shipped)`, not with `O(packets_currently_active)` (which is almost always 1).

## the pattern

### 1. Two files per agent, one operational

| File | Read at bootstrap? | Owner | Contents |
|---|---|---|---|
| `agents/<agent>/tasks.md` | YES | Lead | Header + tables + rules + currently-assigned packet + 1-row-per-archived-packet pointer table |
| `agents/<agent>/tasks_archive.md` | **NO** | Lead | Full text of completed and accepted packets, appended chronologically |

The archive file is **never** part of delegated-agent bootstrap. It exists for audit / lift-and-reuse only.

### 2. Rotate at lead acceptance

When the lead accepts a packet, in the same rollup turn that updates `docs/tasks.md` / `docs/test_matrix.md` / etc., the lead **moves** (not copies) the accepted packet's body from the live file to the archive:

1. Cut the entire `## <ID> — <Title>` section (heading + body + trailing separator) from `agents/<agent>/tasks.md`.
2. Paste at the bottom of `agents/<agent>/tasks_archive.md`.
3. Add a row to the live file's "Completed packets" pointer table: `| ID | outcome | archive § ID | validation report path |`.
4. Add a row to the archive file's "Index" table at the top.

The next assigned packet replaces the body — the live file stays at ~ header + 1 active packet.

### 3. Update the bootstrap shortcut

Whenever the lead writes a new packet, the bootstrap shortcut in `agents/<agent>/status.md` is updated to reference the **current state** of the file structure. After the rotation, the shortcut no longer needs the "jump to the bottom" trick — the active packet IS the file body. Add an explicit "do NOT read `tasks_archive.md`" line to prevent delegated agents from re-reading history.

### 4. Header anchor for the rotation rule

Add a brief rotation note in the live file's header section so future leads (possibly a different AI) understand the convention without reading this knowledge doc:

```markdown
## Completed packets (archived)

Full text of completed/accepted packets has been rotated into
`agents/<agent>/tasks_archive.md` to keep this file's bootstrap cost bounded.

Rotation rule: when a packet is accepted by the lead and a new packet replaces
it, the accepted packet's body is moved (not copied) from this file into
`tasks_archive.md`, and a row is added above. The archive file is not part of
any agent's bootstrap read.
```

The pointer table above this note carries the one-row summary per archived packet.

### 5. Never delete from the archive

The archive is append-only. If a packet was never accepted (e.g., took over by lead, blocked indefinitely, superseded), do NOT move it to the archive — leave a note in the live file's "Completed packets" section explaining why it's missing. Only **accepted** packets go to the archive.

## who does what

- **Lead** owns the rotation. Same turn as the rollup; one extra cut/paste.
- **Delegated agent** never writes to the archive. Bootstrap shortcut in `status.md` tells them to skip it explicitly.
- **Delegated agent** may include an archive-ready row proposal in the result report to reduce Lead copy work, but it is only a proposal until accepted.
- **Codex / outgoing lead** sets up the archive file the first time it is needed. New projects can include an empty `tasks_archive.md` skeleton from day one.

## archive authority rule

`tasks_archive.md` means accepted history. Therefore the authority to write to
it belongs to the Lead / review owner after acceptance.

Executing agents do not move their own packets into `tasks_archive.md`, even
when they believe the task is complete. They finish by updating
`agents/<agent>/status.md` and creating a result report. The result report may
include an `Archive row proposal` so the Lead can copy a prepared row after
acceptance.

Status meanings:

| State | Where packet body stays | Who acts |
|---|---|---|
| `assigned` / `in_progress` | live `tasks.md` | delegated agent works |
| `ready-for-review` / `completed` but not accepted | live `tasks.md` | Lead reviews |
| `accepted` | move to `tasks_archive.md` | Lead archives in rollup turn |
| `blocked` / `rejected` / `superseded` | live note or result report, not archive | Lead decides next packet |

## measurement

Track per agent file:

- **Live `tasks.md` line count** — target ≤ 600 lines after rotation. Investigate if it climbs past 800.
- **Bootstrap delta** — lines saved vs the pre-rotation state. UniversityWeb 2026-05-24: 1410 → 587 lines (−58%), with no operational data lost.
- **Archive growth rate** — informational only. The archive can grow unboundedly; only the live file's size matters for bootstrap cost.

## acceptance criteria

The pattern is correctly applied when:

- [ ] `agents/<agent>/tasks.md` contains the header + currently-assigned packet (1 packet, or zero if idle) + a pointer table to archived packets.
- [ ] `agents/<agent>/tasks_archive.md` exists with a top-level Index table + full text of every accepted packet, oldest first.
- [ ] New archives start from `templates/agent_tasks_archive.template.md` or an equivalent skeleton.
- [ ] The bootstrap shortcut in `agents/<agent>/status.md` explicitly tells the agent not to read the archive.
- [ ] Delegated bootstrap line count is independent of how many packets the agent has previously completed.
- [ ] Rotation happens in the same lead turn as `docs/tasks.md` / `docs/test_matrix.md` / `docs/agent_status.md` / Lead state file updates.

## anti-patterns

- **Appending packets forever to `tasks.md`** — original bootstrap cost grows linearly with project age. Solved by rotation.
- **Compressing accepted packets in-place** (replacing the body with a 1-line summary) — loses AC, anti-deviation tables, and forbidden-target lists that future packets often reuse. Solved by archive-not-compress.
- **Moving incomplete or blocked packets to the archive** — archive is for accepted history only. Incomplete work stays in the live file or in `reports/agent/<agent>/<id>-result.md` as a blocker artifact.
- **Delegated agent reads `tasks_archive.md` "to be thorough"** — defeats the bounding. Explicitly forbid in the bootstrap shortcut.
- **Separate file per packet** (`agents/<agent>/tasks/UW-P3-005.md`) — bigger structural change; requires updating `AGENTS.md`, `REPO_RULES.md`, `docs/session_start.md`. Premature optimization; the two-file rotation already gets the same bound.
- **Rotation done lazily, not at acceptance** — leaves a growing backlog of historical packets in the live file. Rotation must be part of the acceptance turn's rollup checklist.

## relationship to LLM-Wiki

- [[token-economy-bootstrap.md]]: same Token Economy Law; this pattern extends the law from session-start *reads* to file *growth* over time.
- [[multi-agent-coordination.md]]: the 3-tier task board (assignment rollup → delegated packet → checkpoint trace). This pattern only affects tier 2.
- [[agent_local_work.md]]: per-agent file structure; this pattern adds the optional `tasks_archive.md` companion.
- [[../../../harness/task-packet.md]]: packet shape is unchanged by the rotation; only file location changes after acceptance.
- [[session_start.md]]: Token Economy Law clause covers this.

## sources

- File-back from UniversityWeb 2026-05-24.
- Triggering observation: `agents/deepseek/tasks.md` reached 1410 lines after 4 accepted packets + 1 active packet (UW-P3-005). 59% historical.
- Applied artifacts (UniversityWeb):
  - `agents/deepseek/tasks.md` (post-rotation, 587 lines, header + UW-P3-005 + 4-row pointer table).
  - `agents/deepseek/tasks_archive.md` (new file, 871 lines, Index + UW-P3-DESIGN-SYSTEM-001 + UW-P3-003 + UW-P3-003B + UW-P3-004).
  - `agents/deepseek/status.md` (bootstrap shortcut updated; explicit "do NOT read tasks_archive.md").
- Validation: `/home/admindebian/UniversityWeb/reports/validation/2026-05-24-deepseek-tasks-rotation.md`.

## measured results (UniversityWeb 2026-05-24)

| File | Lines pre-rotation | Lines post-rotation | Δ |
|---|---|---|---|
| `agents/deepseek/tasks.md` | 1410 | 587 | **−58%** |
| `agents/deepseek/tasks_archive.md` | n/a | 871 | new file (not read at bootstrap) |
| **Delegated bootstrap total** (`AGENTS.md` + `REPO_RULES.md` + `AGENT.md` + `tasks.md` + `status.md`) | ~1900 | ~1070 | **−44%** |

After UW-P3-005 acceptance and replacement, the live file is projected to return to ~250 lines (header + tables + rules + completed-packets pointer table + new active packet header). Future packets keep the live file flat at ~ packet size + ~150 lines of header overhead.

Pattern works. Numbers should be re-measured per applying project.
