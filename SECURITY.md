# Security

Skills are instructions an AI agent follows, so a malicious skill is a real risk. Every skill in this repo is reviewed by a maintainer before merge, and we don't accept skills that:

- download and run code from the internet,
- send data to third-party services without the user asking,
- tell the agent to ignore the user's or the system's instructions,
- hide instructions (encoded text, invisible characters, misleading file names).

If you find a skill that does any of this, or any other security problem, **don't open a public issue**. Report it privately through [GitHub's private vulnerability reporting](https://github.com/CharlieJamesGwapo/claude-work-skills/security/advisories/new). We aim to respond within 3 days.
