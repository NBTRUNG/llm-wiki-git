# decisions

## decision log

| date | id | title | status | source |
| --- | --- | --- | --- | --- |
| 2026-05-17 | ADR-0001 | Use lowercase stable filenames | accepted | `llm-wiki-constitution.md` |
| 2026-05-17 | ADR-0002 | Use selective reading instead of full-wiki loading | accepted | `llm-wiki-constitution.md`, `index.md` |
| 2026-05-17 | ADR-0003 | Use hybrid project phase model | accepted | `llm-wiki-constitution.md` |
| 2026-05-17 | ADR-0004 | Migration is move, not copy | accepted | `llm-wiki-constitution.md` |
| 2026-05-17 | ADR-0005 | Use Karpathy-inspired coding style in global rules | accepted | `global-rules.md`, `raw/andrej-karpathy-skills-main/` |
| 2026-05-17 | ADR-0006 | Split constitution, program, harness, templates | accepted | `llm-wiki-constitution.md`, `program.md`, `harness/`, `templates/` |
| 2026-05-22 | ADR-0007 | Selectively ingest imported LLM-Wiki model and add Knowledge Lookup Metric | accepted | user direction; `LLMWIKI-020`; `llm_wiki_knowledge_lookup_blueprint.md` |
| 2026-07-10 | ADR-0008 | Route agents by evaluated capability envelope and knowledge projection | accepted | user direction; `LLMWIKI-080`; `reports/research/2026-07-10-agent-capability-tier-routing.md` |

---

# ADR-0001 use lowercase stable filenames

Date: 2026-05-17
Project: llm-wiki
Status: accepted
Source: `llm-wiki-constitution.md`

## context

Mixed uppercase/lowercase filenames cause path errors for both humans and AI agents.

## options considered

### option a

Keep existing mixed names.

- Pros: no migration work.
- Cons: higher chance of broken links and inconsistent references.

### option b

Use lowercase stable names going forward.

- Pros: easier paths, fewer mistakes, clearer conventions.
- Cons: requires updating old links.

## decision

Use lowercase stable filenames for new canonical files.

## reason

The system is designed for repeated AI use, and stable lowercase paths reduce avoidable ambiguity.

## consequences

- `Global_rules.md` became `global-rules.md`.
- Historical local logs may be removed once durable validation reports exist.

## review condition

Review if external tools require a different naming convention.

---

# ADR-0002 use selective reading instead of full-wiki loading

Date: 2026-05-17
Project: llm-wiki
Status: accepted
Source: `llm-wiki-constitution.md`, `index.md`

## context

Reading every wiki file on every task wastes tokens, slows work, and can distract AI with irrelevant context.

## decision

AI should read `index.md`, compact core rules, classify the request, then read only relevant files.

## reason

This matches how humans work: find the relevant section and ignore unrelated material.

## consequences

- `index.md` now includes Compact Core Rules.
- Full constitution is required only for governance/source-of-truth/migration/harness/project lifecycle/policy conflict.

## review condition

Review if AI repeatedly misses context due to under-reading.

---

# ADR-0003 use hybrid project phase model

Date: 2026-05-17
Project: llm-wiki
Status: accepted
Source: `llm-wiki-constitution.md`

## context

Projects may begin as ideas before a repo exists, but once code exists, docs should live beside implementation.

## decision

Use LLM-Wiki project folders as source of truth only during pre-repo phase. After a repo exists, project repo docs become source of truth.

## reason

This supports both ideation and real implementation without creating permanent duplicate source-of-truth.

## consequences

- `wiki/projects/<project>/` can be source of truth before repo.
- After repo migration, LLM-Wiki keeps only pointer/compiled view.

## review condition

Review when the first project is migrated into a repo using this rule.

---

# ADR-0004 migration is move, not copy

Date: 2026-05-17
Project: llm-wiki
Status: accepted
Source: `llm-wiki-constitution.md`

## context

Copying pre-repo docs into a repo while leaving originals creates duplicate source-of-truth.

## decision

Migration from LLM-Wiki pre-repo folder to repo must be a move, not a copy. After successful migration, delete old source-of-truth files and leave only pointer `index.md`.

## reason

This prevents AI from updating stale files in the wrong location.

## consequences

- Old project docs must not remain under LLM-Wiki after migration.
- Pointer index must link directly to repo source files.

## review condition

Review if historical archival becomes necessary; any archive must be clearly non-source-of-truth.

---

# ADR-0005 use karpathy-inspired coding style in global rules

Date: 2026-05-17
Project: llm-wiki
Status: accepted
Source: `global-rules.md`, `raw/andrej-karpathy-skills-main/`

## context

AI coding agents commonly make wrong assumptions, overcomplicate code, make broad unrelated edits, and skip verifiable success criteria.

## decision

Adopt Karpathy-inspired principles in `global-rules.md`: think before coding, simplicity first, surgical changes, and goal-driven execution.

## reason

These rules directly reduce common AI coding mistakes.

## consequences

- Global rules now bias toward caution over speed for non-trivial coding work.
- Trivial changes can still use judgment.

## review condition

Review if rules become too heavy for simple work.

---

# ADR-0006 split constitution, program, harness, templates

Date: 2026-05-17
Project: llm-wiki
Status: accepted
Source: `llm-wiki-constitution.md`, `program.md`, `harness/`, `templates/`

