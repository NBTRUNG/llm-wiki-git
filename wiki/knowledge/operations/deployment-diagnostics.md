---
name: deployment-diagnostics
description: Token-budgeted deployment, build, publish, and runtime-smoke diagnostics for agent release work.
date_ingested: 2026-07-07
status: active
source_type: project-file-back
confidence: medium
confidence_reviewed: 2026-07-07
---

# deployment diagnostics

## purpose

Use this guide when a deployment, build, publish, package, runtime smoke, or
server rollout task starts failing and an agent needs to debug without burning a
large token or time budget.

This guide promotes the UniversityWeb U17 publish audit:

```text
/home/admindebian/UniversityWeb-U17/reports/agent/codex-20260707-token-audit/publish-token-overuse-audit.md
```

The U17 result was technically correct, but the process consumed too much
context because the agent read broad diagnostic output, tried too many command
variants, and repeated expensive validation levels.

## operating rule

Prefer narrow probes, small output windows, and early checkpoints.

Do not print full diagnostic logs by default. Write large logs to `/tmp`, search
for target clues with `rg`, then open only a small line window around the first
meaningful clue.

Preferred pattern:

```bash
command -v diag > /tmp/tool.log 2>&1
rg -n "FAILED|error|MSB|NETSDK|Exception|GetTargetFrameworks|ProjectReference" /tmp/tool.log
sed -n '<small-window>' /tmp/tool.log
```

Expand the window only when the first window contains a concrete new clue.

## repeated-failure checkpoint

If two command variants fail without producing new information, stop and report
a checkpoint before trying more variants.

It is acceptable to say the current evidence is insufficient. In deployment and
publish work, asking the user to join source lookup or choose the next probe is
better than continuing broad local search.

The checkpoint should include:

- exact command family;
- failure target or phase;
- current hypothesis;
- where the agent is uncertain or does not know yet;
- next one or two proposed probes;
- whether user, Lead, or integration-owner approval is needed to continue.

If the user gives a time or token cap, treat it as a hard checkpoint trigger.
Do not continue deep investigation silently just because more commands are
available.

## prior-fix lookup

Before a deployment agent runs more than one expensive publish/build diagnostic
variant, it must check whether the same repo already has a recorded fix or
workaround.

Use narrow report/source probes, not broad history reads:

```bash
rg -n "publish|GetTargetFrameworks|DisableTransitiveProjectReferences|ProjectReference|exit code 1|Build FAILED" reports/agent docs
rg -n "publish|GetTargetFrameworks|DisableTransitiveProjectReferences|ProjectReference" /home/admindebian/LLM-Wiki/wiki/knowledge/operations /home/admindebian/LLM-Wiki/wiki/knowledge/agent-errors
```

If a prior fix exists, state it before running new variants:

```text
Known prior fix:
Current failure anchor:
Does the prior fix apply here?
One validation command:
Why further diagnostics are needed:
```

Do not rediscover a known publish workaround by repeating broad diagnostics. If
the user has to stop the session to say "this was fixed before", treat that as a
workflow incident and file the lesson back.

## .NET build/publish triage

When `dotnet build` passes but `dotnet publish` fails or fails silently:

1. Check process/file locks.
2. Check SDK/runtime version and target framework.
3. Check `.csproj` `ProjectReference` graph.
4. Check publish-specific properties and targets.
5. Only then escalate to broad diagnostic log analysis.

For project-reference failures, inspect the graph before trying more publish
variants:

```bash
rg -n "ProjectReference" -g "*.csproj"
```

The U17 publish failure was caused by a duplicate direct/transitive project
reference:

```text
UniversityWeb.Web -> UniversityWeb.Application
UniversityWeb.Web -> UniversityWeb.Domain
UniversityWeb.Application -> UniversityWeb.Domain
```

The fix was to remove the direct `Web -> Domain` reference and let `Web`
consume `Domain` through `Application`.

A later U17 deploy session found a second, non-source publish workaround for a
silent .NET 10 publish failure in the same target phase:

```text
dotnet publish UniversityWeb.Web/UniversityWeb.Web.csproj -c Release --no-restore --disable-build-servers --tl:off -p:DisableTransitiveProjectReferences=true
```

Use this as a known U17-specific workaround candidate before broad MSBuild
diagnostics. It does not replace normal source-graph review; it is a bounded
probe when build/tests pass and publish fails during transitive project-reference
framework discovery.

## validation deduplication

Split deployment validation into levels:

| Level | Proof |
| --- | --- |
| 1 | build/test/publish |
| 2 | package content, config readback, secret scan |
| 3 | runtime smoke |
| 4 | database backup/restore or checksum verification |

Do not repeat Level 3 or Level 4 unless a later change affects runtime behavior
or database state. If repeated, record why.

For deploy packages that include database backups, do not place `.bak` files
under a public web root. Treat backup placement as a security boundary.

## output budget defaults

Use tight command output caps unless the command is known to emit concise
output.

| Output source | Default handling |
| --- | --- |
| diagnostic logs | redirect to `/tmp`, `rg` for clues, then small `sed` windows |
| `rg` source matches | cap output; narrow path/glob first |
| `find` package trees | filter to expected paths instead of dumping broad trees |
| smoke/build summaries | print concise command result and log path |
| final report | summarize commands, exact result, and residual risk |

The largest waste in the U17 incident was input/tool-output volume, not hidden
reasoning. Optimizing output volume preserves quota and makes the next agent's
read path cleaner.

## report fields

For failed release/debug sessions, include:

- time or token cap, if any;
- command family and variants attempted;
- first meaningful failure phase or target;
- diagnostic log path, not pasted log body;
- small clue windows opened;
- validation level reached;
- validation levels intentionally not repeated;
- next probe or blocker.

## anti-patterns

- Reading full diagnostic logs into the conversation.
- Trying many command variants before reducing the failure surface.
- Re-running runtime smoke or backup verification after changes that do not
  affect runtime behavior or data state.
- Re-reading coordination docs repeatedly instead of using the active task and
  latest checkpoint.
- Continuing past a user-provided time/token cap without a checkpoint.
