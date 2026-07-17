---
type: Coordination Entry
title: <Project> TICK
description: Task, Intent, Context, Knowledge, and Claims entrypoint for a git-backed project.
tags: [tick, coordination]
timestamp: <YYYY-MM-DDTHH:MM:SSZ>
status: active
---

# TICK

Use this file as the short coordination entrypoint for humans and agents.
Keep it current, small, and linked to source-of-truth files.

## Task

<Current task, phase, or coordination objective.>

## Intent

<Why this task matters and what outcome should exist when it is done.>

## Context

- Source of truth:
- Current constraints:
- Active repo/project:
- Do not touch:
- Current risk lane:

## Knowledge

Read in this order:

1. `AGENTS.md`
2. `REPO_RULES.md`
3. `TICK.md`
4. Current task packet
5. Required read files named by the task

Conditional packs:

- Coding Pack:
- Data Pack:
- Security Deep Pack:
- Operations Pack:
- Other:

## Claims

| Task | Claimed by | Scope | Claimed at | Status | Release rule |
| --- | --- | --- | --- | --- | --- |
| <TASK-ID> | unclaimed | <files/sections/workflow> | n/a | unclaimed | release when done, blocked, reassigned, or stale |

## Claim Rules

- Claim before implementation.
- Do not work a task claimed by another active session.
- Release immediately when blocked, done, paused, or reassigned.
- Mark stale when the owner is unreachable past the project timeout.
- Shared-file section/row claims must name the exact file and section/rows.
