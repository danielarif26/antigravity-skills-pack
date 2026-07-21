---
name: openmontage
description: Produce a real video from a natural-language brief using the OpenMontage agentic video pipeline (research → script → assets → edit → render, via Remotion/HyperFrames). Use PROACTIVELY whenever the user asks to "make a video", "create an explainer", "animated video", "video ad", "trailer", "short", "montage", "turn this into a video", "produce a clip", or wants a finished .mp4 generated from a topic/script — even if they don't name OpenMontage. Works free (Piper TTS + open stock). NOT for SecretAIHub episodes (those use the existing secretaihub-video Remotion pipeline / episode-package skill).
---

# OpenMontage — agentic video production

Installed at `~/OpenMontage` (open-source agentic video system: Python + Remotion + HyperFrames, AGPL-3.0). Drives research → script → scene plan → asset generation → edit → render to a finished `.mp4`. Runs free with no API keys (Piper offline TTS + Pexels/archive stock); optional cloud keys in `~/OpenMontage/.env`.

## When to use (auto-trigger)
Any "make me a video / explainer / short / trailer / animation / montage from X" request that isn't a SecretAIHub episode. For SecretAIHub, use the `episode-package` skill + `secretaihub-video/` pipeline instead.

## How to run it
Always use the project's venv and run from the project dir:

```bash
cd ~/OpenMontage
.venv/bin/python render_demo.py --list          # zero-key demo renders (sanity check)
.venv/bin/python render_demo.py world-in-numbers # render a demo end-to-end
```

For a real brief, read the project's own agent instructions and skills first, then drive the pipeline:
- `~/OpenMontage/CLAUDE.md` + `~/OpenMontage/AGENT_GUIDE.md` — how the agent orchestrates a build
- `~/OpenMontage/skills/INDEX.md` — bundled skills (core: remotion, ffmpeg, hyperframes, subtitle-sync, whisperx; creative: cinematic, broll-planning, image-gen, animation-pipeline, data-viz; pipelines)
- `~/OpenMontage/PROMPT_GALLERY.md` — example briefs
- `~/OpenMontage/pipeline_defs/` + `config.yaml` — pipeline config

Workflow: interpret the brief → pick a pipeline/skills from `skills/INDEX.md` → generate script + scene plan → gather assets (free stock or cloud if keyed) → compose in `remotion-composer/` (or HyperFrames) → render. Output lands under the project's render output dir.

## Keys (optional, in `~/OpenMontage/.env`)
Free by default. To upgrade: ELEVENLABS_API_KEY (voice), HEYGEN_API_KEY (avatar), FAL_KEY / RUNWAY / Veo via GOOGLE_* (motion video), PEXELS/PIXABAY/UNSPLASH (stock). OPENAI_API_KEY present but out of quota — prefer other providers.