## context

One large file cannot efficiently serve all roles. The system needs stable laws, operating procedures, task workflow, and reusable templates.

## decision

Split responsibilities:

- `llm-wiki-constitution.md`: laws and source-of-truth rules.
- `program.md`: ingest/query/lint/compile operations.
- `harness/`: AI/dev work control.
- `templates/`: reusable artifact templates.

## reason

This keeps each layer focused and supports selective reading.

## consequences

- AI reads only the layer relevant to the request.
- The system has more files, but each file has a clearer role.

## review condition

Review if navigation overhead becomes too high.

---

# ADR-0007 selectively ingest imported LLM-Wiki model and add Knowledge Lookup Metric

Date: 2026-05-22
Project: llm-wiki
Status: accepted
Source: user direction; `LLMWIKI-020`; `llm_wiki_knowledge_lookup_blueprint.md`

## context

An imported `llm-wiki/` bundle contains useful coding/security/testing guides, DoD and review checklist material, API scaffold examples, and two SVG flow diagrams.

The imported model is useful, but it is too project/API-specific to replace the current canonical LLM-Wiki model. A separate `llm_wiki_knowledge_lookup_blueprint.md` also defines a useful metric for deciding when agents working in real repos should consult LLM-Wiki.

## decision

Keep the current canonical LLM-Wiki model.

Selectively ingest reusable parts from the imported bundle:

- coding/security/testing guidance into `wiki/knowledge/coding/`;
- DoD/review guidance into `wiki/knowledge/project-docs/`;
- API architecture files as examples/scaffolds only;
- SVG ideas as refreshed diagrams that match the canonical model.

Adopt the Knowledge Lookup Metric as reusable harness/project-doc guidance so active repo agents can score when LLM-Wiki lookup is appropriate.

Also make `harness/read-workflow.md` the canonical operational guide for choosing read path, source of truth, and lookup behavior.

## reason

This preserves the strongest part of the current model: real repos remain source of truth after migration, while LLM-Wiki remains a knowledge/playbook layer. It also reduces unnecessary context loading by giving agents a score-based lookup rule.

## consequences

- `llm-wiki/` and `llm-wiki.zip` are imported/reference sources, not canonical active guidance.
- `LLMWIKI-020` records implementation evidence for this standardization pass.
- Repo templates and agent result reports include a Knowledge Lookup section.
- Imported API-specific material must not become global law.
- The read workflow is now explicit in `harness/read-workflow.md`.
- Imported API scaffold files are represented by cleaned examples under `templates/examples/api-service-scaffold/`.
- Refreshed visual sources live under `wiki/concepts/llm-wiki/`.

## review condition

Review if agents under-consult LLM-Wiki for architecture/history tasks, over-consult it for simple repo tasks, or silently apply stale LLM-Wiki guidance over active repo docs.

---

# ADR-0008 route agents by evaluated capability envelope and knowledge projection

Date: 2026-07-10
Project: llm-wiki
Status: accepted
Source: user direction; `LLMWIKI-080`;
`reports/research/2026-07-10-agent-capability-tier-routing.md`

## context

Agents with different reasoning, context selection, tool use, verification, and
long-horizon reliability can produce very different outcomes from the same
LLM-Wiki. Giving every agent the frontier Map-First/full-pack workflow can
overload lower-capability configurations and silently grant autonomy they have
not demonstrated.

Model provider and parameter count do not solve routing. Capability depends on
the full model, inference, harness, tools, context, and verifier configuration,
and can differ by domain.

## options considered

### option a: one full workflow for all agents

- Pros: smallest projection surface and simplest documentation maintenance.
- Cons: lower agents must solve routing/context/authority problems beyond their
  evidence; failure compounds across long workflows.

### option b: separate wikis per capability level

- Pros: each tier can receive simplified material.
- Cons: duplicates source of truth and multiplies drift, review, and migration.

### option c: one canonical wiki with capability envelopes and projections

- Pros: preserves one source of truth; agents receive bounded context and
  autonomy; mismatch has a deterministic stop/handoff.
- Cons: profiles, evidence, projections, and expiry introduce maintenance and
  calibration cost.

## decision

Select option C.

- Use `C0-C6` as evidence-backed autonomy envelopes.
- Use a capability vector; do not average hard weaknesses into one score.
- Use `P0 Capsule`, `P1 Bounded Packet`, and `P2 Map-First` context projections.
- Unrated/expired configurations default to `C0`.
- Agents may self-downgrade but cannot self-assign or self-upgrade.
- Task packets declare minimum tier, required dimensions, projection, autonomy,
  verifier, reviewer, and fallback owner.
- Human/integration-owner approval is required for upgrades.
- Higher tiers may use lower flows; lower tiers may not use higher flows.

## consequences

- Agent control cards gain a Lead-owned capability envelope.
- Session start performs capability fit before broad reads or tools.
- Coding Pack remains canonical but lower-tier coding requires a validated
  projection that preserves mandatory safety/evidence rules.
- Public benchmark/vendor claims remain orientation, not local authorization.
- Existing repo projections are not automatically backfilled without rollout
  approval; new/renewed packets and templates use the contract going forward.

## review condition

Review after the first same-task cross-tier pilot, any false-eligibility or
projection-drift incident, or a material configuration change.
