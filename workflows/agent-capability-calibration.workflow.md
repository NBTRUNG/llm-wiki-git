# workflow: agent capability calibration

## purpose

Assign or revise an evidence-backed capability envelope for one frozen
model-plus-harness configuration before it receives autonomous work.

## trigger

- Onboarding a new local, hosted, or frontier agent configuration.
- Changing model/checkpoint, quantization, prompt, harness, tools, schemas,
  context projection, budget, verifier, or permissions.
- A task needs a higher tier than the agent currently holds.
- A policy, boundary, destructive-action, or repeated reliability failure
  requires downgrade and re-evaluation.

## start file

`wiki/knowledge/project-docs/agent_capability_tiers.md`

## source of truth

- Canonical tier meanings and gates: capability-tier guide above.
- Active project capability note: Lead-owned section of
  `agents/<agent>/AGENT.md`.
- Evaluation outcome: project validation/agent-evaluation report.
- Human or integration owner owns tier assignment and upgrades.

## inputs

- Frozen configuration identity.
- Intended domains, task shapes, tools, risk lane, and autonomy.
- Versioned fixtures with deterministic outcome and policy graders.
- Baseline configuration and assigned context projection.

## procedure

1. Freeze and record model, serving, harness, tools, context, and verifier.
2. Select task fixtures matching the proposed tier and domains.
3. Run isolated trials; grade outcome/policy before trajectory/prose.
4. Record the capability vector and separate efficiency/reliability metrics.
5. Find the highest tier whose every mandatory dimension and hard gate passes.
6. Compare with the baseline; record pros, cons, uncertainty, and failure modes.
7. Human/integration owner accepts, lowers, or rejects the proposed tier.
8. Update the Lead-owned capability note and its evidence/expiry pointer.
9. Validate that task packets and context projections cannot exceed the tier.

## forbidden writes

- The evaluated agent must not assign or upgrade its own tier.
- Do not overwrite old evidence; add a new versioned evaluation report.
- Do not change canonical tier definitions to make one agent pass.
- Do not use a public benchmark alone as project release evidence.

## approval gate

Human/integration-owner acceptance is mandatory for a tier upgrade or broader
autonomy. Agents may self-downgrade immediately when uncertainty or failure is
detected.

## evidence

Record configuration, fixtures, trial count, outcome/pass results, policy and
boundary failures, tool errors, human interventions, efficiency distribution,
assigned domain bands, tier decision, and revision trigger.

## canonical details

- `../wiki/knowledge/project-docs/agent_capability_tiers.md`
- `../wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`
- `../harness/task-packet.md`
- `../templates/agent_capability_profile.template.md`

