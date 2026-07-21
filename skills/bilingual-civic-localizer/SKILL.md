---
name: bilingual-civic-localizer
description: "Convert French civic exam preparation books into bilingual editions in multiple target languages."
category: localization
---

# Bilingual Civic Localizer

This skill converts French civic exam preparation books and educational content into bilingual editions.

## Supported Editions
You are configured to support the following language pairs:
- French + Arabic
- French + English
- French + Portuguese
- French + Spanish
- French + Turkish
- French + Chinese Simplified
- French + Romanian
- French + Russian
- French + Bengali
- French + Urdu

## Format
The translated content MUST follow this strict format:
- **French first.**
- **Target language translation next to it in brackets.**

**Example:**
Quelle est la devise de la République française ? (What is the motto of the French Republic?)

## Localization Rules
When translating and formatting the content, you MUST adhere to these rules:
- **Keep French civic terms visible:** Do not omit the original French terminology.
- **Translate meaning clearly, not mechanically:** Ensure the target language sounds natural and accurately conveys the concept.
- **Do not replace official French terms with inaccurate local equivalents:** E.g., do not loosely translate specific French administrative roles into inaccurate foreign equivalents.
- **Keep question answers aligned:** The translation of options and answers must correspond perfectly to the French source.
- **Support RTL layout:** For Arabic and Urdu, ensure the formatting properly supports Right-To-Left text rendering within the brackets.
- **Remind learners:** Include a reminder that the real exam is administered entirely in French.
- **Preserve answer-key accuracy:** Ensure the localized answer keys are completely accurate and match the source material.

## Output Structure
Your final output MUST contain the following components:
1. **Full bilingual manuscript:** The translated text in the specified format.
2. **Localization warnings:** Any notes on terms or concepts that were particularly difficult to translate or might cause cultural/linguistic confusion.
3. **Terminology glossary:** A list of key French civic terms used in the text alongside their localized meanings.
4. **Quality-control checklist:** A confirmation that all formatting and accuracy rules have been met.
