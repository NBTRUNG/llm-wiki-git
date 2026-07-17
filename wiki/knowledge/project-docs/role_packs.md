---
name: role-packs
description: Guidance for composing skills, knowledge packs, domain packs, and formal knowledge into role-based agents.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-10
---

# role packs

## purpose

Use role packs when an agent must combine delivery capability with domain or
formal knowledge to solve a real business problem.

Skills define how the agent works. Knowledge packs define what the agent should
know. Role packs define which combination applies to a specific professional
role and what the agent is allowed to conclude.

```text
Skill = workflow / procedure
Knowledge Pack = reusable knowledge
Role Pack = composed role: required packs + domain boundaries + freshness rules
Project docs = source of truth for the active project
```

A role pack does not grant capability or autonomy. Before applying a role, use
[agent_capability_tiers.md](agent_capability_tiers.md) to verify that the frozen
agent configuration meets the task dimensions and receives the appropriate
`P0`, `P1`, or `P2` projection. A domain role may narrow authority; it cannot
raise the agent's assigned tier.

## when to create a role pack

Create a role pack when the same type of work will recur across projects and
requires a stable combination of:

- engineering/delivery packs;
- domain or society knowledge;
- security/privacy/data constraints;
- formal or analytical knowledge;
- current-source verification rules;
- human expert escalation boundaries.

Examples:

- customs technology agent;
- tax technology agent;
- education platform agent;
- healthcare workflow agent;
- data migration agent;
- CMS content agent;
- AI/RAG product agent.

Do not create a role pack for a one-off task. Use the existing session packs
and task-specific required reads instead.

## role pack shape

```md
# <Role Name>

## purpose

## use when

## required packs

## optional packs

## domain boundaries

## source and freshness rules

## human expert escalation

## output expectations

## anti-patterns
```

## composition rules

Every role pack should name:

- base delivery pack: usually Repo Base, Coding, Data, Contracts, Operations,
  or Architecture;
- domain pack: customs, tax, logistics, education, healthcare, finance, CMS,
  or another business domain;
- risk packs: Security Deep + Privacy, Reliability/SRE, Platform, AI/RAG/MCP,
  or Content/CMS/SEO/i18n when triggered;
- formal packs: math, statistics, algorithms, optimization, economics, or other
  analytical knowledge when the role depends on reasoning/proofs/calculation;
- freshness rules: which claims require current official source checks;
- escalation: when to ask a human expert, lawyer, accountant, security owner,
  compliance owner, or domain owner.

## domain knowledge boundary

Domain packs such as customs, tax, legal, compliance, healthcare, or finance
are high-risk. LLM-Wiki may store reusable workflow knowledge, checklists,
terminology, source routes, data shapes, and common risk patterns. It should
not be treated as final legal, tax, medical, or regulatory advice.

For volatile or high-stakes domain facts, require current official-source
verification before advice or implementation:

```text
law / regulation / tax rate / tariff / filing deadline / compliance threshold
  -> check official source
  -> record date/source
  -> state assumptions
  -> escalate if decision is material
```

## example: customs technology agent

```md
# Customs Technology Agent

## purpose

Design, review, or implement software workflows for import/export, customs
declarations, trade documents, tariff classification, valuation, origin, and
compliance support.

## required packs

- Repo Base Pack
- Coding Pack when code is changed
- Data Knowledge Pack for declarations, documents, product master data, HS
  codes, valuation, origin, and audit records
- Contracts Pack for integrations with customs portals, ERP, logistics, or
  document services
- Security Deep + Privacy Pack for company, shipment, financial, or personal
  data
- Customs Domain Pack when it exists

## optional packs

- AI / Agent / RAG / MCP Pack for document extraction, classification support,
  or agent-assisted filing workflows
- Platform / Infrastructure Pack for deployment and integration environments
- Reliability / SRE Pack for submission, callback, retry, and audit workflows
- Formal/Analytical Pack for tariff calculations, classification scoring,
  anomaly detection, or optimization

## domain boundaries

- Do not provide final legal/customs conclusions without current official
  source verification.
- Do not confidently select HS code from incomplete goods information.
- Separate software validation rules from regulatory decision authority.

## output expectations

- State assumptions.
- Split confirmed facts, source-required facts, and questions for human/domain
  expert.
- Provide data/checklist impact for the software system.
- Record official-source checks and review date.
```

## math and formal knowledge

Mathematics is a companion discipline for coding and algorithm work. Load it
when the problem needs formal reasoning, proof, modeling, measurement, or fair
comparison; seniority does not remove those obligations.

Math/formal knowledge helps agents with:

- choosing algorithms and data structures;
- proving correctness or invariants;
- estimating complexity and capacity;
- probability, statistics, experiments, and evaluation;
- optimization, scheduling, routing, allocation, and constraints;
- numerical precision and error analysis;
- functions, finite differences/derivatives, rates of change, sensitivity, and
  accumulation;
- baseline design, measurement uncertainty, repeated benchmarks, and fair
  efficiency comparisons;
- data science, ranking, recommendations, fraud/anomaly detection, and RAG
  evaluation;
- financial/tax/customs calculations where formulas and rounding rules matter.

Canonical pack:

```text
wiki/knowledge/math/
  README.md
  classical-mathematical-thinking.md
  proof-techniques.md
  functions-rates-and-measurement.md
  discrete-math.md
  probability-statistics.md
  linear-algebra.md
  optimization.md
  numerical-methods.md
  domain-calculations.md
```

Keep `wiki/knowledge/algorithms/` focused on implementation choices, libraries,
complexity, and proof evidence. Use `wiki/knowledge/math/` for concepts,
formulas, assumptions, and reasoning patterns that support algorithms, data,
AI/RAG evaluation, numerical precision, optimization, statistics, and domain
calculations.

## anti-patterns

- Creating a new role for every task instead of reusing session packs.
- Letting a role pack override active repo source-of-truth docs.
- Mixing high-risk domain advice with implementation guidance without
  source/freshness boundaries.
- Loading domain or math packs "just in case" when the task does not need them.
- Treating a role pack as proof that the agent is a licensed professional or
  final decision authority.
