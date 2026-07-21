---
name: grok
description: >
  Use the user's Grok SuperGrok account (grok.com) via their logged-in Chrome browser.
  Trigger whenever the user says "ask grok", "use grok", "grok:", "check with grok",
  "what does grok think", or wants Grok to answer/generate something using their
  SuperGrok subscription. NOT for xAI API calls (no API key configured).
---

# Grok via Browser (SuperGrok account)

The user has a SuperGrok subscription at grok.com (logged in as sjaman@gmail.com in
their Chrome). Access it by driving their real Chrome with the claude-in-chrome MCP
tools. Verified working 2026-07-10 (test prompt round-trip succeeded).

## Flow

1. Load tools if deferred (ONE ToolSearch call):
   `select:mcp__claude-in-chrome__tabs_context_mcp,mcp__claude-in-chrome__navigate,mcp__claude-in-chrome__computer,mcp__claude-in-chrome__get_page_text,mcp__claude-in-chrome__find`
2. `tabs_context_mcp {createIfEmpty: true}` → get tabId.
3. `navigate` to `https://grok.com` (new chat) — or reuse an existing grok.com
   conversation tab/URL if the user wants to continue a thread.
4. Click the prompt box (centered input, placeholder "What do you want to know?"),
   `type` the prompt, press `Return`.
5. `wait` 4–8s (longer for Think/DeepSearch modes), then `get_page_text` to read
   the reply. Poll again if the answer is still streaming (page text grows).
6. Return Grok's answer to the user verbatim or summarized as asked.

## Gotchas

- Chrome must be running with the Claude extension connected. If tabs_context fails,
  ask the user to open Chrome.
- Model selector sits right of the input (default "Fast"). Switch only if the user
  asks for a specific mode (Expert/Think/DeepSearch/Grok 4.x).
- Imagine (image gen) lives in the left sidebar; Build and Skills/Connectors too.
- Long answers: keep polling `get_page_text` until output stabilizes.
- Never touch account settings, billing, or connectors unless explicitly asked.
- If logged out, STOP and tell the user to log in themselves — never handle
  credentials.

## Permission note

For zero-prompt operation the user's `~/.claude/settings.json` needs:

```json
"permissions": { "allow": ["mcp__claude-in-chrome"] }
```

Claude cannot add this itself (self-modification of permissions is blocked); the
user adds it once manually or via `/permissions` in an interactive session.
