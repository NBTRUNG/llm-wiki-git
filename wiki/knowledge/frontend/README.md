---
name: frontend-knowledge
description: Frontend engineering knowledge for React, Next.js, browser performance, data fetching, and Web Vitals. Complements UI/UX and design-system guidance.
date_ingested: 2026-06-27
status: active
source_type: web-research + skill-file-back
source_urls:
  - https://react.dev/
  - https://nextjs.org/docs
  - https://web.dev/vitals/
confidence: medium
confidence_reviewed: 2026-06-27
---

# frontend knowledge

This folder owns frontend engineering knowledge: rendering behavior,
React/Next.js performance, browser delivery, client/server boundaries, data
fetching, and Web Vitals.

It is distinct from UI/UX:

- `frontend/` = how the browser and framework deliver interaction efficiently.
- `ui/` = how the interface should behave, look, communicate, and remain
  accessible.

## index

- [[react-performance.md]] — React rendering, state shape, memoization, effects,
  and re-render review.
- [[nextjs-performance.md]] — Next.js App Router performance, server/client
  boundaries, lazy loading, images, fonts, scripts, and bundling.
- [[web-vitals.md]] — user-centered web performance metrics, budgets, and
  validation evidence.
- [[frontend-state-and-data.md]] — data fetching, deduplication, caching,
  local storage, and request-waterfall checks.

## relationship to imported skill material

The local `vercel-react-best-practices` skill is treated as source material for
frontend performance knowledge, not as the canonical source of truth. Agent
skills should route React/Next.js work to this folder plus active repo rules
instead of carrying large copied rule catalogs.

## when to use

Use this folder when a task touches:

- React components, hooks, state, memoization, effects, or rerender behavior;
- Next.js routes, Server Components, Client Components, Server Actions, images,
  fonts, scripts, package bundling, or lazy loading;
- data fetching, request waterfalls, client caches, localStorage, or hydration;
- Core Web Vitals, page load, interaction responsiveness, layout stability, or
  frontend performance evidence.

For visual quality, accessibility, responsive states, and component behavior,
also use [[../ui/README.md]].
