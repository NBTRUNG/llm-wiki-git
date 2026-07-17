---
name: networking-edge
description: Networking, DNS, TLS, reverse proxy, load balancing, firewall, CORS, CDN, and public edge guidance.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://cloud.google.com/load-balancing/docs/choosing-load-balancer
  - https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/load-balancing-overview
confidence: medium
confidence_reviewed: 2026-07-04
---

# Networking And Edge

Use when work changes public routes, DNS, TLS, reverse proxy, load balancer,
firewall, CDN, CORS, webhooks, or service-to-service connectivity.

## Checks

- Public entrypoints and private-only services are named.
- TLS/certificate ownership and renewal path are known.
- Load balancer traffic type, scope, health check, drain behavior, and backend
  target type are known when traffic is distributed across instances or regions.
- Reverse proxy headers, forwarded protocol/host, and body size limits are set.
- CORS is scoped to real origins and methods.
- Firewall/security group rules are least-privilege.
- Webhook/callback endpoints validate authenticity and replay risk.
- Logs include request/correlation IDs without leaking secrets.

## Anti-Patterns

- Broad CORS to make frontend work.
- Opening database/admin ports publicly.
- Treating DNS propagation as deployment proof.
- Changing proxy headers without route/auth smoke tests.
- Choosing a load balancer by vendor default instead of traffic type, public vs
  private entry, regional/global scope, backend type, and state/failover needs.
