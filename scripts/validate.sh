#!/usr/bin/env bash
# Validates every skill in skills/: frontmatter, naming, description length,
# file size, README listing, and obvious secrets or private data.
set -euo pipefail

cd "$(dirname "$0")/.."
errors=0
fail() { echo "  ✗ $1"; errors=$((errors + 1)); }

for dir in skills/*/; do
  name=$(basename "$dir")
  file="$dir/SKILL.md"
  echo "• $name"

  if [[ ! -f "$file" ]]; then fail "missing SKILL.md"; continue; fi
  if [[ "$(head -n 1 "$file")" != "---" ]]; then fail "SKILL.md must start with '---' frontmatter"; continue; fi

  front=$(awk 'NR==1{next} /^---$/{exit} {print}' "$file")
  fm_name=$(printf '%s\n' "$front" | sed -n 's/^name:[[:space:]]*//p' | head -n 1)
  fm_desc=$(printf '%s\n' "$front" | sed -n 's/^description:[[:space:]]*//p' | head -n 1)

  [[ -z "$fm_name" ]] && fail "frontmatter has no name"
  [[ "$fm_name" != "$name" ]] && fail "name '$fm_name' must match folder '$name'"
  [[ ! "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] && fail "folder name must be lowercase-with-hyphens"
  (( ${#name} > 64 )) && fail "name longer than 64 characters"

  if [[ -z "$fm_desc" ]]; then
    fail "frontmatter has no description"
  else
    (( ${#fm_desc} > 1024 )) && fail "description is ${#fm_desc} chars (max 1024)"
    (( ${#fm_desc} < 80 )) && fail "description is too short to trigger reliably (${#fm_desc} chars)"
  fi

  lines=$(wc -l < "$file" | tr -d ' ')
  (( lines > 500 )) && fail "SKILL.md is $lines lines (keep under 500; move detail to references/)"

  grep -q "skills/$name" README.md || fail "not listed in README.md"
done

echo "• secrets and private data"
if grep -rnIE '(sk-[A-Za-z0-9]{20,}|[sr]k_live_[A-Za-z0-9]{10,}|AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{36}|xox[baprs]-[A-Za-z0-9-]+|AIza[0-9A-Za-z_-]{35}|-----BEGIN [A-Z ]*PRIVATE KEY)' skills template; then
  fail "possible secret found (see above)"
fi
if grep -rnIE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' skills template | grep -vE '\b(127\.0\.0\.1|0\.0\.0\.0)\b'; then
  fail "IP address found (see above); use example values"
fi

echo
if (( errors > 0 )); then
  echo "✗ $errors problem(s) found"
  exit 1
fi
echo "✓ all skills valid"
