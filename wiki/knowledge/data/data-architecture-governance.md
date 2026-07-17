---
name: data-architecture-governance
description: Data ownership, governance, data mesh, lake/lakehouse, and source-of-truth guidance.
date_ingested: 2026-06-29
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://martinfowler.com/articles/data-monolith-to-mesh.html
  - https://docs.aws.amazon.com/wellarchitected/latest/analytics-lens/welcome.html
confidence: medium
confidence_reviewed: 2026-06-29
---

# data architecture governance

Use this guide when deciding who owns data, whether to centralize or federate
data, how to expose analytical datasets, or how to prevent database sprawl.

## ownership rules

Every important data set needs:

- business owner;
- technical owner;
- source of truth;
- allowed writers;
- consumers;
- contract/change policy;
- quality checks;
- retention and deletion policy;
- access/audit policy.

## source-of-truth levels

| Level | Meaning |
| --- | --- |
| System of record | Authoritative transactional source. |
| Operational read model | Derived/cached model used by product workflows. |
| Analytics dataset | Derived facts for analysis/reporting. |
| Search index | Derived retrieval/ranking store. |
| Export/import file | Boundary artifact, not automatically authoritative. |

Do not let agents treat derived stores as source of truth unless the project
explicitly says so.

## central platform vs domain ownership

| Pattern | Fit | Risk |
| --- | --- | --- |
| Central database team | Small/medium orgs, strong consistency, shared app | bottleneck, domain knowledge gap |
| Domain-owned data products | many domains/teams, analytics consumers | inconsistent governance if platform standards are weak |
| Central platform + domain ownership | larger orgs needing scale and consistency | requires clear standards and tooling |

Data mesh ideas are useful when domains own analytical data products and the
platform provides shared governance, discovery, quality, and access controls.
Do not use data mesh language to justify undocumented datasets.

## data product minimum

For an analytical data product:

```text
Name:
Owner:
Source systems:
Consumers:
Schema/version:
Freshness/SLO:
Quality checks:
Access classification:
Lineage:
Retention:
Backfill/replay process:
Deprecation policy:
```

## lake / warehouse / lakehouse

| Store | Use | Avoid |
| --- | --- | --- |
| Data warehouse | curated analytics, BI, governed SQL | raw ungoverned file dumping |
| Data lake | cheap raw/semistructured landing, ML, archive | direct business reporting without quality layer |
| Lakehouse | mixed lake flexibility with table formats/governance | treating it as a free replacement for operational DB |

## governance checklist

- [ ] Source of truth named.
- [ ] Owner and allowed writers named.
- [ ] Consumer contracts documented.
- [ ] Quality checks and freshness expectations defined.
- [ ] Sensitive data classification defined.
- [ ] Lineage/backfill/replay known.
- [ ] Deprecation and compatibility process exists.

## anti-patterns

- Shared database as hidden integration bus.
- "Data lake" used as a dumping ground without quality/lineage.
- Data product without owner or freshness SLO.
- Dashboard metrics built from undefined business terms.
- Service split where old modules still write each other's tables.
