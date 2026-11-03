# Call types

Pick the archetype that matches the brief, or blend two and say so. Each one
changes who speaks first, what the agent may say about itself, how the call
ends, and which platform capabilities it needs (see
`platform-capabilities.md`).

## Contents
1. Mystery-shop enquiry
2. Cold outreach / prospecting
3. Requested callback / lead intake
4. Existing-customer follow-up (reminders, confirmations, reactivation, surveys)
5. Inbound receptionist
6. Choosing when the brief is ambiguous

---

## 1. Mystery-shop enquiry

The agent poses as an ordinary enquirer to test how a business handles a lead
(e.g. a lead-response audit for a marketing agency's prospects).

- **Who speaks first:** the business. The agent replies to their greeting,
  then asks one grounded enquiry question.
- **Represents:** itself as a private enquirer, never the commissioning
  company. No pitch.
- **Disclosure:** honest if asked whether it's AI. Never claims to be human.
- **Goal:** a realistic enquiry that gives staff the chance to capture name
  and number, offer follow-up and explain next steps.
- **Typical findings:** enquiry_handling, relevant_questions, name_capture,
  phone_capture, email_capture, visit_guidance, follow_up, next_steps.
- **Voicemail:** hang up silently. Never leave a message.
- **Ends:** short thanks and goodbye, after asking the staff member's name if
  they didn't give it.
- **Must not:** book, pay, commit to a date, invent personal circumstances,
  name the commissioning company.
- **Grounding:** the enquiry comes from the business's own website (service,
  area). Never "what services do you offer".
- **Needs:** callee-speaks-first opening, voicemail detection, phone-menu
  (IVR) navigation if many targets use menus, reliable end-of-call detection.
- **Risk:** a mystery shop that later feeds a sales pitch can be judged
  misleading; see `compliance.md`.

## 2. Cold outreach / prospecting

The agent calls a business or person on behalf of a company to start a sales
conversation.

- **Who speaks first:** the callee. The agent introduces itself and the
  company in one breath and gives the reason in one sentence: "I'm Alex, an AI
  assistant calling from Acme. We help gyms follow up enquiries faster. Have
  you got a minute?"
- **Represents:** the company, by name.
- **Disclosure:** AI and company up front. Telemarketing rules usually require
  name, company and purpose.
- **Goal:** one specific next step - permission to send info, a booked demo,
  or a warm transfer. Decide which before writing.
- **Objections:** acknowledge once, offer the lightest next step, accept "no"
  fast. "Not interested" or "take me off your list" means opt out and end
  politely.
- **Voicemail:** usually no message for AI calls, or a short compliant one if
  the brief requires it.
- **Ends:** recap the agreed next step, thanks, goodbye.
- **Must not:** pressure, argue, claim results it can't prove, invent pricing,
  promise anything the company hasn't approved.
- **Needs:** opt-out recording; booking or send-info tools if the next step
  happens during the call.

## 3. Requested callback / lead intake

The person asked for a call (web form, ad, "call me" button).

- **Who speaks first:** the person answers ("Hello?"). The agent greets them
  by name and says why it's calling: "Hi Sarah, it's Alex from Acme, you asked
  for a call about..."
- **Represents:** the company.
- **Disclosure:** say it's an AI assistant early. They expect a call, not
  necessarily from AI.
- **Goal:** discovery (what they need), answer from approved facts, then a
  consented next step (submit details, book, or arrange a human callback).
- **Consent:** interest isn't permission. Ask explicitly before submitting
  anything, and read back name, email and number.
- **Speed:** call within minutes of the request; check the request is still
  fresh before dialling.
- **Ends:** confirm what happens next, thanks, goodbye.
- **Must not:** claim something was submitted or booked before the system
  confirms it; promise follow-up without a consented request.
- **Needs:** caller variables (`{{first_name}}`), a submit/booking tool,
  an end-call tool or reliable farewell detection, rate limits.

## 4. Existing-customer follow-up

Reminders, confirmations, reactivation of lapsed customers, satisfaction or
NPS surveys, payment-reminder style calls.

- **Who speaks first:** the customer answers. The agent identifies itself and
  the company, and confirms it's speaking to the right person before any
  personal detail: "Hi, is that Sam? It's Alex, an AI assistant from Acme."
- **Disclosure:** AI and company up front.
- **Identity check:** never reveal account, booking or health details until
  the right person is confirmed. If someone else answers, leave no details and
  offer to call back.
- **Goal:** one outcome per call (confirm, reschedule, answer survey, rebook).
- **Ends:** confirm the outcome, thanks, goodbye.
- **Needs:** CRM/booking tools and an identity-check step; usually build work.

## 5. Inbound receptionist

The agent answers calls to a business number.

- **Who speaks first:** the agent, with one short greeting: "Thanks for
  calling Acme, Alex speaking."
- **Disclosure:** introduce as AI, or be honest if asked - decide per brief.
- **Goal:** answer from approved facts, take a message, book, or transfer.
- **Rules:** caller ID isn't proof of identity. Read back numbers. Never
  invent prices or availability. Transfer to a human on request.
- **Needs:** inbound number routing, transfer tool, message-taking or booking
  tools.

## 6. Choosing when the brief is ambiguous

Ask two questions, or infer and state the assumption:

1. Did the person ask for this call, or are they an existing customer? If yes
   → 3 or 4. If not → 1 or 2.
2. Should the business know who's really calling? If not → 1 (mystery shop).
   If yes → 2.

Novel use cases (debt collection, recruitment screening, appointment-setting
for a third party, political or charity calls) carry extra legal rules. Write
the agent, but put the compliance questions at the top of the launch plan.
