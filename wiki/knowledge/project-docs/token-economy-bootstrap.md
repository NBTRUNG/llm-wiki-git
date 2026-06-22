---
name: token-economy-bootstrap
description: Pattern for keeping multi-agent project bootstrap reads minimal and AI-agnostic. Hoist L1 cheatsheet into entry file (AGENTS.md), declare Token Economy Law, separate role-definitions from current-assignment, document Lead handoff. Achieves ≤330 lines bootstrap regardless of AI persistent-memory capability.
source_type: file-back
source_project: UniversityWeb
source_evidence:
  - /home/admindebian/UniversityWeb/AGENTS.md (Bootstrap cheatsheets section)
  - /home/admindebian/UniversityWeb/REPO_RULES.md (Token Economy bullet)
  - /home/admindebian/UniversityWeb/AI_CODEX.md (AI-agnostic note)
  - /home/admindebian/UniversityWeb/docs/session_start.md (Step 0 split + Lead handoff procedure)
  - /home/admindebian/UniversityWeb/docs/decisions.md (ADR-0023)
  - /home/admindebian/UniversityWeb/reports/validation/2026-05-23-bootstrap-token-audit.md
  - /home/admindebian/LLM-Wiki/reports/validation/2026-05-25-feedback-loop-operational-optimization.md
date_ingested: 2026-05-23
date_updated: 2026-06-22
confidence: high
confidence_reviewed: 2026-05-25
applicable_contexts:
  - any multi-agent project repo with a Lead role
  - projects where AIs have varying persistent-memory capability (some have it, some don't)
  - projects where the Lead role rotates between AIs over time
  - projects with ≥3 daily bootstrap events where token cost compounds
status: active
---

# Token Economy Bootstrap Pattern

## the law

> Default to minimal reads at session start. Each file read must trace to a current intent. Never re-read full project state at bootstrap.

This is the Token Economy Law. It applies to **every AI** in the project - Lead
and Delegated alike. It is enforced by the project's entry file (e.g.,
`AGENTS.md`), not by individual AI memory.

The law limits project-state reads and broad knowledge lookup. It does not
replace the coding-session safety baseline: when an agent is assigned to write,
review, refactor, test, validate, or accept repo code, the agent loads the full
Coding Pack from [[../coding/agent-coding-workflow.md]] once at
session/assignment start. That pack is bounded and does not authorize reading
full repo history or unrelated LLM-Wiki docs.

## why the law needs a pattern, not just a principle

Without an explicit pattern, projects converge on one of two failure modes:

