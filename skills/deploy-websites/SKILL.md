---
name: deploy-websites
description: Safely deploy validated SEO/AI-visibility updates to confirmed production sites. Reads DEPLOYMENT_INVENTORY.md, runs quality gates, deploys only confirmed repo→domain mappings via Git auto-deploy or an authenticated provider CLI, verifies live, and writes DEPLOYMENT_STATUS.md. Never touches DNS, billing, domains, access, or secrets.
---

# /deploy-websites

Repeatable safe deploy of validated SEO updates. Invoked as `/deploy-websites`.

## Inputs
- `~/openrouter/DEPLOYMENT_INVENTORY.md` — project map + decisions
- `~/openrouter/DEPLOYMENT_EXCLUSIONS.md` — never-deploy list
- `~/openrouter/scripts/deploy-verified-sites.sh` — the gated runner

## Procedure
1. **Read** the inventory + exclusions. Build the eligible set = projects marked `EXISTING_PRODUCTION_SITE` with a confirmed repo→domain mapping (≥2 signals) and NOT in exclusions.
2. **Pre-flight access check.** `gh auth status`, `vercel whoami`. If the required provider for an eligible project is unauthenticated → mark that project BLOCKED, do NOT guess credentials, tell the user the exact `*-login` command. Never deploy without an authenticated, traceable path.
3. **Quality gate** per eligible project: confirm clean/committed tree, run `npm run build` (and `lint`/`typecheck`/tests if present). Verify `sitemap.xml`, `robots.txt`, `llms.txt`, canonical, JSON-LD exist where expected. On failure → write `DEPLOYMENT_BLOCKED_<project>.md` and skip.
4. **Commit** validated changes with `chore(seo): deploy validated SEO and AI visibility updates`. Never commit `.env*`/secrets.
5. **Rule 9 check:** if `origin/<branch>` has commits not in local → STOP, report conflict (possible newer production).
6. **Deploy** via the runner:
   ```bash
   ~/openrouter/scripts/deploy-verified-sites.sh           # dry-run plan
   ~/openrouter/scripts/deploy-verified-sites.sh --run     # execute
   ```
   Git auto-deploy where configured; else an already-authenticated provider CLI. Browser (Chrome skill, visible window only) for dashboard verification, reading logs, or triggering an existing project's normal deploy.
7. **Live verify** each deployed domain: `/`, `/robots.txt`, `/sitemap.xml`, `/llms.txt` if present, 3+ public pages, a product/service/course page, FR+EN if bilingual. Screenshots → `~/openrouter/DEPLOYMENT_EVIDENCE/<project>/`.
8. **Write** `~/openrouter/DEPLOYMENT_STATUS.md` (per-project table) and a final summary.

## Hard limits (never)
- Never modify DNS, billing, domains, ownership, auth, or access settings.
- Never buy domains, create hosting accounts, or delete deployments/repos/DBs/DNS.
- Never force-push or rewrite history. Never deploy uncommitted work.
- Never deploy excluded projects (internal tools, source-only, dashboards/admin, unproven mapping, broken build, third-party repos).
- Never print, save, or commit secrets/cookies/tokens. On login/CAPTCHA → stop and ask the user.
- One repo never overwrites another's domain/project.

## Output
Deployment table (Project · Domain · Provider · Commit · Deploy · Live verify · Action) + lists: deployed / skipped / blocked / live URLs / needs-manual-login / needs-DNS-or-billing.
