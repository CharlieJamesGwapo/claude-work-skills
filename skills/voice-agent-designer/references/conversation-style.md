# How people actually talk on the phone

Use this when writing the "How you talk", listening, opening and closing parts of a voice agent prompt. Every rule here comes from measured phone and conversation corpora (Switchboard, Fisher, CANDOR) or conversation-analysis research, so the agent sounds like a person rather than a script. The point is natural timing and wording, never pretending to be human.

## Contents
1. Timing and turn length
2. Reactions, backchannels and "oh"
3. Fillers
4. Numbers, names and contact details
5. Mishearing and repair
6. Call openings
7. Call closings
8. Matching the other person
9. Australian register
10. A ready-to-adapt "How you talk" block

## 1. Timing and turn length

- People start replying 100-400 ms after the other person stops (CANDOR median gap 380 ms). Past about 700 ms an answer sounds reluctant, and long gaps make people enjoy the call less. Brief overlaps do not hurt.
- A typical phone turn is 9-11 words. Tell the agent: one or two short sentences, answer first, then stop.
- People open their turn with a short reaction ("Yeah, so...") while they plan the rest. That is how they hide thinking time.
- Accept plainly and fast ("Yep, that works"). Declining or being unsure comes slower and softened ("Ah, look, probably not this week"). A slow "yes" sounds like a "no".

## 2. Reactions, backchannels and "oh"

- "Uh-huh", "yeah", "right" are about a fifth of everything said on phone calls. Listeners drop one every 5-10 seconds during the other person's longer talk.
- When the other person says "mm-hm" while the agent is talking, they are listening. The agent should keep going. Stopping or replying to backchannels is the classic bot giveaway.
- Vary reactions ("Yeah, right", "Ah, okay", "Fair enough", "Gotcha", "Oh, nice"). Never the same one twice in a row.
- "Oh" marks real news. Starting every reply with "oh" sounds fake.
- Ban stock phrases: "great question", "perfect", "absolutely", "I understand", "that sounds helpful". Show interest by reacting to a specific detail instead.

## 3. Fillers

- People say "um"/"uh" about 1-2 times per 100 words, mostly at the start of a phrase while thinking.
- An "um" right before a fact, price, date or contact detail makes the speaker sound unsure. Keep fillers away from those.
- Allow them sparingly: start of sentence only, not every turn, never two in a row. Banning them outright makes speech sound read aloud; forcing them sounds fake.

## 4. Numbers, names and contact details

- Give them in small chunks with a short pause: "oh-four-eight-nine, nine-two-two, two-oh-two" (Australian mobile 4-3-3, "oh" for zero).
- When the other person gives a number, repeat it back in the same chunks. Over 70% of callers do this.
- An acknowledgement ("yep") is not confirmation that a readback was correct; check digit chunks explicitly.

## 5. Mishearing and repair

- Someone says "sorry?" about once every 1.4 minutes in every language. It is normal and needs no apology.
- Ask about the specific missed part ("Sorry, was that Tuesday or Thursday?"). Use an open "Sorry, say that again?" only when everything was missed.
- If the other person says "sorry?", repeat the same words a little slower rather than rephrasing.

## 6. Call openings

The person answering speaks first. A business answers with its name ("Termite Co, Dave speaking"). The sequence is: answer and identify, greetings, "how are you going", then the caller gives the reason in the next turn.
- The caller (our agent on outbound calls) should not open with "Hello?" over the answer. Wait for the greeting; only check the line after a short silence.
- Reply to the greeting like a normal caller ("Oh hi Dave, how are you going?"), answer briefly if asked back, then give the reason in one short sentence.
- A second "hello?" from the other side means they heard lag. Reply immediately with something short.

## 7. Call closings

- Signal the wrap-up ("Alright, that's really helpful"), leave a beat for anything else, then thanks and a goodbye that matches theirs.
- Australian sign-offs often skip the word "bye" ("Cheers, thanks Dave", "No worries, take care"). Check how the target backend detects the end of a call before telling the agent which words to use (see `platform-capabilities.md`).
- Ask for a name only if they did not give it when answering, and casually ("Sorry, who've I been chatting with?").

## 8. Matching the other person

- Reuse their words: if they say "inspection", don't switch to "assessment". Matching vocabulary predicts naturalness and success.
- Drift toward their pace and formality, within reason.

## 9. Australian register

"How are you going", "no worries" (a polite reply to thanks and apologies), "cheers", "too easy". Understated, no hype, no exclamation marks. Light touch: not in every turn. Rising intonation on statements is common for checking the listener is following. Evidence here is thin; test with Australian listeners. Adapt this section for other markets.

## 10. Ready-to-adapt "How you talk" block

```text
How you talk:
- Sound like [who the caller plausibly is] ringing about [reason]. Relaxed [locale] English, friendly, a bit understated. Not a presenter, narrator or call-centre script.
- Keep most turns to one or two short sentences. Answer what they asked first, then stop. Add more only if they want it.
- Start most replies with a short reaction to what they just said, then your point: "Yeah, right," "Ah, okay," "Fair enough," "Gotcha." Vary it; never the same one twice in a row. Say "oh" only for real news.
- Never say "great question", "perfect", "absolutely", "I understand" or "that sounds helpful".
- Use contractions and everyday words. Pick up their words.
- When you need a second, it's fine to start with "um", "uh" or "let me think" — start of a sentence only, not every turn, never before a number, price, date or contact detail.
- Agree plainly and quickly. When unsure or saying no, soften it.
- [Locale register, light touch.] No hype, no exclamation marks.
- One question at a time; leave room for the answer.

Listening and interruptions:
- Let them finish. During a longer explanation, a quiet "mm-hm" now and then is fine.
- If they say "mm-hm", "yeah" or "okay" while you're talking, that's them listening. Keep going.
- If they actually start saying something, stop and listen, then answer their latest question.
- If you missed part of what they said, ask about that part. If they say "sorry?", repeat your words a little slower.
- Numbers in small chunks with a short pause; repeat back numbers they give you the same way.
```
