#!/usr/bin/env bash
set -u

ROOT="${1:-}"

if [ -z "$ROOT" ]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
fi

failures=0
warnings=0

fail() {
  printf 'FAIL: %s\n' "$1"
  failures=$((failures + 1))
}

warn() {
  printf 'WARN: %s\n' "$1"
  warnings=$((warnings + 1))
}

pass() {
  printf 'PASS: %s\n' "$1"
}

active_markdown_files() {
  find "$ROOT" \
    -path "$ROOT/.git" -prune -o \
    -path "$ROOT/.obsidian" -prune -o \
    -path "$ROOT/raw" -prune -o \
    -path "$ROOT/agent-platform/raw" -prune -o \
    -path "$ROOT/archive" -prune -o \
    -path "$ROOT/logs" -prune -o \
    -type f -name '*.md' -print0 |
  while IFS= read -r -d '' file; do
    rel="${file#$ROOT/}"
    case "$rel" in
      reports/validation/*.md)
        if [ "$rel" != "reports/validation/README.md" ]; then
          continue
        fi
        ;;
    esac
    printf '%s\0' "$file"
  done
}

trim() {
  printf '%s' "$1" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

resolve_local_target() {
  source_rel="$1"
  target="$2"

  target="${target%%|*}"
  target="${target%%#*}"
  target="${target#<}"
  target="${target%>}"
  target="$(trim "$target")"

  if [ -z "$target" ]; then
    return 0
  fi

  case "$target" in
    \#*|http:*|https:*|mailto:*|data:*|od:*)
      return 0
      ;;
  esac

  case "$target" in
    /home/admindebian/LLM-Wiki/*)
      candidates="$target"
      ;;
    /*)
      candidates="$ROOT/${target#/}"
      ;;
    *)
      source_dir="$(dirname "$source_rel")"
      candidates="$ROOT/$source_dir/$target $ROOT/$target"
      ;;
  esac

  for candidate in $candidates; do
    if [ -e "$candidate" ] || [ -e "$candidate.md" ] || [ -e "$candidate/README.md" ]; then
      return 0
    fi
  done

  return 1
}

check_wikilinks() {
  checked=0
  missing=0

  while IFS= read -r -d '' file; do
    rel="${file#$ROOT/}"
    while IFS= read -r link; do
      checked=$((checked + 1))
      if ! resolve_local_target "$rel" "$link"; then
        printf 'FAIL: broken wiki link in %s -> [[%s]]\n' "$rel" "$link"
        missing=$((missing + 1))
      fi
    done < <(perl -ne 'while (/\[\[([^\]]+)\]\]/g) { print "$1\n" }' "$file")
  done < <(active_markdown_files)

  if [ "$missing" -eq 0 ]; then
    pass "wiki links resolve in active markdown files ($checked checked)"
  else
    failures=$((failures + missing))
  fi
}

check_markdown_links() {
  checked=0
  missing=0

  while IFS= read -r -d '' file; do
    rel="${file#$ROOT/}"
    while IFS= read -r link; do
      checked=$((checked + 1))
      if ! resolve_local_target "$rel" "$link"; then
        printf 'FAIL: broken markdown link in %s -> %s\n' "$rel" "$link"
        missing=$((missing + 1))
      fi
    done < <(perl -ne 'while (/\[[^\]]+\]\(([^)]+)\)/g) { print "$1\n" }' "$file")
  done < <(active_markdown_files)

  if [ "$missing" -eq 0 ]; then
    pass "markdown links resolve in active markdown files ($checked checked)"
  else
    failures=$((failures + missing))
  fi
}

check_compile_entrypoints() {
  require_file "index.md"
  require_file "wiki/index.md"
  require_file "harness/README.md"
  require_file "harness/graph-hygiene.md"
  require_file "templates/README.md"
  require_file "wiki/knowledge/README.md"
  require_file "reports/validation/README.md"

  require_grep "index.md" "harness/read-workflow.md" "root index points to read workflow"
  require_grep "index.md" "harness/graph-hygiene.md" "root index points to graph hygiene"
  require_grep "index.md" "research/watchlist.md" "root index points to research watchlist"
  require_grep "wiki/index.md" "^## known gaps" "compiled wiki index has known gaps section"
  require_grep "reports/validation/README.md" "## index (most recent first)" "validation catalog has index section"
}

require_file() {
  if [ -f "$ROOT/$1" ]; then
    pass "$1 exists"
  else
    fail "$1 is missing"
  fi
}

require_grep() {
  file="$1"
  pattern="$2"
  label="$3"

  if [ ! -f "$ROOT/$file" ]; then
    fail "$file missing for check: $label"
    return
  fi

  if grep -q "$pattern" "$ROOT/$file"; then
    pass "$label"
  else
    fail "$label"
  fi
}

printf 'Feedback-loop lint root: %s\n\n' "$ROOT"

require_file "harness/feedback-loop.md"
require_file "wiki/projects/llm-wiki/docs/feedback_loop_queue.md"
require_file "templates/agent_result_report.template.md"
require_file "templates/lwoe_session_measurement.template.md"
require_file "templates/agents.template.md"
require_file "templates/lead_state.template.md"
require_file "templates/agent_tasks_archive.template.md"
require_file "templates/integration_merge_plan.template.md"
require_file "wiki/knowledge/coding/agent-coding-workflow.md"
require_file "wiki/knowledge/project-docs/agent_capability_tiers.md"
require_file "workflows/agent-capability-calibration.workflow.md"
require_file "templates/agent_capability_profile.template.md"
require_file "templates/human_workflow.template.md"
require_file "wiki/knowledge/project-docs/human_workflow.md"

check_compile_entrypoints

require_grep "harness/feedback-loop.md" "^## deferred candidate queue" "feedback-loop has deferred queue procedure"
require_grep "harness/README.md" "graph-hygiene.md" "harness README links graph hygiene"
require_grep "harness/README.md" "research-intake-loop.md" "harness README links research intake loop"
require_grep "wiki/knowledge/README.md" "project-docs/project_orientation.md" "knowledge README links project orientation"
require_grep "wiki/knowledge/README.md" "coding/agent-coding-workflow.md" "knowledge README links agent coding workflow"
require_grep "wiki/knowledge/README.md" "coding/output-quality.md" "knowledge README links output quality"
require_grep "wiki/knowledge/coding/README.md" "agent-coding-workflow.md" "coding README links agent coding workflow"
require_grep "wiki/knowledge/coding/README.md" "output-quality.md" "coding README links output quality"
require_grep "reports/validation/README.md" "2026-06-20-project-orientation-research-loop.md" "validation catalog links latest orientation report"
require_grep "templates/agent_result_report.template.md" "^## Knowledge lookup" "agent result report has Knowledge lookup section"
require_grep "templates/agent_result_report.template.md" "^## Coding Pack loaded" "agent result report records Coding Pack loading"
require_grep "templates/agent_result_report.template.md" "^## Measurement fields" "agent result report has LWOE measurement fields"
require_grep "templates/agent_result_report.template.md" "^## Recommendations and mathematical trade-offs" "agent result report has recommendation trade-off fields"
require_grep "templates/agent_result_report.template.md" "^## Capability fit" "agent result report records capability fit"
require_grep "global-rules.md" "Every substantive suggestion or recommendation" "global rules require recommendation trade-offs"
require_grep "global-rules.md" "must never assign or upgrade their own tier" "global rules forbid agent self-upgrade"
require_grep "wiki/knowledge/project-docs/agent_capability_tiers.md" "^## core law" "capability guide defines core law"
require_grep "wiki/knowledge/project-docs/agent_capability_tiers.md" "Unrated or expired configuration = C0" "capability guide defaults unrated agents to C0"
require_grep "wiki/knowledge/project-docs/agent_capability_tiers.md" "agents must not select a higher projection" "capability guide blocks higher projections"
require_grep "wiki/knowledge/math/README.md" "^## recommendation trade-off rule" "Math Pack defines recommendation trade-off rule"
require_grep "wiki/projects/llm-wiki/docs/source_of_truth_rules.md" "Local .*raw/.* legacy" "source-of-truth rules classify local raw as legacy"
require_grep "templates/lwoe_session_measurement.template.md" "source reports:" "LWOE template records source reports"
require_grep "templates/agents.template.md" "Bootstrap cheatsheets" "AGENTS template has bootstrap cheatsheets"
require_grep "templates/agents.template.md" "^## Capability gate" "AGENTS template has capability gate"
require_grep "templates/agents.template.md" "HUMAN.md" "AGENTS template maintains human operator entrypoint"
require_grep "harness/project-bootstrap.md" "^### human operator core" "project bootstrap creates human operator core"
require_grep "harness/project-bootstrap.md" "human_workflow.template.md" "project bootstrap uses human workflow template"
require_grep "wiki/knowledge/project-docs/human_workflow.md" "^## minimum content" "human workflow guide defines minimum content"
require_grep "templates/human_workflow.template.md" "^## Dữ liệu bền vững" "human workflow template maps persistent data"
require_grep "templates/lead_state.template.md" "Current Lead:" "Lead state template has current Lead field"
require_grep "templates/agent_role_card.template.md" "^## current assignment" "agent control card template has current assignment"
require_grep "templates/agent_role_card.template.md" "^## capability envelope" "agent control card has Lead-owned capability envelope"
require_grep "templates/agent_role_card.template.md" "^## current checkpoint" "agent control card template has current checkpoint"
require_grep "templates/repo_rules.template.md" "^## Coding Pack Rule" "repo rules template has Coding Pack rule"
require_grep "templates/integration_merge_plan.template.md" "^## source proposals" "integration merge plan template has source proposals"
require_grep "harness/task-packet.md" "^### Shared-file write delegation" "task packet has shared-file write delegation"
require_grep "harness/task-packet.md" "^### Capability gate" "task packet has capability gate"
require_grep "workflows/catalog.md" "Agent Capability Calibration" "workflow catalog routes capability calibration"
require_grep "wiki/knowledge/coding/agent-coding-workflow.md" "P0/P1" "coding workflow supports validated lower-tier projections"
require_grep "harness/project-workflow.md" "reports/integration/<task-id>-merge-plan.md" "project workflow references integration merge plan"
require_grep "templates/agent_tasks.template.md" "^## Current assignment" "agent tasks template has current assignment card"
require_grep "templates/agent_status.template.md" "^## Current state card" "agent status template has current state card"
require_grep "templates/agent_tasks_archive.template.md" "^## Index" "agent tasks archive template has index"

missing_confidence=0
while IFS= read -r file; do
  if grep -q '^confidence:' "$file" && ! grep -q '^confidence_reviewed:' "$file"; then
    printf 'FAIL: confidence without confidence_reviewed: %s\n' "${file#$ROOT/}"
    missing_confidence=$((missing_confidence + 1))
  fi
done < <(find "$ROOT/wiki/knowledge" "$ROOT/wiki/concepts" -type f -name '*.md' 2>/dev/null)

if [ "$missing_confidence" -eq 0 ]; then
  pass "all confidence-tagged knowledge/concept files have confidence_reviewed"
else
  failures=$((failures + missing_confidence))
fi

raw_count="$(find "$ROOT/raw/decisions" "$ROOT/raw/projects" "$ROOT/raw/research" "$ROOT/raw/vendors" -type f ! -name 'README.md' 2>/dev/null | wc -l | tr -d ' ')"
if [ "${raw_count:-0}" -gt 0 ]; then
  warn "raw holding areas contain $raw_count file(s); review queue/evidence gate before filing"
else
  pass "raw holding areas have no pending files"
fi

recent_count="$(awk '/^Recently filled/{flag=1; next} /^## /{flag=0} flag && /^- /{count++} END{print count+0}' "$ROOT/wiki/index.md" 2>/dev/null)"
if [ "${recent_count:-0}" -gt 3 ]; then
  warn "wiki/index.md Recently filled has $recent_count entries; rotate stale entries during feedback-loop session"
else
  pass "known-gaps Recently filled count is bounded (${recent_count:-0})"
fi

check_wikilinks
check_markdown_links

printf '\nSummary: %s failure(s), %s warning(s)\n' "$failures" "$warnings"

if [ "$failures" -gt 0 ]; then
  exit 1
fi
