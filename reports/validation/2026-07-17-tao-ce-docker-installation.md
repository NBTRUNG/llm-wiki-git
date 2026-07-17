# TAO CE Docker Installation Checkpoint

Date: 2026-07-17

Task/story: LLMWIKI-091

Scope: Install and smoke-test the official TAO Community Edition Docker
evaluation stack without starting ILIAS or claiming product fit.

## source of truth

- Runtime repo: `/home/admindebian/TAO-CE-Evaluation/`.
- Detailed evidence:
  `/home/admindebian/TAO-CE-Evaluation/reports/validation/2026-07-17-installation.md`.
- Inventory: `/home/admindebian/TAO-CE-Evaluation/runtime-inventory.md`.
- Reusable scenario contract:
  `wiki/concepts/education-platforms/tao-assessment-platform.md`.
- Official installation guide:
  https://www.taotesting.com/community/installation-guide/

## result

| Check | Result | Notes |
| --- | --- | --- |
| Official compose source | passed | Gist revision `eb21e720...`; archive checksum retained. |
| Runtime identity | passed | TAO `2025.10-v1.5-rc`; immutable image digest retained. |
| Stack start | passed | Six containers running; dependency healthchecks pass. |
| Portal smoke | passed | Correct SNI produced `302 /portal/`, then `HTTP/2 200` and `TAO Portal`. |
| LLM-Wiki lint/links | passed | `0 failure(s), 0 warning(s)`; 532 active wikilinks and 679 Markdown links resolved. |
| Browser hostname | waiting human | Local sudo password is required to add `community.tao.internal` to `/etc/hosts`. |
| Credential rotation | waiting human | Change `admin` and `demo01`-`demo05` passwords immediately in the UI. |
| Scenario matrix | pending | TAO-01 through TAO-10 have not been executed. |

## boundary

- The official compose is intentionally retained unchanged even though it uses
  a privileged TAO container, `/sys/fs/cgroup`, known bootstrap credentials,
  disabled Elasticsearch security, and floating tags for three images.
- Pulled digests identify this evaluation snapshot.
- No real learner data, ILIAS runtime, production architecture, integration, or
  product adoption decision was introduced.

## decision

Installation is complete. Human browser access and password rotation are the
next checkpoint, followed by a clean volume snapshot and TAO-01 through TAO-10.
