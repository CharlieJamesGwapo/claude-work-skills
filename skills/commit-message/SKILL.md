---
name: commit-message
description: Write a clear Conventional Commits message from the staged changes (or a described change), and split work into sensible commits when a diff mixes unrelated changes. Use when the user says "commit this", "write a commit message", "what should the commit say", "fix my commit message", "squash message", "make this a conventional commit", or asks to clean up commit history before a PR. Reads the actual diff; never invents what changed. For pull request descriptions, use pr-description instead.
license: MIT
---

# Commit Message

Writes the commit message a careful reviewer would want to read six months
from now: what changed and *why*, in the project's own style. The usual
failure is describing the mechanism ("update utils.ts") instead of the intent
("fix double-charging when a payment retries").

## Inputs

1. **The diff.** `git diff --staged`. If nothing is staged, use `git diff`
   and say you're describing unstaged changes (don't stage files unless the
   user asked you to commit).
2. **The house style.** `git log --oneline -20`. If the repo already uses a
   style (Conventional Commits, gitmoji, ticket prefixes like `ABC-123:`),
   match it. Otherwise use Conventional Commits.
3. **The why.** From the conversation, the branch name, or an issue the user
   mentioned. If the reason isn't knowable, keep the body to *what*; never
   invent a motivation.

## Format (Conventional Commits)

```
<type>(<optional scope>): <summary>

<body: why this change, what it does at a high level, anything surprising>

<footer: BREAKING CHANGE: ..., Closes #123, Co-authored-by: ...>
```

- **type:** `feat` (new behaviour), `fix` (bug fix), `refactor` (no behaviour
  change), `perf`, `docs`, `test`, `build`, `ci`, `chore`, `style`, `revert`.
- **scope:** the area touched, as the codebase names it (`auth`, `checkout`,
  `api`). Omit if it spans everything.
- **summary:** imperative mood ("add", not "added"/"adds"), lowercase start,
  no trailing period, **≤ 72 characters** (aim for ~50). Say the outcome.
- **body:** wrap at 72. Explain why and any trade-off. Skip it for trivial
  changes (typo, version bump).
- **breaking changes:** `!` after the type (`feat(api)!: ...`) **and** a
  `BREAKING CHANGE:` footer saying what callers must do.

## Rules

- **Describe the diff you see.** Every claim in the message must be visible
  in the diff. Don't say "add tests" if no tests changed.
- **One logical change per commit.** If the diff mixes a bug fix, a refactor
  and a formatting sweep, propose a split and the `git add -p` / file groups
  for each, with a message per commit. Ask before splitting if the user said
  "commit this".
- **No noise:** no "WIP", "misc fixes", "update files", file lists, or emoji
  unless the repo uses them.
- **Never include secrets** you spot in the diff. If the diff contains an API
  key, `.env` file or credentials, stop and warn the user before committing.
- **Attribution lines** (e.g. `Co-authored-by:`) go in the footer, after a
  blank line, only when they apply.

## Output

Show the message in a fenced block, ready to use. When committing for the user,
pass it with a heredoc so newlines survive:

```bash
git commit -F - <<'EOF'
fix(checkout): stop double-charging when a payment retries

The retry handler created a new charge instead of reusing the
idempotency key from the first attempt, so slow card networks
could charge twice. Reuse the original key on retry.

Closes #418
EOF
```

## Examples

**Good:**

```
feat(dashboard): show revenue by sales rep for the selected month
```

```
refactor(api): move lead validation into a shared schema

Both the webhook and the manual-entry form validated leads with
slightly different rules, which let malformed phone numbers in
through the form. One schema now serves both.
```

**Bad** (and why):

- `updated stuff` - says nothing.
- `fix: Fixed the bug in utils.ts where the function was returning the wrong value.` -
  past tense, mechanism not outcome, trailing period, too long.
- `feat: add login, fix typo in footer, bump deps` - three commits in one.
