---
name: chatgpt
description: >
  Use the user's ChatGPT Plus account (chatgpt.com) via their logged-in Chrome browser.
  Trigger whenever the user says "ask chatgpt", "use chatgpt", "chatgpt:", "check with
  gpt", "what does chatgpt/gpt think", or wants a second opinion / generation from
  their ChatGPT Plus subscription. NOT for OpenAI API calls (workspace API is
  402-deactivated — browser is the ONLY working ChatGPT path).
---

# ChatGPT via Browser (Plus account)

The user has ChatGPT Plus at chatgpt.com, logged in in their Chrome. Access it by
driving their real Chrome with the claude-in-chrome MCP tools. (Their OpenAI API
workspace is deactivated — do not attempt API calls.)

## Flow

1. Load tools if deferred (ONE ToolSearch call):
   `select:mcp__claude-in-chrome__tabs_context_mcp,mcp__claude-in-chrome__navigate,mcp__claude-in-chrome__computer,mcp__claude-in-chrome__get_page_text,mcp__claude-in-chrome__find`
2. `tabs_context_mcp {createIfEmpty: true}` → get tabId.
3. `navigate` to `https://chatgpt.com` (new chat) — or reuse an existing
   conversation URL to continue a thread.
4. Click the prompt box ("Ask anything" / "Message ChatGPT"), `type` the prompt,
   press `Return`.
5. `wait` 5–10s (longer for reasoning models), then `get_page_text` to read the
   reply. Poll again while the answer is still streaming (page text grows).
6. Return the answer verbatim or summarized as asked.

## Gotchas

- Chrome must be running with the Claude extension connected. If tabs_context
  fails, ask the user to open Chrome.
- Model picker is top-left of the chat. Switch only when the user asks for a
  specific model/mode; otherwise leave the default.
- Cloudflare/anti-bot interstitials can appear — screenshot first if the page
  seems empty; NEVER attempt to solve a CAPTCHA (hand back to the user).
- Long answers: keep polling `get_page_text` until output stabilizes.
- Never touch account settings, billing, memory settings, or GPTs config unless
  explicitly asked.
- If logged out, STOP and tell the user to log in themselves — never handle
  credentials.

## Role in the token stack

Browser backends (this + `grok` skill) are MANUAL / second-opinion tiers: slow
(10-60s round-trip) and Chrome-dependent, so they are never wired into automatic
prompt hooks. Automatic tiers are: local Ollama (understudy/ruflo offload) →
GitHub Models free API → Claude. Use ChatGPT/Grok when the user explicitly asks,
for cross-model second opinions, or when quota everywhere else is exhausted.
