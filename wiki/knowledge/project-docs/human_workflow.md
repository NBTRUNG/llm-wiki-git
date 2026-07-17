# Project Human Workflow

Use this guide when creating or updating the manual operator entrypoint for a
project.

## contract

Every new project must have one short, project-owned workflow that a human can
follow without an agent.

- Repo-backed project: use root `HUMAN.md` by default.
- Pre-repo project: use `docs/human_workflow.md`.
- An existing repo may keep an established equivalent name only when its
  `README.md` identifies that file as the single human entrypoint.

The file is an operator map, not a second source of truth. It links to detailed
runbooks, task packets, and evidence owned elsewhere in the project.

## minimum content

Record known facts and mark unavailable facts `unknown`:

1. Purpose, environment, and non-production/production boundary.
2. Exact prerequisites and working directory.
3. Start, status, stop, and smallest useful smoke-check commands.
4. Browser URL, hostname/hosts-file step, port, and expected local certificate
   behavior when applicable.
5. Bootstrap username and the safe way to obtain its password. A published
   vendor default may be written only with an immediate rotation instruction;
   never store a real secret.
6. Persistent data locations, named volumes, and what each location owns.
7. Backup/checkpoint and restore pointer, including whether recovery has been
   rehearsed.
8. The manual test or business workflow the human should execute next.
9. Safe boundaries, commands that erase data, and actions requiring explicit
   approval.
10. Recovery/escalation path plus links to current status and evidence.

Prefer copy-pasteable commands. Explain what a path or command does immediately
beside it. Use the language understood by the project owner; Vietnamese-first
is the workspace default for human-only operating guidance.

## separation of responsibility

| File | Responsibility |
| --- | --- |
| `README.md` | project identity and short pointer to the human entrypoint |
| `HUMAN.md` or declared equivalent | safe manual operation and recovery map |
| `AGENTS.md` | agent constraints and read/write behavior |
| status/task/test files | current state, ownership, and evidence |
| detailed runbooks | full deployment, backup, restore, or incident procedure |

Do not duplicate a long runbook in the human entrypoint. Link it and keep only
the minimum commands needed to reach, inspect, stop, and recover the project.

## safety rules

- Never include production passwords, tokens, private keys, or personal data.
- Do not tell a human to edit Docker volume contents directly.
- Name destructive commands such as `down -v`, reset, purge, or delete and
  state the approval/checkpoint required before use.
- Do not claim backup, restore, or recovery works until evidence exists.
- Do not invent paths or credentials. Use `unknown` and name the owner who must
  resolve them.

## update triggers

Update the project human workflow when any of these change:

- URL, port, hostname, certificate, login, or credential-rotation procedure;
- start/stop/status/smoke command;
- container, service, persistent volume, database, or storage ownership;
- backup, restore, interruption recovery, or destructive boundary;
- manual test packet, current status pointer, or escalation owner.

Agents changing one of these surfaces must update the human entrypoint in the
same work unit or report an explicit blocker.

## validation

A bootstrap or relevant runtime change is not complete until a human can:

- find the single human entrypoint from `README.md`;
- reach the project using exact commands and paths;
- identify bootstrap-access and rotation requirements without exposing a real
  secret;
- distinguish persistent data from disposable runtime state;
- stop and start safely;
- find the smoke check, test packet, current status, and recovery path;
- recognize destructive actions before running them.

