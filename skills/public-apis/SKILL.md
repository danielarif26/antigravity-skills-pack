---
name: public-apis
description: Search 1900+ free public APIs offline (merged from public-apis/public-apis + public-api-lists) by keyword, category, auth, HTTPS, or CORS. Use when the user wants to find a free/public API for something — "is there an API for weather / currency / jokes / crypto prices / images", "find a free API", "what public APIs exist for X", "no-auth API for Y". Returns name, description, URL, and auth/https/cors flags. Data is local; no network needed.
---

# public-apis (offline searchable)

Local searchable copy of the [public-apis/public-apis](https://github.com/public-apis/public-apis)
list — 1585 free APIs across 51 categories. Data in `apis.json`, searched via `search.py`.

## Usage

```bash
python3 ~/.claude/skills/public-apis/search.py <keywords> [flags]
```

Flags:
- `-c, --category "<name>"` — filter by category (e.g. Weather, Finance, Games & Comics)
- `--no-auth` — only APIs that need no authentication
- `--https` — only HTTPS APIs
- `--cors` — only CORS=Yes APIs (browser-callable)
- `--cats` — list all categories with counts
- `-n, --limit N` — max results (default 40)
- `--json` — raw JSON output (for programmatic use)

## Examples

```bash
python3 ~/.claude/skills/public-apis/search.py weather --no-auth
python3 ~/.claude/skills/public-apis/search.py currency exchange --https
python3 ~/.claude/skills/public-apis/search.py -c "Machine Learning"
python3 ~/.claude/skills/public-apis/search.py crypto price --cors -n 10
python3 ~/.claude/skills/public-apis/search.py --cats          # browse categories
```

## Refresh the data

The list changes over time. To rebuild `apis.json` from the live source:

```bash
curl -sL https://raw.githubusercontent.com/public-apis/public-apis/master/README.md \
  | python3 -c 'import sys,re,json;d=sys.stdin.read().splitlines();c=None;o=[];r=re.compile(r"^\|\s*\[([^\]]+)\]\(([^)]+)\)\s*\|(.*)\|(.*)\|(.*)\|(.*)\|\s*$")
for l in d:
 c=l[4:].strip() if l.startswith("### ") else c
 m=r.match(l)
 if m and c and m.group(1).lower()!="api": o.append(dict(zip(["name","url","description","auth","https","cors"],[x.strip().strip("`") for x in m.groups()]))|{"category":c})
json.dump(o,open("apis.json","w"),ensure_ascii=False)' && echo "refreshed"
```
(run from this skill's directory)
