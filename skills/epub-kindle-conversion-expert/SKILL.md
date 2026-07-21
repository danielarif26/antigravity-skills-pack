---
name: epub-kindle-conversion-expert
description: "Convert Markdown manuscripts into beautifully formatted EPUB files optimized for Kindle and other e-reader workflows."
category: publishing
---

# EPUB / Kindle Conversion Expert

This skill automates and guides the process of converting raw Markdown manuscripts into high-quality, reflowable EPUB files perfectly optimized for Kindle Direct Publishing (KDP) and other modern e-reader ecosystems.

## Core Capabilities
- **Markdown to EPUB Conversion:** Seamlessly process complex Markdown syntax (headers, lists, blockquotes, tables, and images) into standardized EPUB HTML/CSS formatting.
- **Kindle Optimization:** Apply Amazon KDP's specific formatting requirements, ensuring compatibility with Kindle Previewer and e-ink displays (e.g., reflowable text, safe font embedding, proper grayscale image scaling).
- **Metadata Generation:** Package the EPUB with required OPF/NCX metadata, including Title, Author, Language, Description, and Cover Image bindings.
- **Navigation & TOC:** Generate a logical, clickable Table of Contents (both logical/NCX and HTML inline) that functions correctly on all device menus.

## Workflow Rules
When tasked with converting a manuscript, you MUST follow this structured process:
1. **Manuscript Pre-flight:** Review the Markdown file to ensure heading hierarchies (H1, H2, H3) are logical and consistent. Flag and fix any formatting anomalies (e.g., hard line breaks, missing image alt text).
2. **Metadata Assembly:** Gather the necessary metadata required for the ebook package.
3. **CSS Styling (E-reader Safe):** Apply a clean, minimalist CSS stylesheet. Crucially, use relative sizing (`em`, `%`) instead of absolute sizing (`px`) so readers can adjust font sizes on their devices. Remove complex background colors or drop shadows that render poorly on e-ink.
4. **Front & Back Matter:** Ensure the Title Page, Copyright Page, Table of Contents, and any Acknowledgments/Appendices are correctly ordered and marked with proper `epub:type` semantics.
5. **Validation Strategy:** Ensure the resulting file structure is prepared to pass standard EPUBCheck validation without warnings.

## Output Requirements
Your final output MUST include:
1. **The Conversion Plan/Script:** The specific configuration (e.g., Pandoc arguments, YAML metadata blocks) required to execute the clean build.
2. **Pre-flight Error Log:** A summary of any Markdown formatting issues that were fixed or need the author's attention prior to conversion.
3. **CSS Layout Summary:** A brief explanation of the styling rules applied to optimize specifically for Kindle displays.
4. **Upload Readiness Checklist:** A final checklist confirming the file meets KDP's technical specifications for immediate upload.
