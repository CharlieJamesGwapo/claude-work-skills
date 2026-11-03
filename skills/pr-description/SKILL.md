---
name: pr-description
description: Write a pull request title and description that gets reviewed fast - what changed, why, how it was tested, what to look at, and risks - from the branch's actual commits and diff. Use when the user says "write the PR description", "open a PR", "PR body", "describe this branch", "what should the PR say", "make this PR reviewable", or asks to update a PR description after new commits. Follows the repo's PR template if one exists. For single commit messages use commit-message; for customer-facing notes use release-notes.
license: MIT
---

# PR Description

Produces a PR a busy reviewer can understand in one minute and review with
confidence. The usual failures: restating the diff file-by-file, hiding the
risky part, and claiming testing that didn't happen.

## Inputs

1. **Base branch:** the repo's default (`gh repo view --json defaultBranchRef -q .defaultBranchRef.name`, or `main`).
2. **What changed:** `git log --oneline <base>..HEAD` and
   `git diff <base>...HEAD --stat`, then read the diff itself for the parts
   that matter.
3. **Template:** look for `.github/PULL_REQUEST_TEMPLATE.md` (or
   `.github/PULL_REQUEST_TEMPLATE/*.md`, `docs/pull_request_template.md`). If
   found, fill **its** sections in its order and keep its checkboxes, ticking
   only what's true.
4. **Why:** from the conversation, linked issue, or branch name. If unknown,
   ask once or leave a clear `TODO: why` for the user. Don't invent it.
5. **Testing that actually happened:** commands run in this session and their
   results, tests added in the diff. Never claim "tested locally" on faith.

## Title

- Under ~70 characters, says the outcome: `Add revenue-by-rep chart to sales
  dashboard`, not `Dashboard changes`.
- Match the repo's convention (Conventional Commits prefix, ticket key) if
  recent PRs use one: `gh pr list --state merged --limit 10`.

## Body (when there's no template)

```markdown
## Summary
One to three sentences: what this does and why it's needed. Link the issue
(`Closes #123`).

## Changes
- The meaningful changes, grouped by behaviour, not by file.
- Call out anything deleted or renamed.

## How to test
1. Exact steps or commands a reviewer can run.
2. What they should see.

## Screenshots
Before / after for any UI change. (Leave a placeholder if you can't capture
them, and tell the user.)

## Risks and rollout
Migrations, config or env changes, breaking API changes, feature flags,
performance concerns, what to watch after merge. Write "None known" only if
you checked.

## Reviewer notes
Where to start reading, and anything you want a second opinion on.
```

## Rules

- **Lead with the why.** Reviewers judge the approach by the problem.
- **Group by behaviour, not file.** "Leads are now de-duplicated by email" beats
  "changed leads.ts, schema.ts, route.ts".
- **Surface the risky part.** Migrations, auth, money, data deletion and
  public API changes go in Risks even if they're small in the diff.
- **Be honest about testing.** List what was run. If nothing was, say "Not
  tested yet" and suggest how.
- **Big PR?** If the diff is over ~500 changed lines across unrelated areas,
  suggest how to split it before writing the description.
- **No secrets, internal hostnames or customer data** in the description or
  screenshots.
- **Updating an existing PR:** read the current body (`gh pr view --json body`),
  keep what's still true, update the rest. Don't wipe the author's notes.

## Opening the PR

When the user asks you to open it, push the branch and pass the body with a
heredoc so formatting survives:

```bash
gh pr create --title "Add revenue-by-rep chart to sales dashboard" --body "$(cat <<'EOF'
## Summary
...
EOF
)"
```

Return the PR URL. Open as draft (`--draft`) if work is unfinished.

## Example

**Good title and summary:**

> **Stop duplicate leads from Facebook lead ads**
>
> ## Summary
> The same Facebook lead was being created up to three times when Meta
> retried the webhook. Leads are now de-duplicated by the Meta lead ID, and
> retries return 200 without creating anything. Closes #212.

**Bad:**

> **Updates**
>
> Changed some files in the leads module and added a migration. Tested.
