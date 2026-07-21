---
name: free-llm-apis
description: Find free LLM API endpoints offline — 19 providers, 118 models with permanent free tiers (not trial credits), most OpenAI-SDK-compatible with base URLs + rate limits. Use when the user needs a free LLM/model API, an OpenAI-compatible free endpoint, a fallback for a quota-dead key, free embeddings/vision models, or asks "what free LLM APIs exist", "free model endpoint", "free alternative to OpenAI", "which free API has model X". Returns provider, model id, context, rate limits, and base URL. Data is local; no network needed.
---

# free-llm-apis (offline)

Local searchable copy of [mnfst/awesome-free-llm-apis](https://github.com/mnfst/awesome-free-llm-apis)
— 19 providers / 118 models with **permanent free tiers** (no trial-credit noise), mostly
OpenAI-SDK-compatible. Data in `data.json`, searched via `search.py`.

## Usage

```bash
python3 ~/.claude/skills/free-llm-apis/search.py <keywords> [flags]
python3 ~/.claude/skills/free-llm-apis/search.py --providers        # list providers + base URLs
python3 ~/.claude/skills/free-llm-apis/search.py llama --vision      # vision-capable free models
python3 ~/.claude/skills/free-llm-apis/search.py embedding
python3 ~/.claude/skills/free-llm-apis/search.py deepseek -n 10
```
Flags: `--vision`, `--providers`, `-n N`, `--json`.

## Why it's useful here
The user's `OPENAI_API_KEY` is quota-dead. This lists free OpenAI-compatible endpoints usable as
drop-in fallbacks (just swap `base_url` + key) for scripts, graphify semantic extraction, LightRAG, etc.

## Refresh
```bash
curl -sL https://raw.githubusercontent.com/mnfst/awesome-free-llm-apis/main/data.json \
  -o ~/.claude/skills/free-llm-apis/data.json
```
