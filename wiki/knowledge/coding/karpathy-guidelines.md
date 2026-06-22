---
name: karpathy-guidelines
description: Behavioral guidelines to reduce common LLM coding mistakes. Use when writing, reviewing, or refactoring code to surface assumptions, keep changes surgical, define verifiable success criteria, and preserve correctness through invariants, pre/postconditions, and stepwise refinement.
source_type: external-research + project-file-back
source_urls:
  - https://x.com/karpathy/status/2015883857489522876
  - https://github.com/forrestchang/andrej-karpathy-skills
local_source: raw/andrej-karpathy-skills-main/skills/karpathy-guidelines/SKILL.md
additional_sources:
  - /home/admindebian/UniversityWeb/docs/apg.md
source_project: UniversityWeb
date_ingested: 2026-05-23
date_updated: 2026-06-20
confidence: high
confidence_reviewed: 2026-06-20
applicable_contexts:
  - any AI agent writing/reviewing/refactoring code
  - LLM-Wiki governance work
  - delegated agent tasks in real repos
status: active
license: MIT
---

# Karpathy guidelines

Behavioral guidelines to reduce common LLM coding mistakes, derived from Andrej
Karpathy's observations on LLM coding pitfalls and expanded with classical
correctness practices from Dijkstra/Hoare-style programming.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial
tasks, such as typos or obvious one-liners, use judgment. Not every change needs
full ceremony, but every non-trivial change needs a clear correctness story.

## Core idea

Good programmers and good mathematicians share one habit: they do not start
from the answer. They understand the statement, identify what must remain true,
and let the proof and implementation grow together.

For agentic coding, this matters more than usual. An agent can generate a large
patch quickly, so a wrong assumption at the start can become a large, coherent,
wrong implementation. The practical defense is to make specification,
invariants, and verification explicit before writing code.

## 1. Think before coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:

- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them; don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.
- Identify the input, output, edge cases, and failure modes before writing code.
- Name the invariant or postcondition the change must preserve.

Pre-code checklist:

```text
- What are the inputs? Can they be null, empty, negative, malformed, or huge?
- What output is expected for normal cases and edge cases?
- What must never happen after this function returns?
- What happens when a dependency fails, such as DB, network, file, cache, or CMS?
- What is the simplest implementation that preserves the required behavior?
```

## 2. Simplicity first

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

Simple does not mean casual. Simple code is code whose invariant is obvious
from its shape: clear names, direct control flow, few moving parts, and no
hidden behavior. Optimize after measuring; do not pre-optimize with clever keys,
generic frameworks, or broad configuration unless the task requires it.

## 3. Surgical changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:

- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it — don't delete it.

When your changes create orphans:

- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

**The test:** every changed line should trace directly to the user's request.

## 4. Goal-driven execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:

| Instead of... | Transform to... |
|---|---|
| "Add validation" | "Write tests for invalid inputs, then make them pass" |
| "Fix the bug" | "Write a test that reproduces it, then make it pass" |
| "Refactor X" | "Ensure tests pass before and after" |

For multi-step tasks, state a brief plan:

```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let the agent loop independently. Weak criteria ("make
it work") require constant clarification.

## 5. Correctness tools

Use these tools before or during implementation when the task is more than a
trivial edit.

### 5.1 Invariants

An invariant is a condition that must always hold at a specific point in a
program, regardless of input or internal state.

Examples:

```text
Function invariant:
- This function always returns a string.
- If a valid URL exists, it returns that URL.
- If no URL can be resolved, it returns string.Empty.
- It does not leak resolver exceptions to the caller.

