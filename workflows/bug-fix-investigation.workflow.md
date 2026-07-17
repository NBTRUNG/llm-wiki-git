# workflow: bug-fix investigation

## purpose

Use this workflow when an agent is asked to investigate or fix a bug, failing
test, build error, deploy error, or runtime symptom.

The goal is to keep debugging localized. Agents should move from a concrete
failure anchor to hypotheses and narrow probes, then escalate only when the
previous scope no longer explains the evidence.

## trigger

- User asks to fix a bug or error.
- A command, test, build, deploy, package, or smoke check fails.
- A previous agent run got stuck in repeated grep/log/tool loops.
- The user asks whether internet search or local investigation should come
  first during bug fixing.

## start file

Use the active work target first:

- real repo bug: `<repo>/AGENTS.md`
- LLM-Wiki workflow/knowledge bug: `index.md`
- Agent Platform runtime/audit bug:
  `/home/admindebian/Agent-Platform/README.md`

For real repo work, this workflow is a narrow companion to
`real-repo-work.workflow.md`; the repo remains source of truth.

## source of truth

- Local repo files for project topology, current implementation, tests, config,
  and ownership.
- Official docs, release notes, and official issue trackers for vendor,
  framework, SDK, cloud, package, or version behavior.
- User, Lead, or integration-owner checkpoint when evidence is weak or the next
  step changes boundaries.

## debugging funnel

1. Anchor the failure:
   - exact command, test, route, request, log slice, screenshot, or user symptom;
   - expected behavior vs actual behavior;
   - reproducible, intermittent, or unknown.
2. Localize before broad search:
   - stack trace frame, failing test, changed file, route/component/config key,
     deployment phase, or bounded log window;
   - recent change when available.
3. State two to four hypotheses in probability order.
4. For each probe, name what it will confirm or rule out.
5. Use the smallest probe that can change the hypothesis list.
6. Escalate scope only with a reason:
   - file -> component -> subsystem -> repo -> dependency/vendor docs ->
     human/Lead checkpoint.
7. Fix only after the surviving hypothesis explains the failure anchor.
8. Verify against the original failure anchor.

## grep and log rule

`rg`, logs, and generated output are probes, not default context gathering.

Use `rg` when the query is a specific symbol, error string, config key, route,
test name, feature flag, migration id, or known contract term. Record what the
query is meant to prove.

Do not use broad grep such as "find anything related to auth/build/deploy" when
there is not yet a hypothesis. First narrow by failure anchor, ownership map,
test path, stack trace, or recent change.

When a grep/log probe returns many candidates, do not read them all. Pick the
smallest slice tied to the current hypothesis or checkpoint with the user.

## internet search rule

Run a bounded source check early when:

- the error string names a vendor tool, SDK, framework, package, cloud service,
  or versioned runtime;
- local commands fail without a clear root cause;
- the behavior may have changed by version;
- official docs, release notes, or official issue trackers likely contain the
  same symptom;
- a second or third local command would only be guessing at vendor behavior.

Bounds:

- two to four targeted queries;
- official docs and release notes first;
- official issue tracker or vendor-maintained repository second;
- community/forum sources only for highly specific symptoms after official
  sources fail.

Internet search does not override local source of truth. It explains external
behavior; local files still decide whether that behavior applies here.

## escalation checkpoints

Stop and ask the user, Lead, or integration owner when:

- two probes fail without producing new information;
- the current hypothesis cannot be stated in one sentence;
- the next step requires broad grep, broad logs, production access, credentials,
  real user data, or repeated expensive validation;
- internet evidence and local evidence disagree;
- the fix may change architecture, data contracts, deployment, permissions,
  source-of-truth boundaries, or workflow rules;
- context is polluted by broad output and the agent cannot separate live
  evidence from noise.

Checkpoint format:

```text
Failure anchor:
Current scope:
Evidence found:
Hypotheses ruled out:
Current hypothesis:
Next 1-2 probes:
Why escalation is needed:
Where I am uncertain:
Approval needed:
```

## context hygiene

If a debugging session has accumulated noisy grep/log output, summarize the
live evidence before continuing:

- facts still tied to the failure anchor;
- hypotheses ruled out;
- current highest-probability hypothesis;
- discarded output and why it is no longer relevant;
- next probe and its expected decision value.

If the summary cannot be made cleanly, checkpoint instead of continuing.

## allowed writes

- Code, tests, docs, and repo status files allowed by the active work target.
- LLM-Wiki workflow/knowledge files only when the task is LLM-Wiki governance or
  an approved file-back.
- Validation report or agent result report required by the active workflow.

## evidence before done

- Original failure anchor.
- Hypothesis that explained the fix.
- Files changed.
- Verification command or probe tied to the original failure.
- Remaining uncertainty or follow-up, if any.

## source notes

This workflow is based on:

- Google SRE effective troubleshooting: hypothesis-driven diagnosis, simplify
  and reduce, divide and conquer, bisection, recent-change checks, and explicit
  negative results.
- Anthropic Claude Code guidance: avoid context pollution from broad codebase
  exploration; use scoped investigation and subagents when large reads are
  unavoidable.
- GitHub Copilot cloud agent constraints: research, plan, branch changes, and
  bounded task/session scope.
- PROBE research: failed-run telemetry should become structured evidence,
  structured diagnosis, and bounded recovery guidance.

## related

- [real-repo-work.workflow.md](real-repo-work.workflow.md)
- [knowledge-refresh.workflow.md](knowledge-refresh.workflow.md)
- [../wiki/knowledge/agent-errors/internet-search-and-token-budget.md](../wiki/knowledge/agent-errors/internet-search-and-token-budget.md)
- [../wiki/knowledge/operations/deployment-diagnostics.md](../wiki/knowledge/operations/deployment-diagnostics.md)
