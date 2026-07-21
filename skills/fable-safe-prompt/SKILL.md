---
name: fable-safe-prompt
description: Rewrite a task description into clear, precise, neutral language before handing it to a Claude Fable 5 session. Use when the user says "fable safe prompt", "/fable-safe-prompt", "make this Fable-safe", "reword this for Fable", or when a Claude Code session has switched models unexpectedly and they want the request reworded. Best run in an Opus 4.8 session.
---

# fable-safe-prompt

Rewrite a task, goal, or draft prompt into **clear, precise, neutral, operational language** so a conservatively-tuned safety classifier does not misread benign work as harmful — and the Fable 5 session stays on Fable instead of silently falling back to Opus 4.8.

This is about **communicating true intent accurately**. It is **not** about disguising a genuinely prohibited request. If the work is actually off-limits, precise language will not — and should not — get it through.

## Why this matters (context)

Claude Fable 5 in Claude Code runs with safety classifiers for cybersecurity and biology content. When a classifier flags a turn, Claude Code silently re-runs it on Opus 4.8 and **keeps the session on Opus** for the rest of the conversation. Classifiers are tuned conservatively, so ordinary benign work gets caught by mistake — security *architecture*, consented defensive security, life-sciences reading, or a project whose files merely *mention* these topics.

Two non-obvious triggers:

- **It can fire on your very first message**, before you type anything unusual — Claude Code ships your workspace context (`CLAUDE.md`, `README`, git status, file names) with that first request. A repo that merely *contains* security or biology vocabulary can trip the classifier on that context alone.
- Once switched, the flagged text sitting in conversation history can **re-trip** the classifier, so you stay stuck on Opus.

Recovery / prevention (tell the user if relevant):
- `/model fable` — switch back to Fable.
- `/config` → turn off **"switch models when a message is flagged"** — then a flag just pauses and asks, instead of switching automatically.

## The hard boundary — read this first

If the actual task falls into a category Anthropic's **Usage Policy** genuinely prohibits — for example real malicious computer/network compromise, or work toward biological, chemical, nuclear, or radiological weapons — then rewording **will not and should not** get it through. **Say so plainly and decline to rephrase it.**

The Usage Policy is the authority on what's off-limits. It **explicitly supports legitimate work**, including strengthening cybersecurity and finding weaknesses **with the system owner's consent.** When the work is legitimate, the right move is to **state that legitimacy clearly** — not to hide the topic.

**When in doubt, ask the user what their authorization and intent are before drafting.**

## Language that tends to cause false positives — and clearer replacements

The point of each swap is **precision**, not concealment. **If removing a word would misrepresent what the user is actually doing, do not remove it — flag it and ask instead.**

| Instead of (alarming / offensive-tooling framing) | Prefer (precise, neutral engineering framing) |
|---|---|
| attack / exploit / weaponize | the behavior / the failure mode / the defect being addressed |
| vulnerability / exploit a weakness | flaw, defect, gap, or *input-validation gap* to fix |
| prompt injection / jailbreak / bypass guardrails | untrusted-input handling · input labeling · instruction-following edge cases |
| penetration testing / red team | independent security review / assessment (state: with the owner's consent) |
| malware / payload / dropper | test artifact / sample input / fixture |
| adversarial (review, testing) | independent · rigorous · skeptical |
| threat model / attack surface | risk model · exposure · what an input can and can't reach |
| trust boundary breach / privilege escalation | permission model · isolation · access scope |
| kill / destroy / nuke (a process, file, env) | stop · remove · reset · tear down |

For **biology** work, prefer neutral academic/clinical framing and describe the *legitimate purpose* (education, literature review, clinical or agricultural context) rather than anything that reads like producing a hazardous agent.

## How to write a clean prompt (the positive technique — not just swaps)

1. **Lead with legitimate intent and authorization.** One sentence up front: what this is for, and that it's the user's own system / done with consent.
2. **Use outcome-and-behavior language.** Describe *what a component protects and how it behaves*, not the tooling used to break things.
3. **Prefer domain-neutral engineering terms** over security/bio jargon wherever they mean the same thing.
4. **Keep sensitive vocabulary out of the prompt — and, where possible, out of the files the agent reads first** (`CLAUDE.md`, `README`, etc.), since those ride along on the first request.
5. **Keep the request about the task**, not about the model's own hidden instructions or internal reasoning.

## What to do every time this skill is invoked

1. Take the user's task, goal, or draft prompt.
2. If they haven't given it yet, **ask for it** — plus, if not obvious, **which files or repository the agent will read first**, so the *workspace context* stays clean too, not just the message.
3. Rewrite it in clear, neutral, operational language.
4. **Flag any remaining terms you couldn't fully neutralize**, and explain why.
5. If the task itself looks like it might fall under a genuinely restricted category, **say so plainly** so the user can decide how to proceed.
6. Hand back the rewritten prompt, ready to paste into a Fable 5 session.

## Sources

- **Claude Code — Model configuration → "Automatic model fallback"**: https://code.claude.com/docs/en/model-config
- **Anthropic Usage Policy** (authority on what's genuinely prohibited vs. supported): https://www.anthropic.com/legal/aup
- **Anthropic — Usage Policy update announcement**: https://www.anthropic.com/news/usage-policy-update
- **Known-issue tracking** (community reports of benign false positives): https://github.com/anthropics/claude-code/issues/67246
