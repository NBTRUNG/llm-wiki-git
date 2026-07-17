---
name: react-performance
description: React rendering and performance guidance for agents working on React components, hooks, state, effects, and rerender-sensitive UI.
date_ingested: 2026-06-27
status: active
source_type: web-research + skill-file-back
source_urls:
  - https://react.dev/blog
  - https://react.dev/learn/render-and-commit
  - https://react.dev/reference/react/memo
  - https://react.dev/reference/react/useMemo
  - https://react.dev/reference/react/useCallback
confidence: high
confidence_reviewed: 2026-07-01
---

# react performance

## purpose

Use this guide when writing, reviewing, or refactoring React components whose
rendering, state updates, or effect behavior can affect responsiveness or
reviewability.

Repo-specific framework rules and component patterns win.

## baseline

- Components should render as pure calculations from props, state, and context.
- State updates trigger rendering; optimize after identifying a real rerender,
  expensive calculation, or interaction delay.
- Prefer a simpler component tree and clean data flow before adding memoization.
- Use profiling, browser evidence, or task-specific reasoning before changing
  code solely for performance.
- `memo`, `useMemo`, and `useCallback` are performance tools, not correctness
  tools. If behavior depends on memoization to work, fix the underlying state,
  effect, or render bug first.
- If the repo has React Compiler enabled and validated, expect less manual
  `memo`/`useMemo`/`useCallback` code. Confirm the repo version and compiler
  configuration before removing existing memoization.

## current-source notes checked 2026-07-01

- React official docs show React 19.2 as current and React Compiler v1.0 as a
  stable release from 2025. Treat compiler-enabled automatic memoization as
  repo-version-specific: verify the repo's React/compiler setup before removing
  manual memoization.
- React Server Components had critical/high security advisories in late 2025.
  Any task touching RSC, framework server rendering, or server/client payload
  boundaries should check the active repo's framework patch level before
  performance tuning.
- Create React App is deprecated for new apps. For new React projects, prefer
  the repo's accepted framework or modern build-tool path rather than starting
  from CRA.

## review checklist

- State is stored at the narrowest owner that needs to change it.
- Expensive derived values are memoized only when they are actually expensive or
  affect child memoization.
- `memo`, `useMemo`, and `useCallback` are not used to hide unstable design.
- Manual memoization has a measured or clearly reasoned target: expensive
  render, stable props for a memoized child, or expensive derived value.
- Effects synchronize with external systems; pure derivations stay in render.
- Event handlers own interaction logic that does not need effect timing.
- Lists use stable keys and avoid rebuilding large structures unnecessarily.
- Components are not declared inside components when that creates remounts or
  unnecessary rerenders.
- Context providers do not force broad subtree rerenders for unrelated fields.
- Props passed to memoized children are stable where stability is the point.
- Custom `arePropsEqual` comparisons avoid deep equality unless the structure is
  bounded and the comparison is proven cheaper than rendering.

## anti-patterns

- Adding `memo` everywhere without a measured bottleneck.
- Storing derived state that can be calculated from current props/state.
- Recreating object/function props in a hot parent and expecting child
  memoization to work.
- Using effects for data transformations that can happen during render.
- Splitting state so far that interactions become harder to reason about.
- Leaving React Compiler status ambiguous and mixing compiler assumptions with
  hand-written memoization rules.

## validation evidence

Use the smallest evidence that matches risk:

- React profiler or browser performance recording for real performance work.
- Before/after interaction timing for slow UI.
- Unit/component tests for state and edge cases.
- Screenshot or browser checks when rendering behavior changes.
- Explanation of why no performance test was practical for a small code change.

## related

- Next.js performance: [[nextjs-performance.md]]
- Web Vitals: [[web-vitals.md]]
- Frontend state and data: [[frontend-state-and-data.md]]
- UI accessibility: [[../ui/accessibility.md]]
