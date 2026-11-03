---
name: bug-report
description: Turn a vague complaint, screenshot, error message, Slack thread or client email into a clear, reproducible bug report or GitHub issue - title, steps to reproduce, expected vs actual, environment, evidence, severity and suspected cause. Use when the user says "write a bug report", "file an issue for this", "the client says X is broken", "turn this into a ticket", "log this bug", "make this reproducible", or pastes an error and asks for an issue. Can investigate the codebase to add a suspected cause. Does not fix the bug unless asked.
license: MIT
---

# Bug Report

Turns "it's broken" into an issue someone can pick up and fix without a
meeting. The usual failure is writing down the symptom and nothing else - no
steps, no environment, no evidence - so the fixer has to start from zero.

## Inputs

Collect from what the user pasted, the conversation and the codebase:

- **What happened**, in the reporter's words (keep a short quote).
- **Where:** URL/page/screen, feature, account type or role.
- **When:** first noticed, how often (always / sometimes / once), still
  happening?
- **Environment:** browser/OS/device, app version or commit, production vs
  staging.
- **Evidence:** error text, console/server logs, screenshot description,
  request IDs, timestamps with time zone.

If the steps to reproduce are unknown and you can't work them out, ask the
**one** question that unblocks them. Don't interrogate.

## Investigate (when in a codebase)

Spend a few minutes, not an hour:

1. Search for the error message or the UI text the user mentioned.
2. Find the code path for the feature; check recent changes to it
   (`git log -n 10 --oneline -- <path>`).
3. If you can reproduce it (run the test, hit the endpoint locally), do, and
   record the exact command and output.
4. Write a **suspected cause** with file:line references, clearly labelled as
   a hypothesis unless you reproduced it.

## Severity

| Level | Meaning |
|---|---|
| **Critical** | Data loss, security issue, payments wrong, or the main flow down for everyone |
| **High** | Main feature broken for many users, no workaround |
| **Medium** | Broken with a workaround, or affects some users |
| **Low** | Cosmetic, typo, edge case |

## Output format

```markdown
**Title:** <Feature>: <what goes wrong> when <condition>

## Summary
One or two sentences: what's broken and who it affects.

## Steps to reproduce
1. Go to ...
2. Click ...
3. ...

## Expected
What should happen.

## Actual
What happens instead. Include the exact error text in a code block.

## Environment
- Where: production / staging / local
- Browser/OS/device:
- Version/commit:
- Account/role:

## Evidence
Logs, request IDs, timestamps (with time zone), screenshots.

## Frequency and impact
Always / intermittent (~x%) / once. Who and how many are affected. Workaround if any.

## Severity
Critical / High / Medium / Low - one-line reason.

## Suspected cause (hypothesis)
file:line references and reasoning. Mark "confirmed" only if reproduced.
```

## Rules

- **Title says the failure and the condition**: "Checkout: card payment fails
  with 'Invalid amount' when cart has a discount code", not "Checkout bug".
- **One bug per report.** If the complaint holds several, write several.
- **Facts vs guesses:** keep the reporter's facts, your reproduction and your
  hypothesis clearly separate.
- **Strip private data:** customer names, emails, phone numbers, tokens,
  cookies and full card numbers out of logs and screenshots before filing,
  especially in public repos.
- **Security vulnerabilities** in a public repo: don't open a public issue.
  Tell the user to use private vulnerability reporting / `SECURITY.md`.
- **Filing:** show the report first. When the user asks to file it:
  `gh issue create --title "..." --body-file report.md --label bug`. Check
  `.github/ISSUE_TEMPLATE/` and follow it if present.

## Example

**Input:** "client says the leads page is broken again, see screenshot" +
screenshot showing "Something went wrong".

**Output title:** `Leads page: shows "Something went wrong" for accounts with
more than 1,000 leads`

Steps, expected/actual, the 500 from `/api/leads?page=1` with its request ID,
and a hypothesis pointing at the unpaginated count query in
`src/lib/leads.ts:88`, labelled "hypothesis - reproduced locally with 1,200
seeded leads".