Object invariant:
- After construction, the service has a non-null logger and repository.
- Cached entries are keyed by normalized query fields.
```

Agent questions:

- What is always true after this method returns?
- Which branch could violate that truth?
- Is the invariant visible in the code structure, or only in the author's head?

### 5.2 Preconditions and postconditions

Use Hoare-style thinking: `{P} C {Q}`.

- `P` is the precondition: what must be true before code runs.
- `C` is the command or implementation.
- `Q` is the postcondition: what must be true after code runs.

For important methods, write or mentally define `P` and `Q` before the body:

```csharp
// P: query.Page >= 1 and query.PageSize is already normalized.
// Q: result.Items.Count <= query.PageSize and every item has a non-null ThumbnailUrl.
public PublicPagedResult<NewsListItemDto> GetNews(PublicNewsListQuery query)
{
    var normalized = NormalizeNewsQuery(query);
    ...
}
```

Tests are how the agent verifies that `{P} C {Q}` actually holds.

### 5.3 Stepwise refinement

Start from a small specification and refine it without losing correctness.

```text
Level 1: Resolve a featured image URL for a content item.
Level 2: Try published cache, then service fallback, then raw value fallback.
Level 3: Implement each resolver step with clear stop conditions.
```

Each refinement must preserve the parent specification. Jumping from a vague
request directly into concrete code is a common agent failure mode.

## 6. Spec first, code second

In agentic coding, the specification is the source of truth; code is derived
output. Before a non-trivial implementation, define:

```text
Purpose:
Inputs:
Outputs:
Invariant:
Fallback or error behavior:
Stop conditions:
Verification:
```

Example:

```text
Purpose: Resolve a media URL from a CMS content item.
Invariant: Return a valid root-relative/absolute URL, or string.Empty.
Fallback order: published value -> service lookup -> raw value extraction.
Stop condition: Return immediately after the first valid URL.
Verification: Existing list/detail endpoints keep non-null image fields.
```

With this shape, the agent can code, review, and test against the same contract.

## 7. Keep one source of truth for logic

Duplicate logic is one of the highest-risk agent mistakes. If a block is copied
into a second function, the next fix will likely update one copy and miss the
other.

Rule:

```text
If you are copy-pasting behavior, stop and consider extracting a named helper.
```

Use a shared helper when:

- two call sites need the same fallback chain;
- two endpoints normalize the same query shape;
- diagnostic code repeats production resolution logic;
- tests need to exercise the same contract through multiple paths.

Do not extract for cosmetic reuse. Extract only when it creates a real single
source of truth for behavior.

## 8. Boundaries, fallbacks, and exceptions

Validate loudly at system boundaries. Keep private helpers focused inside the
trusted interior.

System boundaries include API endpoints, public methods, CLI entry points,
event handlers, importers, seeders, and code that accepts user/CMS/network data.
At boundaries:

- validate input;
- reject or normalize malformed values explicitly;
- log or return clear errors where appropriate;
- avoid changing public API contracts unless the task asks for it.

Interior helpers may rely on already-enforced preconditions. Avoid repeated
guards that add noise without improving safety.

Exception handling rule:

- Catch specific expected exceptions.
- Add a short comment or log line when an exception intentionally triggers a
  fallback.
- Do not use silent catch-all blocks.
- Rethrow or surface errors that cannot be handled correctly.

Good fallback handling keeps the signal:

```csharp
try
{
    return ResolveFromPublishedValue(content);
}
catch (InvalidOperationException)
{
    // The CMS converter cannot handle this stored value shape; caller will try raw fallback.
    return string.Empty;
}
```

Bad fallback handling hides the bug:

```csharp
try
{
    return ResolveFromPublishedValue(content);
}
catch
{
    return string.Empty;
}
```

## 9. Names should express intent

Prefer names that say why the code exists, not only how it works.

```csharp
// Mechanism-heavy
private string ResolveWithContentServiceAndDatabaseFallback(...)

// Intent-oriented
private string ResolveMediaFallbackUrl(...)
```

Names are the first layer of documentation. If the name is vague, the invariant
usually is too.

## 10. SQL and data access safety

Agent-written SQL must be boring and explicit.

Rules:

- Use parameterized queries. Do not build SQL by interpolating user, CMS, or
  request values.
- Do not treat `NOLOCK` as a default for read-only queries.
- Use `NOLOCK` only when the task accepts dirty/stale/inconsistent reads and a
  short comment explains the tradeoff.
- Do not use `NOLOCK` for authorization, payments, enrollment, security,
  business decisions, or correctness-critical state.
- Isolate direct queries against framework/CMS internals in a helper or
  repository so they can be replaced later.

Readable, stable cache keys are also part of data correctness. Prefer explicit
keys built from normalized fields over `GetHashCode()` or opaque serialized
objects when correctness/debuggability matters.

## 11. Anti-patterns

| Anti-pattern | Symptom | Prevention |
| --- | --- | --- |
| Silent catch-all | `catch { }` hides failures | Catch specific exceptions; log/comment intentional fallback |
| Caller assumption at a boundary | Public method trusts malformed input | Enforce preconditions at public/API boundaries |
| Duplicate logic | Same fallback or mapping in two places | Extract a helper when behavior truly has one source of truth |
| Speculative generality | Abstractions/configuration not requested | Build only what the task needs now |
| Style drift | Formatting/refactors mixed into bug fix | Review diff; every line must trace to the request |
| God method | One method has multiple unrelated invariants | Split by responsibility and contract |
| Magic value | Unnamed timeout/limit/threshold | Use a named constant or explain the reason |
| Jagged trust | Trusting agent output because it compiles | Review the diff and verify behavior |
| Hash-as-identity | `GetHashCode()` used as a durable cache key | Build explicit keys from normalized fields |
| Default dirty reads | `NOLOCK` added as routine optimization | Use only with an accepted consistency tradeoff |

## 12. Submit checklist

```text
Invariant check
- Is each important method's invariant clear?
- Do all return branches preserve the postcondition?

Simplicity check
- Can any line be removed without changing behavior?
- Is any abstraction speculative?

Surgical check
- Does every changed line trace to the request?
- Did formatting or adjacent cleanup drift into the patch?

