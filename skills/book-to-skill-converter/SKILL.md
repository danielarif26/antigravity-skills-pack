---
name: book-to-skill-converter
description: "Turn writing, editing, or reference books into actionable Claude Code skills."
category: meta
---

# Book-to-Skill Converter

This is a meta-skill designed to ingest the principles, rules, and methodologies from non-fiction books (specifically writing guides, editing manuals, and reference materials) and distill them into highly structured, actionable `SKILL.md` files for Claude Code.

## Core Capabilities
- **Methodology Extraction:** Analyze a provided text (or summary of a text) to extract the core methodologies, step-by-step processes, and philosophical approaches of the author.
- **Rule Formulation:** Translate abstract advice from the book into concrete, programmable rules (e.g., turning "be concise" into "Flag and eliminate passive voice and sentences exceeding 25 words").
- **Skill Architecture:** Design a logical workflow within the new skill, defining the input requirements, the step-by-step execution process, and the exact output format.
- **Tone & Style Emulation:** Capture the specific voice or style advocated by the book and embed it into the generated skill's prompt guidelines.

## Workflow Rules
When tasked with converting a book into a skill, you MUST follow this structured process:
1. **Source Ingestion:** Read and analyze the provided text, PDF, EPUB, or detailed summary of the reference book.
2. **Principle Distillation:** Identify the 3-5 core pillars of the book's methodology.
3. **Actionable Translation:** For each pillar, write a strict, testable instruction that an AI can follow consistently. Avoid vague instructions.
4. **Drafting the `SKILL.md`:** Create the new skill file using standard Claude Code Markdown format. It MUST include:
    - YAML Frontmatter (name, description, category).
    - Core Capabilities.
    - Strict Workflow Rules (step-by-step).
    - Output Requirements.
5. **Quality Control:** Review the generated skill. Ask: "If an AI strictly follows this `SKILL.md`, will the output reliably reflect the author's original methodology?"

## Output Requirements
Your final output MUST include:
1. **The Generated `SKILL.md` File:** A fully formatted, ready-to-use markdown file for the new skill.
2. **Methodology Mapping:** A brief document showing how the abstract concepts from the book were mapped to the specific programmable rules in the skill.
3. **Usage Example:** A short prompt demonstrating how a user should invoke the newly created skill to get the best results.