1. **The "internalize once" trap** — the entry file says *"first-time agents read the procedure once and internalize"*. This works for AIs with persistent memory (e.g., Claude's `~/.claude/projects/<repo>/memory/`). It fails for AIs without persistent memory (Codex CLI, Antigravity, DeepSeek, Gemini in some configurations) — they re-read the full procedure every session, paying the same token cost as a first-time read indefinitely.

2. **The "read everything to be safe" trap** — agents read every rollup doc (`docs/project_status.md`, `docs/tasks.md`, `docs/contracts.md`, `docs/decisions.md`, `docs/agent_status.md`) at every bootstrap. ~1100+ lines/session. Compounds with multiple bootstraps per day.

The pattern below avoids both.

## the pattern (5 components)

### 1. Hoist the L1 cheatsheet into the entry file

The project entry file (`AGENTS.md` or equivalent) MUST contain action-oriented bootstrap cheatsheets that work **standalone** — no other procedure file needed for L1 default bootstrap.

Required content in the entry file:

- **Lead bootstrap cheatsheet** — 3 file names + line counts + an L1-L6 sub-branch table. Total ≤30 lines.
- **Delegated bootstrap cheatsheet** — role-card + packet + status + Required Read Files. Total ≤15 lines.
- **Coding-session note** — load the full LLM-Wiki Coding Pack once when the
  assignment is code/review/refactor/test/validation work. Keep this as a
  pointer, not a pasted copy of the pack.

For new projects, start from [[../../../templates/agents.template.md]] and
[[../../../templates/lead_state.template.md]] instead of copying a source
project's `AGENTS.md` or Lead state file by hand.

The procedure file (`docs/session_start.md`) becomes **escalation reference** for sub-branches L2-L6, conflict protocol, and anti-patterns. It is NOT read at every bootstrap once the cheatsheet is hoisted.

### 2. Declare the Token Economy Law as a non-negotiable

In the entry file's Non-Negotiables (or equivalent top-level rule section):

```
- Token economy: default to minimal reads at session start. Each file read must trace
  to a current intent. Never re-read full project state at bootstrap.
```

In the repo-rules file's Working Style:

```
- Token economy: bootstrap with the minimal read set in <entry-file> "Bootstrap cheatsheets".
  Escalate to a procedure-file sub-branch only when the current intent explicitly requires it.
```

### 3. Define Lead sub-branches L1-L6

The Lead role has a default (L1) and 5 named escalations (L2-L6). The entry file's Lead cheatsheet contains the sub-branch table:

| Sub-branch | Intent | Extra reads |
|---|---|---|
| L1 | Just check state | 0 |
| L2 | Review delegated result | `agents/<a>/AGENT.md` checkpoint + the named report |
| L3 | Plan new packet | grep contested contract rows + code map + 1 row of tasks + prior reports |
| L4 | Resolve agent conflict | both agents' `AGENT.md` blocker/checkpoint sections + contested rows + referenced ADRs |
| L5 | Accept + roll up | test_matrix row + tasks row + accepted report |
| L6 | Write new ADR | last 5 ADRs + triggering report |

Sub-branch L1 is the default. Escalation requires an explicit user/intent reason.

### 4. AI-agnostic Lead role + handoff procedure

Role definitions in the entry file and procedure file MUST be **agent-agnostic** — they describe what the role does (write boundary, ownership), not which AI fills it. The current assignment (which AI is Lead this week) lives in:

- the Lead state file (e.g., `AI_CODEX.md`) — `live assignments` section
- the live board (e.g., `docs/agent_status.md`)

The procedure file MUST include a Lead handoff procedure that works for any AI rotation (Codex ↔ Claude ↔ Gemini ↔ DeepSeek ↔ others), not a one-off note tied to one historical transition. Pattern:

- **Outgoing Lead** updates the Lead state file with full live state (phase, assignments, pending reviews, last decisions, blockers, one-sentence `next action`).
- **Incoming Lead** does L1 bootstrap only. Does not read additional rollup unless escalation applies.
- **Sanity check**: incoming Lead restates the `next action` in one sentence; if state file is stale (>1 day), refreshes before further planning.

### 5. Neutralize legacy AI-named files

If the Lead state file has a legacy name biased toward one AI (e.g., `AI_CODEX.md` was originally Codex-centric), either:

- **Option A**: rename to a neutral name (`LEAD_STATE.md`). Requires updating ~10-15 references. Recommended for new projects.
- **Option B (lower risk for existing projects)**: keep the name + add an AI-agnostic note at the top of the file declaring the role-based ownership. The name becomes legacy; the role is the truth.

UniversityWeb chose Option B in ADR-0023 to avoid breaking references during a sub-phase. Option A may follow when the project stabilizes.

## measurement

Track these numbers per bootstrap (Lead and Delegated):

- **Total lines read at L1 default** — target ≤330 for Lead; ≤300 for Delegated.
- **Lines saved vs "read every rollup" pattern** — typical -65% to -75%.
- **Compliance per AI** — does each AI in the project achieve L1 bootstrap without re-reading the procedure file?

If any AI exceeds the target, the entry file's cheatsheet is incomplete or the procedure file's "internalize once" requirement is hidden behind a memory dependency. Audit and re-hoist.

## acceptance criteria

The pattern is correctly applied when:

- [ ] Project entry file contains both Lead and Delegated bootstrap cheatsheets.
- [ ] New projects use `agents.template.md` and `lead_state.template.md`, or an equivalent local skeleton with the same fields.
- [ ] An AI without persistent memory completes Lead bootstrap reading ≤330 lines (entry file + repo rules + Lead state file).
- [ ] An AI without persistent memory completes Delegated bootstrap reading ≤300 lines.
- [ ] Token Economy Law is declared in both entry file Non-Negotiables and repo-rules Working Style.
- [ ] Coding-session bootstrap note points to the full Coding Pack without copying it into repo state docs.
- [ ] Lead sub-branch table (L1-L6) is in the entry file, not buried in the procedure file.
- [ ] Role definitions are AI-agnostic; current assignment lives only in Lead state file + live board.
- [ ] Lead handoff procedure is generic, not a one-off substitution note.
- [ ] An AI new to the project (e.g., Gemini joining a previously Codex/Claude/DeepSeek team) can read entry file + repo rules + Lead state file and know which role to fill without asking.

## failure modes

- **"Internalize once" trap** — works only for memory-capable AIs. Solved by hoisting cheatsheets.
- **"Read everything" trap** — agents read every rollup doc by default. Solved by Token Economy Law + L1 default.
- **AI-name hardcoded** — e.g., Step 0 table lists "Lead = Codex". Solved by splitting role-definitions (agent-agnostic) from current-assignment (in Lead state file).
- **One-off lead-substitution note** — tied to one historical AI transition. Solved by generic AI-agnostic handoff procedure.
- **Stale Lead state file** — outgoing Lead skipped the final update. Solved by `date_updated` + 1-day staleness flag.
- **Entry file bloat** — cheatsheet too long. Mitigation: cap cheatsheet at ~30 lines; use a sub-branch table, not full procedures.
- **Confusing Coding Pack with project history** — coding agents need the
  bounded pack once, but still should not read full rollups or unrelated
  LLM-Wiki docs by default.
- **Procedure file duplication** — same cheatsheet in entry file AND procedure file. Solved by single source of truth: entry file owns cheatsheet, procedure file is escalation reference only.

## anti-patterns

- Entry file delegates the cheatsheet to "see docs/session_start.md" — defeats the hoist.
- Procedure file includes live state (current task, active blockers) — those belong in the Lead state file.
- AI rotation requires editing the procedure file every time — should only require updating `docs/agent_status.md` row.
- Token Economy Law mentioned only in procedure file, not in entry file Non-Negotiables — AI bootstrap may skip it.
- Lead state file name biased toward one AI (e.g., `AI_CODEX.md`) without an AI-agnostic note.

## relationship to LLM-Wiki

- [[session_start.md]]: the session-start flow guide that this pattern enforces.
- [[multi-agent-coordination.md]]: AI-agnostic Lead role + rotation handoff.
- [[delegated-packet-rotation.md]]: legacy split-file pattern for keeping `agents/<agent>/tasks.md` bounded after accepted packets accumulate.
- [[../../../harness/read-workflow.md]]: universal minimal-reads-by-intent principle.
- [[../coding/agent-coding-workflow.md]]: bounded full Coding Pack bootstrap for repo coding sessions.
- [[../coding/karpathy-guidelines.md]]: Karpathy principle 1 (Think Before Coding) — read should serve an articulated intent.

## sources

- File-back from UniversityWeb 2026-05-23 — ADR-0023 acceptance.
- Triggering audit: `/home/admindebian/UniversityWeb/reports/validation/2026-05-23-bootstrap-token-audit.md`
- Decision record: `/home/admindebian/UniversityWeb/docs/decisions.md` ADR-0023.
- Applied artifacts (UniversityWeb):
  - `AGENTS.md` Bootstrap cheatsheets section (lines added ~41)
  - `REPO_RULES.md` Working Style Token Economy bullet
  - `AI_CODEX.md` AI-agnostic note
  - `docs/session_start.md` Step 0 split + Lead handoff procedure section

## measured results (UniversityWeb 2026-05-23)

| Bootstrap pattern | Lines/session | Δ vs cũ |
|---|---|---|
| "Read every rollup" (pre-pattern) | ~1100 | baseline |
| First-time Lead read with `session_start.md` (pre-ADR-0023) | 657 | -40% |
| **Post-ADR-0023 L1 default (any AI, with or without memory)** | **326** | **-70%** |

Pattern works. Numbers should be re-measured per applying project.
