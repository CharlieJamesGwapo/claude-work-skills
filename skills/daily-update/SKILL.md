---
name: daily-update
description: Write a short, casual end-of-day status update for your boss, team lead or client, summarising what got done today in plain, non-technical language they can read in ten seconds. Use whenever the user asks for a "daily update", "EOD update", "end of day report", "status update for my boss", "what should I tell my lead", "standup message", wants to "update my boss/manager/client on what I did today", or asks to turn today's work into a message to send someone. Writes in the user's own message voice, not a report voice. For release notes to customers, use release-notes instead.
license: MIT
---

# Daily Update

Turns today's work (from the conversation, git history, or what the user
tells you) into one short, casual message the user can paste straight into
Slack, Teams, WhatsApp or email to their boss or client. It's a spoken-style
update, not a report. The two read completely differently, and the whole
point of this skill is to not write the report by mistake.

## Voice and tone

- **Open with a greeting line** that fits the time of day and how the user
  addresses their boss: "Good evening, just a quick update on what I worked
  on today." If the user calls their boss "sir", "boss", by first name, or
  something else, use that. If you don't know, leave the name out rather than
  guessing.
- **Conversational and flowing**, the way someone actually talks: sentences
  joined with "and", "also", "so", "then", not clipped fragments.
- **Plain language only.** Describe what the work *does* for the business or
  the user, not how it was built. No jargon, acronyms, framework or file
  names, and no "implemented", "deployed", "refactored". Say what changed for
  the person using the thing.
- **No report scaffolding:** no headers, no bold labels like "Delivered:" /
  "Status:" / "Next steps:", no horizontal rules. It should look like a
  message a person typed.
- **Default length:** one paragraph, 3-5 sentences. If asked for shorter, cut
  detail before cutting the opening or closing. If asked for bullets, turn the
  same sentences into short bullets under the same opening line; don't add
  content just because it's a list.
- **Ending:** if the work was handed off (review, final polish, waiting on
  someone), close with that: "I've passed it to Sam to finish the final
  touches." If nothing was handed off, close with what's next tomorrow. Never
  invent a name or a handoff.

## What to include vs leave out

Ask: would the boss care about this, or is it implementation trivia?

Keep:
- What now works, as an outcome ("leads come in automatically now"), not a
  mechanism ("built a webhook intake route").
- Visible changes worth mentioning (new page, cleaner screen, faster load).
- Testing, in one plain phrase ("tested it and it's working").
- What's next, or who's picking it up.
- **One** blocker, if there is one that actually matters, and what you need
  ("just waiting on the login details from the client to finish it").

Leave out unless the user asks:
- Vendor and tool names, unless the user used them in their own phrasing.
- Architecture, file names, libraries, error messages, test counts, PR or
  ticket numbers.
- A list of caveats. Pick the one that matters.

## Where the content comes from

1. If the user gives you the points ("mention X and Y, and that I handed it
   to Z"), use exactly those. Don't dig up more.
2. If they just say "write my daily update", use what was actually completed
   in this conversation. If that's thin and you're in a git repo, check
   today's commits: `git log --since=midnight --author="$(git config user.name)" --oneline`.
3. Real, finished work only. Never pad with things that weren't done. If work
   is in progress, say so honestly ("still working through the last part of
   the checkout page").

## Iterate in place

The first draft is a draft. If the user says "shorter", "more casual", "use
bullets", "don't mention X", re-issue the whole message with that one change.
Don't ask clarifying questions first; this should be quick back-and-forth.

## Example

**Good:**

> Good evening, just a quick update on what I worked on today. I got the
> Facebook ad leads flowing into our CRM so they come in automatically now
> instead of someone adding them by hand, and made sure the same lead doesn't
> get added twice if it comes through more than once. I also added a page
> where we can see which ad forms are connected and how many leads each one
> has brought in, and cleaned up a few screens along the way so they're
> easier to follow. I tested everything and it's working, and I've passed it
> to Sam to finish the final touches.

**Bad** (report voice, don't produce this):

> **Daily Update: Meta Ads Lead Sync**
>
> **Delivered:**
> - Implemented webhook intake for Meta Lead Ads with idempotent dedup
> - Added `crm_lead_ad_forms` catalog table and Forms Hub UI filter
>
> **Status:** Submitted as PR #252 for review.
