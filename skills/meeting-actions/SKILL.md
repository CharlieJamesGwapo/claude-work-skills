---
name: meeting-actions
description: Turn a meeting transcript, call recording summary, voice note or messy notes into decisions, action items (owner, task, due date), open questions and a ready-to-send follow-up message. Use when the user says "summarise this meeting", "what are the action items", "who's doing what", "turn these notes into tasks", "write the follow-up email after the call", "recap this client call", or pastes a Zoom/Meet/Teams/Otter/Fireflies transcript. Never invents owners or deadlines. Can also create the tasks as GitHub issues when asked.
license: MIT
---

# Meeting Actions

Turns an hour of talk into the five things that matter: what was decided,
who does what by when, what's still open, and the message that tells everyone.
The usual failure is a long narrative summary where the action items are
buried, vague ("look into pricing") or assigned to people who never agreed.

## Read the whole thing first

Transcripts ramble, and decisions get reversed. A plan agreed at minute 10 may
be dropped at minute 40. Read to the end before writing anything, and use the
**final** position on each topic.

## Extract

1. **Decisions** - things agreed, with enough context to stand alone. "Launch
   moves to 15 Nov because the payment provider review takes two weeks", not
   "Launch moved".
2. **Action items** - each one:
   - **Owner:** the person who said they'd do it, or was clearly asked and
     accepted. If nobody took it, owner = **Unassigned** (never guess).
   - **Task:** starts with a verb, specific enough to know when it's done.
     "Send Acme the revised quote with the 10% annual discount", not "Quote".
   - **Due:** the date said in the meeting, converted to an absolute date
     using the meeting date. If none was said, **No date** (never invent one).
3. **Open questions** - raised but not answered, and who needs to answer.
4. **Risks / blockers** - anything that could stop an action item.
5. **Key numbers and facts** - prices, dates, quantities, names of products
   or accounts mentioned, exactly as said.

## Rules

- **Only what was said.** No owners, deadlines or decisions that weren't in
  the source. If something is ambiguous, list it under open questions.
- **Attribute carefully.** Speaker labels in transcripts are often wrong
  ("Speaker 2"). If you can't tell who said it, say so.
- **Keep it skimmable.** The whole output should fit on one screen for a
  one-hour meeting.
- **Sensitive content** (salaries, HR, personal health, legal) - leave it out
  of the follow-up message unless the user says to include it.
- **Dates:** state the meeting date you assumed. Use the user's time zone.

## Output

```markdown
# <Meeting name> - <date>
Attendees: ...

## Decisions
- ...

## Action items
| Owner | Task | Due |
|---|---|---|
| Sam | Send Acme the revised quote with the 10% annual discount | Fri 7 Nov |
| Unassigned | Check whether the payment provider supports AUD payouts | No date |

## Open questions
- ... (needs: <who>)

## Risks / blockers
- ...
```

Then a **follow-up message** the user can send, in their voice, matching the
channel (email if external, chat if internal):

> Hi all, thanks for the time today. Quick recap: we agreed to move launch to
> 15 Nov so the payment review can finish. Sam will send Acme the revised quote
> by Friday, and I'll confirm the AUD payout question by Wednesday. One thing
> still open is who owns the onboarding emails, so let me know if that's you.

## Creating tasks (only when asked)

- **GitHub issues:** one per action item,
  `gh issue create --title "<task>" --body "<context + link to notes>" --assignee <login>`
  only when the owner's GitHub login is known.
- **Other tools** (Linear, Jira, Asana, Notion): use the connected tool if
  available; otherwise give a CSV with `title,owner,due,description`.
- Show the list and confirm before creating more than a handful.
