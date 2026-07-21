---
name: triple-router
description: Route LLM calls across 3 cost tiers — free local Ollama (chat/mechanical), DeepSeek (cheap reasoning), Claude Opus (precision/hard-floor). Use when user says "triple router", "tiered ask", "route this to cheap model", "save tokens on LLM calls", "cost-optimize LLM usage", or when a task/pipeline makes many LLM calls that don't all need a premium model. Also covers the 95% token-reduction doctrine and the autonomous self-improvement loop prompt.
---

# Triple-Tier Model Router (global install)

Installed at `~/.claude/triple-router/`. Works from any directory.

## Call it

```js
const { ask } = require(process.env.HOME + '/.claude/triple-router/lib/tiered-ask.cjs');
const r = await ask({ prompt: '...', purpose: 'summarize' });
// r = { text, model, tier, latency_ms, usage, verification_flags }
```

CLI:
```bash
node ~/.claude/triple-router/lib/tiered-ask.cjs ping          # health of all 3 tiers
node ~/.claude/triple-router/lib/tiered-ask.cjs ask "prompt"  # route + answer
node ~/.claude/triple-router/scripts/tier-usage-report.cjs    # cost/distribution report
```

## Routing

| Tier | Model | Purposes |
|------|-------|----------|
| 1 free local | `qwen3.5:9b` (Ollama, env `TIER1_MODEL`) | greeting, echo, classify, label, json_reformat, template_slot_fill, dedup, hash_match |
| 2 cheap API | `deepseek-v4-pro` → flash fallback | summarize, enrich, kg_titling, compact_memory, long_context_analysis, codebase_analysis, research_synthesis, reflexion_first_pass, embedding_title |
| 3 precision | `claude-opus-4-7` | everything else + HARD-FLOOR (never demoted): identity_audit, self_modification, phenomenology, architectural_decision, author_voice, high_stakes_review |

Flags override: `chat|light|cheap|mechanical` → T1, `deepseek|cheap_reasoning|long_context` → T2.
Cascade on failure: T1→T2→T2-flash→T3. Rolling 50-call quota 30/40/30 ±10% (hard-floor immune).

## Keys / env

Env resolution order: process env > `$TRIPLE_ROUTER_ENV` > `~/.claude/triple-router/.env` > `./​.env` (cwd).

**Free mode (current, zero keys)**: when `DEEPSEEK_API_KEY` / `ANTHROPIC_API_KEY` are missing, T2/T3 auto-fall back to **GitHub Models free tier** using existing `gh auth login` token — T2 → `deepseek/deepseek-v3-0324`, T3 → `openai/gpt-4.1` (override: `GITHUB_T2_MODEL` / `GITHUB_T3_MODEL`). Verified live 2026-07-10 (T2 1.6 s, T3 2.1 s). Rate limits: low RPM + daily caps (8K in / 4K out per request) — fine personal use, not batch pipelines. Log entries carry `provider: github-free`. Adding paid keys switches tiers back automatically, no config change. Don't route secrets/sensitive prompts differently in free mode — same hard-floor rules apply.

## Logs (append-only, never delete)

- `~/.claude/triple-router/memory/tier-usage.jsonl` — every call
- `~/.claude/triple-router/memory/soft-failures.jsonl` — tier failures

## Doctrine + companion prompts (in `~/.claude/triple-router/docs/`)

- `95-token-reduction.md` — token-efficiency doctrine; apply its 22 operating heuristics to prompts sent THROUGH the router. Two invariants override all compression: (1) output quality must not degrade, (2) long-term memory persists.
- `TRIPLE-MODEL-ROUTER-PROMPT-v2.md` — original per-project setup prompt (this global install supersedes it for this machine).
- `Autonomous-Loop-Mega-Prompt.txt` — `/loop 2m` self-improvement loop prompt; paste into any project. Requires user to explicitly start it.
- `TRIPLE-MODEL-ROUTER-SOP.txt` — human-readable SOP.

## Local deltas vs upstream pack (v3, 2026-07-10)

1. Shared `lib/load-env.cjs` (was 4-line loader duplicated ×4); adds cwd + `$TRIPLE_ROUTER_ENV` resolution for global use.
2. `think:false` default in ollama client (upstream Triple-Stack file had it; v2 file lacked it — thinking models returned empty text and 15× latency without it).
3. `deepseek-verify` REPO_ROOT = caller cwd (was install dir — wrong for global install).
4. `memory/` auto-mkdir. 5. `TIER1_MODEL=qwen3.5:9b` (machine has 17 GB RAM; qwen3:32b needs 24+).
6. `lib/github-models-client.cjs` — free GitHub Models fallback for T2/T3 when paid keys absent (see Keys section). Rejected free options: Ollama Cloud (`deepseek-v4-flash:cloud` = subscription-walled), OVH anonymous (2 RPM, congested 429s), LLM7 (needs token + relabeled frontier models, unverifiable provenance).
All routing logic, quotas, hard floors, cascade, timeout formula: unchanged from pack.
