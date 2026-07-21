---
name: notebooklm
description: Drive Google NotebookLM from the terminal via the `notebooklm` CLI. Create notebooks, add sources (PDFs, docs, URLs, YouTube links), then ask source-grounded questions and generate deliverables (summaries, quizzes, flashcards, audio/video overviews) — including capabilities the web UI doesn't expose. Use when the user says "notebooklm", "ask my notebook", "add this to notebooklm", "summarize these sources", or wants source-grounded research/Q&A offloaded to Google's free servers. Requires one-time `notebooklm login` (Google OAuth).
---

# NotebookLM CLI

Programmatic access to Google NotebookLM. Unofficial (uses undocumented Google APIs
— may break). Free; work runs on Google's servers.

## First-time setup (once)

```bash
notebooklm login      # opens Google OAuth in a browser
notebooklm list       # confirm auth works
```

## Core commands

```bash
notebooklm create "Project X"                 # new notebook
notebooklm use <partial-id>                   # select active notebook
notebooklm add <path-or-url>                  # add PDF / doc / URL / YouTube link
notebooklm ask "What are the key claims?"     # source-grounded Q&A
notebooklm --help                             # full command list
```

Extra vs the web app: batch downloads, quiz/flashcard export, save-chat-to-notes.

## Common pattern (YouTube research)

```bash
notebooklm create "yt-research"
notebooklm add "https://youtube.com/watch?v=..."
notebooklm ask "Summarize the main points and list the tools mentioned."
```

Source: https://github.com/teng-lin/notebooklm-py  (installed CLI: `notebooklm`)
