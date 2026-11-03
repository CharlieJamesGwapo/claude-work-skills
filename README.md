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
