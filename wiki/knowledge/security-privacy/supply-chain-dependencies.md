---
name: supply-chain-dependencies
description: Supply-chain and dependency review guidance for packages, images, tools, models, plugins, and generated code.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# Supply Chain And Dependencies

Use when adding/upgrading dependencies, images, build tools, MCP servers,
plugins, AI models, generated code, or external services.

## Checks

- Need is justified; no simpler local/repo-native option exists.
- Maintainer/source, license, security posture, and update activity are known.
- Version is pinned or controlled by repo policy.
- Audit/vulnerability scan path is run when available.
- New transitive trust boundary is documented.
- Build/deploy/runtime impact is reviewed.
- Rollback path exists for failed upgrade.

## AI-Specific Supply Chain

Treat models, prompts, MCP servers, skill bundles, tool catalogs, and generated
code as supply-chain inputs. Record owner, source, version/date, permissions,
and review evidence before trusting them.

