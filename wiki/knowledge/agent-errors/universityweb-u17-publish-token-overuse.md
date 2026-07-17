---
name: universityweb-u17-publish-token-overuse
description: Case study for excessive token use during UniversityWeb U17 publish/deploy troubleshooting.
date_ingested: 2026-07-07
status: active
source_type: project-file-back
confidence: medium
confidence_reviewed: 2026-07-07
---

# UniversityWeb U17 publish token overuse

## source evidence

- Project: `/home/admindebian/UniversityWeb-U17`
- Task: `U17-DEPLOY-PUBLISH-011`
- Audit:
  `/home/admindebian/UniversityWeb-U17/reports/agent/codex-20260707-token-audit/publish-token-overuse-audit.md`
- Later deploy result:
  `/home/admindebian/UniversityWeb-U17/reports/agent/session-20260708-2257/U17-DEPLOY-SERVER-014-result.md`
- Date: 2026-07-07

## symptom

The publish/deploy task reached a technically correct final result, but the
session consumed far too many tokens for the size of the issue.

Reported deploy-session usage:

```text
total: 1,277,111
input: 1,182,900
cached input: +25,794,176
output: 94,211
reasoning: 23,761
```

A later audit/review session for the same folder also consumed high budget for
a read-and-file-back task:

```text
total: 319,304
input: 299,273
cached input: +1,385,856
output: 20,031
reasoning: 4,556
```

A later deploy plus projection-test period again consumed high budget:

```text
total: 346,798
input: 314,399
cached input: +7,222,912
output: 32,399
reasoning: 10,641
```

The user had to stop the deploy session and remind the agent that the publish
failure had already been fixed once. After that checkpoint, the agent searched
LLM-Wiki/prior reports and localized the issue more effectively.

## technical outcome

The publish issue was caused by local project-reference graph shape:

```text
UniversityWeb.Web -> UniversityWeb.Application
UniversityWeb.Web -> UniversityWeb.Domain
UniversityWeb.Application -> UniversityWeb.Domain
```

`dotnet build` tolerated the graph, but `dotnet publish` failed during MSBuild
project-reference preparation. The fix was to remove the direct
`UniversityWeb.Web -> UniversityWeb.Domain` reference and let the web project
consume Domain through Application.

Later deploy evidence recorded a bounded workaround for a related silent .NET
10 publish failure path:

```text
-p:DisableTransitiveProjectReferences=true
```

That workaround allowed standard publish output without source changes when
build and tests already passed and publish failed in
`_GetProjectReferenceTargetFrameworkProperties` / `GetTargetFrameworks`.

## what worked

- Local MSBuild diagnostic output identified the failing target/phase.
- Local `.csproj` inspection identified the duplicate direct/transitive
  reference graph.
- A narrow project-reference graph fix resolved publish.

## what wasted cost

- Broad diagnostic log reading instead of `rg` clue extraction and small line
  windows.
- Multiple publish variants before checking the reference graph.
- Failure to check prior U17 deploy reports and LLM-Wiki case notes early enough
  for the already-known publish failure/workaround.
- Repeating deploy package replacement, smoke tests, backup verification,
  manifest generation, and checksum generation after changes that did not
  affect every validation level.
- Reading coordination/report files repeatedly.
- Continuing past the user's implied tolerance for long repeated failures.

## internet/search assessment

Internet search would have helped as a bounded early step, but it would not have
found the exact repo-local root cause by itself.

Useful external facts:

- Microsoft docs confirm `dotnet publish` reads dependencies from the project
  file and invokes MSBuild `Publish`.
- Microsoft MSBuild docs confirm modern .NET project references are transitive.

Better sequence:

1. Confirm `dotnet build` passes.
2. Run `dotnet publish -v minimal`.
3. If silent/phase failure appears, run one diagnostic log to `/tmp`.
4. `rg` for `FAILED|error|MSB|GetTargetFrameworks|ProjectReference`.
5. Check prior repo reports and LLM-Wiki notes for the same phase/workaround.
6. Open a small window around the first meaningful clue.
7. Search official docs for the failing command/target semantics only if prior
   local evidence does not explain it.
8. Inspect `.csproj` `ProjectReference` graph or apply the known bounded
   publish workaround when appropriate.
9. Patch the smallest graph issue or use the smallest publish property and
   validate once.

## prevention rule

For publish/deploy failures, load [[../operations/deployment-diagnostics.md]]
and follow [[internet-search-and-token-budget.md]].

Do not keep grepping or running publish variants after two failures without new
information. Stop, state the hypothesis, and ask for approval before continuing.

If the user says the issue was fixed before, immediately search prior local
reports and LLM-Wiki case notes before running another expensive command.

## related

- [[README.md]]
- [[internet-search-and-token-budget.md]]
- [[../operations/deployment-diagnostics.md]]