Verification check
- Is success measurable?
- Did you run or document the relevant automated/manual check?

Duplication check
- Did you copy behavior that should be a shared helper?
- Did you leave diagnostic and production paths inconsistent?

Boundary check
- Are public inputs validated or normalized?
- Is SQL parameterized?
- Are exceptions handled intentionally?
```

## 13. Large interactive surface policy

Large files are not automatically bad. Treat them by operational risk, not by
aesthetic discomfort.

A large fused file can be acceptable, even long-term, when:

- it solves a concrete runtime problem, such as avoiding server-rendering
  hundreds of cards/details into the first HTML response;
- security boundaries are understood and verified;
- performance is acceptable or measured as improved;
- the file is stable, has a clear owner, and is not frequently changed by many
  agents/teams;
- changing it would create more risk/cost than leaving it alone.

Do not refactor a stable large file merely to make it look cleaner. Refactor
when there is payoff: security fix, performance regression, recurring bugs,
hard-to-review changes, duplicated behavior drifting, high conflict rate, or a
new task that materially extends the same surface.

However, when a view/component/page mixes several concerns, agents must stop
and name the boundary before adding more behavior. Warning signs:

- one file contains server-side data lookup, markup, CSS, and client-side
  orchestration;
- the file is hard to debug because rendering, API calls, state, styling, and
  CMS/data conversion are interleaved;
- the same filtering, formatting, media, parsing, or fallback logic exists in a
  view and in an API/service/adapter;
- the file grows beyond about 300 lines for new work, or beyond about 500 lines
  for inherited work being materially extended;
- a bug fix requires understanding unrelated UI sections before the failing
  behavior can be isolated.

Default rule for new work: avoid creating new large mixed-concern files. If a
new file is expected to exceed about 300 lines or mix server data, markup, CSS,
and JS, record the reason in the task packet and define the future boundary.

Default boundary for server-rendered web apps:

```text
Razor/template: semantic shell and server-rendered constants only.
Service/API/adapter: data lookup, normalization, filtering, DTO shape, fallback.
CSS/static asset: presentation.
JS/static asset: client state, drawer/search/filter behavior, fetch orchestration.
```

For a stabilized fused surface, prefer leaving it alone unless one of the
payoff triggers above applies. When refactor is justified, use a delayed
no-behavior-change extraction:

```text
1. Keep the current fused implementation until the performance fix has run
   cleanly for the agreed stabilization window, often 1-2 weeks.
2. Extract JS into a static module/file.
3. Extract CSS into a static stylesheet if inline CSS is large.
4. Keep the Razor/template as shell only.
5. Do not change API routes, DTOs, visual design, copy, or user-visible behavior.
6. Verify before/after with the same route, API responses, and browser/manual checks.
```

The invariant for this refactor is: behavior, API contract, DTO contract, and
visual appearance remain the same; only file boundaries improve. If this
invariant cannot be verified, defer the refactor.

## 14. Phase report shape

For delegated or multi-phase agent work, report enough detail for the lead or
human integrator to verify the patch without rereading the whole session:

```text
1. Phase completed:
2. Files changed:
3. Main behavior changes:
4. What did not change:
5. Remaining risks:
6. Commands/checks run:
7. Build/test result:
8. Diff summary:
9. Large-surface guard: n/a | checked | blocker raised
10. Confirmation needed before next phase:
```

## How to know it's working

- Fewer unnecessary changes in diffs — only requested changes appear.
- Fewer rewrites due to overcomplication — code is simple the first time.
- Clarifying questions come before implementation — not after mistakes.
- Clean, minimal PRs — no drive-by refactoring or "improvements".
- Bug fixes include a clear invariant, test, reproduction, or manual check.

## Relationship to LLM-Wiki

- `wiki/knowledge/coding/code-quality.md` enforces principle 2 + 3 at the code level (small functions, readable names, no premature abstraction).
- `wiki/knowledge/coding/testing-strategy.md` enforces principle 4 (tests as success criteria).
- `harness/task-packet.md` enforces principle 1 + 4 (explicit input/output, exact write targets).
- `harness/intake.md` enforces principle 1 (classify and clarify before doing).
- `global-rules.md` wiki-gap reporting enforces principle 1 (do not guess when wiki has no coverage).
- Project-specific guides, such as `/home/admindebian/UniversityWeb/docs/apg.md`, can file back reusable lessons here, but project-specific routing, endpoint, or CMS rules stay in the project repo.

## Sources

- Andrej Karpathy on X (Nov 2025): https://x.com/karpathy/status/2015883857489522876
- Karpathy-inspired Claude Code Guidelines (Forrest Chang): https://github.com/forrestchang/andrej-karpathy-skills
- Local raw copy: `raw/andrej-karpathy-skills-main/`
- UniversityWeb agent programming guide: `/home/admindebian/UniversityWeb/docs/apg.md`
- Original SKILL.md license: MIT
