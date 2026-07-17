---
name: nextjs-performance
description: Next.js frontend performance guidance for App Router, server/client boundaries, lazy loading, images, fonts, scripts, and package bundling.
date_ingested: 2026-06-27
status: active
source_type: web-research + skill-file-back
source_urls:
  - https://nextjs.org/blog
  - https://nextjs.org/docs
  - https://nextjs.org/docs/app/guides/lazy-loading
  - https://nextjs.org/docs/app/guides/package-bundling
  - https://nextjs.org/docs/app/api-reference/components/image
  - https://nextjs.org/docs/app/getting-started/fonts
confidence: high
confidence_reviewed: 2026-07-01
---

# nextjs performance

## purpose

Use this guide when working on Next.js routes, layouts, components, data
loading, Server Components, Client Components, Server Actions, images, fonts,
scripts, package bundling, or hydration-sensitive behavior.

Repo-specific Next.js version and conventions win.

## baseline

- Keep Server Components server-side unless interactivity requires a Client
  Component.
- Keep Client Components small and deliberate; do not move whole route trees to
  the client for one interactive control.
- Avoid request waterfalls by starting independent work early and awaiting as
  late as the UI contract allows.
- Lazy-load heavy client-only UI when it is not needed for initial interaction.
- Use framework-supported image, font, script, and bundling paths before custom
  browser hacks.
- In App Router, lazy loading mainly targets Client Components and imported
  libraries. Server Components are already split/streamed by the framework; a
  dynamic import of a Server Component only lazy-loads its Client Component
  children.
- For Next.js 16+, prefer `preload` or `fetchPriority`/`loading` decisions for
  LCP images. Do not cargo-cult older `priority` guidance without checking the
  repo's Next.js version.

## current-source notes checked 2026-07-01

- Next.js 16.x is the current major line in official release notes. Version
  matters: confirm the repo's exact Next.js version before applying guidance
  about cache components, Turbopack defaults, build adapters, image defaults,
  async params, or React Compiler integration.
- Next.js 16.3 preview notes include Instant Navigations and Partial
  Prefetching. Treat those as version-gated features, not default architecture
  guidance for every project.
- Next.js official release notes now include agent-oriented workflow support
  such as bundled docs through `AGENTS.md`, browser log forwarding, and
  diagnostics. For AI-assisted Next.js repos, keep repo entry docs
  version-matched and expose browser/runtime errors to the agent workflow.
- React Server Components security advisories affected Next.js 13.x through
  16.x in late 2025. Before optimizing RSC/server-rendered paths, verify the
  active repo is on a patched framework version.

## review checklist

- Server/client boundary is explicit and minimal.
- Data fetching is parallel where independent.
- Loading and error states match route/user expectations.
- Heavy components or libraries are dynamically loaded only when useful.
- Images have stable dimensions and appropriate priority/loading behavior.
- Responsive `Image` usage includes `sizes` when `fill` or responsive CSS would
  otherwise make the browser assume `100vw`.
- Image Optimization does not silently fetch authenticated private images
  through a path that strips needed headers.
- Fonts avoid layout shift and unnecessary network cost.
- Third-party scripts are deferred or isolated when they are not critical.
- Server Actions and route handlers validate authentication, authorization, and
  input at the server boundary.
- Bundle impact is checked when adding new dependencies or broad imports.
- Bundle analysis is required before declaring a package/bundle performance task
  solved; use the repo's Turbopack or Webpack analyzer path.

## anti-patterns

- Adding `"use client"` at the top of a large tree to fix a small interaction.
- Serially awaiting independent data requests in route/layout code.
- Importing large libraries through barrel imports in hot paths.
- Shipping admin-only, editor-only, or rarely used UI in the initial client
  bundle.
- Optimizing page speed by weakening auth, validation, audit logging, or data
  scoping.
- Dynamically importing a Server Component and assuming the Server Component
  itself was removed from the server-rendered path.

## validation evidence

- Build output, bundle analyzer, or route performance checks when bundle/load
  size is the task.
- Browser smoke for hydration, loading, error, and responsive states.
- Web Vitals or Lighthouse-style evidence when user-facing performance is the
  acceptance criterion.
- Security denial-path tests when Server Actions, route handlers, or private
  data are involved.

## related

- React performance: [[react-performance.md]]
- Web Vitals: [[web-vitals.md]]
- Frontend data: [[frontend-state-and-data.md]]
- Security baseline: [[../coding/security-baseline.md]]
