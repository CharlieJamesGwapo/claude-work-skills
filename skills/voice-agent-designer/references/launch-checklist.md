# Launch checklist

Adapt this to the agent and include it in the pack. Steps that touch live
systems (phone numbers, deployments, enabling outbound calling) are for the
user to run, or for the agent only with explicit approval each time.

## 1. Isolate the agent
- Its own config/workflow, its own credentials and API keys, its own
  database or table prefix, its own agent name if the platform dispatches by
  name. Never share another agent's tokens or data.
- Version the prompt (`v1`, `v2`...) and bump it on every change so call
  reviews can be tied to a prompt version.

## 2. Simulation first
- Deploy with outbound calling **disabled**.
- Run the test script as text or browser-audio sessions if the platform
  supports it. Fix the prompt before any phone call.

## 3. Phone number
- A real, answerable caller ID (telemarketing rules usually require it).
  Decide who answers return calls and what they hear.
- Register the number for branded/verified caller ID where available, to
  reduce "Spam likely" labels.
- Inbound agents: route the number to the agent and test transfers to a human.

## 4. Safeguarded test calls
- Allowlist only the team's own test numbers. Block everything else in code,
  not just in the prompt.
- Run the pack's test script. For each call check: one greeting only, who
  spoke first, turn length, no stock phrases, numbers in chunks, voicemail
  handled as specified, the call ended after the goodbye, transcript and
  evaluation saved, recording plays back.

## 5. Small live batch
- Set calling windows in the callee's time zone (see `compliance.md`).
- Start with 10-20 calls at concurrency 1-2. Review **every** call of the
  first batch against the rubric.
- Fix, bump the version, repeat until the rubric is consistently good.

## 6. Scale
- Raise volume gradually. Keep reviewing a sample (e.g. 10%) of calls, and
  every call the rubric flags.
- Monitor opt-outs, complaint rate, answer rate and average call length.
  A sudden change usually means a prompt or platform regression.

## Rollback
Have one switch that stops new outbound calls immediately (feature flag or
env var), and document it in the pack. Active calls should drain, not drop.
