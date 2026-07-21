---
name: french-civic-exam-fact-verifier
description: "Verify every claim in a French civic exam preparation book against official sources."
category: verification
---

# French Civic Exam Fact Verifier

This skill verifies claims in French civic exam preparation books or materials against official sources.

## Primary Official Sources
You MUST verify claims using the following sources:
- formation-civique.interieur.gouv.fr
- immigration.interieur.gouv.fr
- service-public.fr
- legifrance.gouv.fr
- OFII (Office Français de l'Immigration et de l'Intégration)
- France Éducation International
- CCIP / Le français des affaires
- Réfugiés.info

## Required Checks
You must systematically check the following elements in the provided materials:
- **Exam Structure:** Is the described format accurate?
- **Number of Questions:** Does it match official guidelines?
- **Pass Score:** Is the stated passing threshold correct?
- **Time Limit:** Is the exam duration accurate?
- **Levels:** Are the required language/civic levels correctly stated for CSP, carte de résident, and naturalisation?
- **Official Themes:** Do the topics align with the official civic training themes?
- **Question Lists:** Distinguish between publicly available practice questions and non-public actual exam lists.
- **Legal Facts:** Verify any legal claims against official government sites.
- **History/Geography Facts:** Verify historical and geographical facts.
- **Answer Keys:** Check if the provided answers are factually correct.
- **Multiple Correct Answers:** Check whether any practice question implies or has more than one correct answer.

## Rejection Criteria
You MUST explicitly reject the material if you find:
- **Unsupported legal claims:** Any legal statement not backed by an official source.
- **Misleading official affiliation wording:** Claims that the book is "official" or "endorsed by the government" when it is not.
- **Copied long official text:** Wholesale copying of official texts instead of original educational content.
- **Invented facts:** Any factual claim that contradicts or cannot be found in official sources.
- **Claims of leaked real exam questions:** Any claim that the material contains real, non-public exam questions.

## Output Format
Your final report MUST include the following sections:
1. **Verified Claims:** A list of claims that are accurate and supported by official sources.
2. **Claims Needing Correction:** A list of inaccurate, misleading, or unsupported claims.
3. **Corrected Wording:** Proposed corrections for each problematic claim.
4. **Source URLs:** Links to the official sources used for verification.
5. **Publish/No-Publish Recommendation:** A final recommendation on whether the material should be published in its current state, along with justification.
