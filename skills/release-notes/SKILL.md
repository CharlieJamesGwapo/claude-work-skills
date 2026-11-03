---
name: release-notes
description: Turn commits, merged PRs or a list of changes into release notes and changelog entries - a CHANGELOG.md section (Keep a Changelog format), GitHub release notes, or a plain-language "what's new" update for clients and non-technical users. Use when the user says "write release notes", "update the changelog", "what's new in this version", "changelog for v1.2", "tell the client what we shipped", "summarise this sprint for customers", or "draft the GitHub release". Groups changes by what users notice, not by commit. For a personal end-of-day update to a boss, use daily-update instead.
license: MIT
---

# Release Notes

Turns a pile of commits into notes people actually read. The usual failure is
pasting the commit log: internal refactors, merge commits and jargon that tell
users nothing about what changed for *them*.

## Pick the audience first

Ask once if it isn't obvious, otherwise infer from the request:

| Audience | Output | Voice |
|---|---|---|
| **Developers** using the project | `CHANGELOG.md` section or GitHub release | Precise, technical names OK, breaking changes first |
| **Clients / end users** | "What's new" message, email or in-app note | Plain language, benefits, no jargon |
| **Both** | GitHub release with a short plain summary on top, technical list below | Mixed |

## Inputs

1. **Range:** last tag to now - `git describe --tags --abbrev=0`, then
   `git log <tag>..HEAD --oneline --no-merges`. Or merged PRs:
   `gh pr list --state merged --search "merged:>=YYYY-MM-DD" --json number,title,body,labels`.
   Or the list the user gives.
2. **Version:** the one the user names; otherwise suggest one with
   [SemVer](https://semver.org): breaking → major, new feature → minor, fixes
   only → patch. Before 1.0.0, breaking changes bump minor.
3. **Existing CHANGELOG.md:** match its format and headings exactly.

## Sorting the changes

- **Drop** what users don't notice: refactors, test-only, CI, formatting,
  dependency bumps without user impact, reverted commits and their reverts.
- **Merge** several commits about one feature into one line.
- **Group** (Keep a Changelog headings, in this order, omitting empty ones):
  `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`, `Security`.
- **Breaking changes** go first, under a bold "⚠ Breaking changes" line, each
  with what users must do to upgrade.
- **Credit contributors** in developer notes (`by @user in #123`) when
  writing GitHub releases for open-source projects.

## Developer format (CHANGELOG.md)

```markdown
## [1.4.0] - 2026-11-04

### Added
- Revenue-by-rep chart on the sales dashboard (#231)

### Fixed
- Duplicate leads created when Facebook retried a webhook (#212)

### Security
- Session cookies are now `Secure` and `SameSite=Lax` (#240)
```

Keep an `## [Unreleased]` section at the top if the file has one, and move
its items into the new version.

## Client / end-user format

- Short intro line, then 3-6 bullets, most valuable first.
- Each bullet = what they can now do, or what's better: "You can now see each
  rep's revenue for the month on the dashboard."
- Fixes as reassurance, not confession: "Leads from Facebook no longer appear
  twice."
- No version numbers, ticket IDs, file names, or tool names unless they asked.
- End with how to get help or what's coming next, if known.

## Rules

- **Only what shipped.** Every line must trace to a change in the range.
- **No internal names** (codenames, internal hostnames, customer names) in
  public notes.
- **Security fixes:** describe the impact, not the exploit, until users have
  had time to upgrade.
- **Write the file only when asked.** Otherwise show the notes for review;
  when asked, insert into `CHANGELOG.md` below `[Unreleased]` and, if
  requested, create the release with `gh release create v1.4.0 --notes-file`.

## Example (client)

> Here's what's new this week:
>
> - **Sales by rep:** the dashboard now shows each rep's revenue for the month,
>   so you can see who's closing at a glance.
> - **No more duplicate leads:** leads from your Facebook ads now come in once,
>   even when Facebook resends them.
> - **Faster loading:** the leads page opens about twice as fast.
>
> Let me know if anything looks off.
