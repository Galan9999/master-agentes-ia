#!/usr/bin/env bash
# PostToolUse (Edit|Write): formatea con ruff el .py que Claude acaba de tocar.
# Claude Code pasa por stdin un JSON con tool_input.file_path.
# Si ruff no está instalado en el proyecto (uv add --dev ruff), no hace nada.
set -euo pipefail

file=$(jq -r '.tool_input.file_path // empty')
[[ "$file" == *.py && -f "$file" ]] || exit 0

cd "${CLAUDE_PROJECT_DIR:-.}"
uv run --quiet --no-sync ruff format --quiet "$file" 2>/dev/null || true
