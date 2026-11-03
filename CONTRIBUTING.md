# Contributing

Thanks for helping. New skills, fixes to existing ones, and better examples are all welcome.

## Ground rules

- **One skill, one job.** A skill should do one kind of task well. If yours does two, split it.
- **Useful to strangers.** No company names, internal URLs, IDs, phone numbers, API keys or customer data. Run the `open-source-ready` skill on your change if you're unsure.
- **Original work.** Don't copy skills from other repos unless their license allows it, and credit them.
- **Plain English.** Write instructions the way you'd brief a smart colleague. Explain *why* a rule exists, not just the rule.

## Adding a skill

1. Copy the template:
   ```bash
   cp -R template skills/your-skill-name
   ```
2. Edit `skills/your-skill-name/SKILL.md`:
   - `name` must match the folder name: lowercase letters, numbers and hyphens, up to 64 characters.
   - `description` (up to 1024 characters) says **what it does and when to use it**, with the phrases people actually type ("write my standup", "fix this commit message"). This is how the agent decides to load the skill, so it matters more than anything else.
   - Keep `SKILL.md` under about 500 lines. Put long material in `references/` and link to it from `SKILL.md`.
   - Include at least one good example and, where it helps, one bad example.
3. Add the skill to the table in `README.md`.
4. Run the checks:
   ```bash
   bash scripts/validate.sh
   ```
5. Try it for real: install it (see README), ask for the task in your own words and check the skill triggers and the output is right.
6. Open a pull request and fill in the template.

## Improving an existing skill

Open an issue first if the change alters what the skill does. For wording fixes, better examples or typos, just send a pull request.

## Commit messages

Use [Conventional Commits](https://www.conventionalcommits.org/): `feat(skill-name): ...`, `fix(skill-name): ...`, `docs: ...`. The `commit-message` skill in this repo will write them for you.

## Review

A maintainer will review within a few days. We may ask you to tighten the description, cut length, or add an example. Once merged, your skill ships in the next release and you're credited in the release notes.
