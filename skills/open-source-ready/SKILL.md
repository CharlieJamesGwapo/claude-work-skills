---
name: open-source-ready
description: Check a repository is safe and ready to make public, then add what an open-source project needs - scan for leaked secrets, private data and internal references (including git history), and add README, LICENSE, CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, issue and PR templates, CI and a GitHub Sponsors FUNDING.yml. Use when the user says "open source this", "make this repo public", "is it safe to publish", "prepare for open source", "check for secrets before I push", "add a license", "set up contributions", or "add a sponsor button". Reports findings first and never flips a repo public without explicit approval.
license: MIT
---

# Open Source Ready

Gets a repo from "works on my machine" to "safe to make public and easy to
contribute to". The failure that matters most is irreversible: once a secret,
customer record or employer's internal detail is public, it's been cloned and
indexed. Deleting it later doesn't undo that. So the check comes first, and
nothing goes public without the user's explicit yes.

## Phase 1: Safety scan (report, don't fix yet)

Scan the **working tree and the full git history**. A secret deleted in a later
commit is still public in history.

### Secrets
- If installed, run a scanner: `gitleaks detect --source . -v` (includes
  history) or `trufflehog git file://. --only-verified`. Otherwise grep:
  ```bash
  git grep -nIE '(api[_-]?key|secret|token|passw(or)?d|bearer|private[_-]?key|client[_-]?secret)\s*[:=]' $(git rev-list --all) -- . ':!*.lock' | head -50
  git grep -nIE '(sk-[A-Za-z0-9]{20,}|sk_live_|rk_live_|AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{36}|xox[baprs]-|AIza[0-9A-Za-z_-]{35}|-----BEGIN [A-Z ]*PRIVATE KEY)' $(git rev-list --all) | head -50
  ```
- Committed env and credential files, ever:
  `git log --all --diff-filter=A --name-only --format= | grep -iE '(^|/)\.env|credentials|service-account|\.pem$|\.p12$|id_rsa|google-services\.json' | sort -u`

### Private and internal information
- Personal data: emails, phone numbers, addresses, customer names in code,
  fixtures, seeds, test data, screenshots, logs.
- Internal references: company/client names, internal hostnames and IPs,
  internal URLs, dashboard or workflow IDs, Slack channels, ticket links.
- Employer or client ownership: if the code was written for an employer or
  client, **the user may not own it**. Flag this and ask; don't proceed past
  phase 1 until they confirm they have the right to publish.
- Large binaries, database dumps, `.DS_Store`, build output, `node_modules`.

### Report
Show a table: **finding, file:line or commit, severity (must fix / should fix
/ check), suggested fix**. Then stop for the user's go-ahead.

## Phase 2: Fix

- **Leaked secret:** tell the user to **rotate it first** (revoke and reissue
  at the provider). Removing it from git doesn't make it safe; assume it's
  compromised. Then remove it from the tree and move it to env vars, and add
  the file pattern to `.gitignore`.
- **Secrets or private data in history:** the simplest safe path for a repo
  going public for the first time is a **fresh history**: create a new repo
  from the cleaned current tree (`git checkout --orphan public && git add -A
  && git commit`). Otherwise use `git filter-repo` - and explain it rewrites
  history and needs a force push. Get explicit approval before either.
- **Internal references:** generalise (fictional names like Acme, example.com,
  `0400 000 000`) rather than delete, so examples still teach.
- Add a `.env.example` with variable names and no values.

## Phase 3: Make it contributable

Add only what's missing; keep what exists. Match the project's tone.

| File | Contents |
|---|---|
| `README.md` | What it is (one line), why, screenshot/GIF, install, quick start, usage, configuration, contributing link, license, sponsor link |
| `LICENSE` | MIT by default (permissive, most common). Apache-2.0 if patent protection matters, GPL-3.0 if the user wants derivatives to stay open. Ask if unsure. Copyright line = year + the user's name |
| `CONTRIBUTING.md` | Dev setup, how to run tests, branch/commit conventions, PR process |
| `CODE_OF_CONDUCT.md` | Contributor Covenant 2.1 (link + summary), and a private contact method |
| `SECURITY.md` | How to report vulnerabilities privately (GitHub private reporting), expected response time |
| `.github/ISSUE_TEMPLATE/` | Bug report + feature request forms (`.yml`), `config.yml` linking Discussions |
| `.github/PULL_REQUEST_TEMPLATE.md` | Summary, testing, checklist |
| `.github/workflows/ci.yml` | Lint + test on pull requests, using the project's real commands |
| `.github/FUNDING.yml` | `github: <username>` (plus `ko_fi:`, `buy_me_a_coffee:`, `custom:` if they use those) |
| `.gitignore` | For the stack, plus `.env*` (except `.env.example`) |

Don't put the user's personal email in public files unless they ask; use
GitHub's private reporting and profile links instead.

## Phase 4: Publish (only with explicit approval)

Making a repo public is hard to undo. Confirm the repo name, owner and
visibility, then:

```bash
gh repo create <owner>/<name> --public --source . --push --description "<one line>"
gh repo edit <owner>/<name> --enable-discussions --add-topic <topic1> --add-topic <topic2>
gh api -X PUT repos/<owner>/<name>/private-vulnerability-reporting
```

Then suggest: a `v0.1.0`/`v1.0.0` release, 3-5 `good first issue` issues so
contributors have somewhere to start, branch protection on `main`, and
enabling Dependabot alerts.

## GitHub Sponsors

The user has to sign up themselves (identity, tax and bank details):
1. github.com/sponsors → **Get started** → join as an individual.
2. Profile, tiers (e.g. $5 supporter, $25 logo in README, $100 priority
   requests), connect Stripe/bank, submit for review.
3. `FUNDING.yml` makes the ♥ Sponsor button show on the repo once the
   profile is approved.
