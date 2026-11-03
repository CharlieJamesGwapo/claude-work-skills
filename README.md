# Claude Work Skills

**Skills for the work around the code.** Status updates your boss can read in
ten seconds, commit messages and PRs reviewers thank you for, release notes
clients understand, bug reports someone can actually fix, meeting notes that
turn into tasks, AI phone agents that sound like people, and a safety check
before you open-source anything.

Works with **Claude Code**, Claude.ai, and any agent that supports the open
[Agent Skills](https://agentskills.io) format (Codex, Cursor, Gemini CLI,
OpenCode and more).

[![Validate skills](https://github.com/CharlieJamesGwapo/claude-work-skills/actions/workflows/validate.yml/badge.svg)](https://github.com/CharlieJamesGwapo/claude-work-skills/actions/workflows/validate.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Sponsor](https://img.shields.io/badge/Sponsor-%E2%9D%A4-ea4aaa)](https://github.com/sponsors/CharlieJamesGwapo)

## Skills

| Skill | What it does | Try saying |
|---|---|---|
| [daily-update](skills/daily-update) | Casual end-of-day update for your boss or client, in plain language, no report voice | "write my daily update" |
| [commit-message](skills/commit-message) | Conventional Commits message from the real diff; splits mixed changes | "commit this" |
| [pr-description](skills/pr-description) | PR title and body: why, changes, how to test, risks. Follows your PR template | "write the PR description" |
| [release-notes](skills/release-notes) | CHANGELOG entry, GitHub release, or plain "what's new" for clients | "release notes since v1.2" |
| [bug-report](skills/bug-report) | Vague complaint → reproducible issue with severity and suspected cause | "the client says checkout is broken, file an issue" |
| [meeting-actions](skills/meeting-actions) | Transcript → decisions, owners, due dates, open questions, follow-up message | "action items from this call" |
| [voice-agent-designer](skills/voice-agent-designer) | Full agent pack for an AI phone agent: prompt, rubric, test calls, launch and compliance | "make an outbound agent that books demos for dentists" |
| [open-source-ready](skills/open-source-ready) | Scan for secrets and private data (incl. git history), then add every file an open-source repo needs | "is this safe to make public?" |

## See it in action

<details open>
<summary><strong>daily-update</strong> - "write my daily update"</summary>

> Good evening, just a quick update on what I worked on today. I got the
> Facebook ad leads flowing into our CRM so they come in automatically now
> instead of someone adding them by hand, and made sure the same lead doesn't
> get added twice. I also added a page showing which ad forms are connected and
> how many leads each one has brought in. I tested everything and it's
> working, and I've passed it to Sam to finish the final touches.

No headers, no jargon, no "implemented webhook with idempotent dedup". Just
what your boss wants to know.
</details>

<details>
<summary><strong>commit-message</strong> - "commit this"</summary>

```
fix(checkout): stop double-charging when a payment retries

The retry handler created a new charge instead of reusing the
idempotency key from the first attempt, so slow card networks
could charge twice. Reuse the original key on retry.

Closes #418
```

Written from the real staged diff, in your repo's existing commit style.
</details>

<details>
<summary><strong>meeting-actions</strong> - paste a call transcript, "action items?"</summary>

| Owner | Task | Due |
|---|---|---|
| Sam | Send Acme the revised quote with the 10% annual discount | Fri 7 Nov |
| Priya | Confirm the payment provider supports AUD payouts | Wed 5 Nov |
| Unassigned | Decide who owns the onboarding emails | No date |

Plus decisions, open questions and a follow-up message ready to send. It never
invents an owner or a deadline nobody agreed to.
</details>

<details>
<summary><strong>bug-report</strong> - "client says the leads page is broken, file an issue"</summary>

> **Leads page: shows "Something went wrong" for accounts with more than 1,000 leads**
>
> Steps to reproduce, expected vs actual, the failing request ID, severity
> **High**, and a suspected cause pointing at the unpaginated count query in
> `src/lib/leads.ts:88` - labelled "hypothesis, reproduced locally with 1,200
> seeded leads".
</details>

<details>
<summary><strong>voice-agent-designer</strong> - "make an outbound agent that books demos for gyms"</summary>

An `agent-pack.md` with: the call type and why, a ready-to-paste system prompt
that talks like a person on the phone (short turns, varied reactions, numbers
read in chunks, one greeting only), opening line, post-call scoring rubric,
8 test calls to role-play, a launch checklist from simulation to scale, and
the compliance flags for your market (TCPA, PECR, GDPR, Australian DNCR).
</details>

## Install

### Claude Code (recommended)

```
/plugin marketplace add CharlieJamesGwapo/claude-work-skills
/plugin install work-skills@claude-work-skills
```

Update later with `/plugin marketplace update claude-work-skills`.

### Just one skill, or another agent

```bash
git clone https://github.com/CharlieJamesGwapo/claude-work-skills.git
cp -R claude-work-skills/skills/daily-update ~/.claude/skills/
```

For other agents, copy the skill folder into that agent's skills directory
(for example `.codex/skills/`, `.cursor/skills/` or `.agents/skills/`).

### Claude.ai

Zip a skill folder and upload it under **Settings → Capabilities → Skills**.

## How to use them

You don't call skills by name. Ask for the task in your own words and the
agent loads the right skill. You can also be explicit: "use the
bug-report skill on this".

## Highlights

- **Grounded, not invented.** Every skill works from the real diff, commits,
  transcript or brief, and is told never to make up owners, dates, testing
  or motivations.
- **Audience-aware.** The same work becomes a technical changelog, a client
  update or a message to your boss, each in its own voice.
- **Safe by default.** Skills show drafts before filing issues, opening PRs,
  creating releases or publishing repos, and warn when they see secrets.
- **Tested format.** CI checks every skill's frontmatter, size and naming, and
  scans for leaked keys.

## Contributing

New skills and improvements are very welcome. See
[CONTRIBUTING.md](CONTRIBUTING.md). Start from [`template/`](template),
run `bash scripts/validate.sh`, and open a pull request.

Good first contributions: issues labelled
[`good first issue`](https://github.com/CharlieJamesGwapo/claude-work-skills/labels/good%20first%20issue).

Have an idea but not the time? [Suggest a skill](https://github.com/CharlieJamesGwapo/claude-work-skills/issues/new?template=new-skill.yml).

## Sponsor

If these skills save you time, consider
[sponsoring the project](https://github.com/sponsors/CharlieJamesGwapo).
Sponsorships fund new skills and keep existing ones up to date as agents
change.

## License

[MIT](LICENSE) © Charlie James
