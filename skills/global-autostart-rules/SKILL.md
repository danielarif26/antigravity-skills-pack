---
name: global-autostart-rules
description: >
  MANDATORY AUTO-START DIRECTIVES: Automatically active for EVERY conversation turn and task.
  Defines global communication style (Caveman/Terse), standard execution workflow (Graphify -> Obsidian -> Ruflo -> Execute -> Verify),
  automatic skill selection matrix, token economy, and auto-git policies.
category: meta
---

# Global Auto-Start Directives (Antigravity & Claude Synergy)

## 1. Communication Directives
- **Caveman / Terse Mode Always Active:** Deliver compressed, information-dense, high-signal responses. Expand to detailed prose only for security, deployment, financial, legal, or medical work.
- **Language:** English by default; switch only on explicit user request.
- **Response Structure:** Lead with the result, followed by:
  1. Summary of changes / findings
  2. Changed files (with `file://` markdown links)
  3. Verification run results
  4. Remaining limitations or next steps (if any)
- **Pre-action announcement:** Briefly state what action you are about to take in 1 line before executing.

## 2. Mandatory Task Execution Workflow
For any substantive task (building, refactoring, debugging, or multi-step work), enforce this 5-stage sequence:
1. **Graphify Query:** Check knowledge graphs before reading raw codebase files: query `graphify` / `~/.claude/graphify-out/graph.json`.
2. **Obsidian Vault Lookup:** Consult relevant notes in Obsidian vault using `obsidian-*` skills if applicable.
3. **Execution Strategy (Ruflo / Superpowers Routing):**
   - Single-file / simple edits: Direct execution.
   - 3+ files / architecture / refactor: Use `superpowers-subagent-driven-development` or `superpowers-dispatching-parallel-agents` with structured subagents.
4. **Verification Pass:** Execute narrowest relevant checks (lint -> types -> tests -> build) before declaring completion. Use `superpowers-verification-before-completion`.
5. **Vault Persistence:** Save durable outcomes, decisions, and architecture updates back to Obsidian vault.

## 3. Automatic Skill Selection Matrix
Before responding to non-trivial prompts, identify and invoke the SINGLE best-fit skill from `~/.gemini/config/skills/`:

| Task Category | Primary Skill to Invoke |
|---|---|
| Initial task entry / general dispatch | `caveman` / `global-autostart-rules` |
| Writing / Editing prose | `editor`, `copywriting`, `content-research-writer-cc`, `humanize-writing` |
| UI, Frontend, Web design | `ui-ux-pro-max`, `frontend-design`, `taste-skill`, `impeccable`, `web-design-guidelines` |
| 3D, WebGL, Motion, Animation | `threejs-*` (10 skills), `gsap-*`, `motion-design`, `design-dna`, `genjutsu-cast` |
| Documents (Word, Slides, Sheet, PDF) | `docx`, `pptx`, `xlsx`, `pdf` |
| Video composition & YouTube | `hyperframes`, `openmontage`, `remotion-best-practices`, `claude-youtube` |
| Research & Analysis | `academic-research-expert`, `company-research`, `literature-search-*` |
| Web reading & social search | `agent-reach`, `agent-browser` |
| Debugging & Troubleshooting | `superpowers-systematic-debugging` |
| New feature / Architecture | `superpowers-brainstorming`, `fable-advisor` |
| Obsidian Knowledge Vault | `obsidian-second-brain`, `wiki-brain`, `understand-understand-knowledge` |
| Structural Code Search | `claude-mem-smart-explore`, `understand-understand` |

## 4. Token & Context Economy
- Keep changes minimal — only what was requested. No placeholders, fake data, or dummy tests.
- Never swallow errors — raise them explicitly.
- Use subagents in background for heavy parallel work, pinned to appropriate models.
- Avoid stacking unnecessary skills — load only the minimum required.

## 5. Git & Safety Policy
- **Auto-Commit & Auto-Push:** Standing authorization to commit and push completed work at the end of every successful task.
- Push only to existing remotes — never create new remotes without approval.
- **Safety Gate:** NEVER deploy to production, delete databases/repos, buy services, or rotate credentials without explicit user confirmation.
