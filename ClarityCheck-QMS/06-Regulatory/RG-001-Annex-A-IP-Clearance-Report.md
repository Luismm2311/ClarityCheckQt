## IP Clearance Report — ClarityCheck v1.0

**Document:** QMS / RG-001 Regulatory Strategy — Annex A
**Date:** 2026-04-10
**Status:** Draft — action items outstanding

---

### PHQ-9 — Depression

**Copyright holder:** Pfizer Inc.
**Verdict: ✅ Clear for open source commercial use**

Pfizer owns the copyright of the PHQ-9 and allows it to be accessed for free. Pfizer explicitly states that "no permission is required to reproduce, translate, display or distribute" the PHQ-9.

**Action required:** None. Include copyright notice © 1999 Pfizer Inc. in app and IFU.

---

### GAD-7 — Anxiety

**Copyright holder:** Pfizer Inc.
**Verdict: ✅ Clear for open source commercial use**

The PHQ and GAD-7 are available without copyright restriction and at no charge. Same terms as PHQ-9.

**Action required:** None. Include copyright notice in app and IFU.

---

### ASRS v1.1 Part A (6-item screener) — ADHD

**Copyright holder:** NYU / Harvard
**Verdict: ✅ Clear for commercial use with conditions**

The screener is freely available for clinical and non-clinical use, including commercial use, but does require attribution. No modifications other than creating electronic versions are permitted.

Specific conditions: the instrument must not be altered — all response options must be included, the scoring algorithm must not be altered, and the two levels of shading must be preserved.

**Action required:**
- Include full attribution to Kessler et al. 2005
- Preserve scoring algorithm exactly
- Reproduce shading faithfully in UI
- No modifications to item wording

---

### ASRS v1.1 Part B (12-item full checklist) — ADHD

**Copyright holder:** NYU / Harvard (via NYU TOV Licensing)
**Verdict: ⚠️ Requires formal license for commercial use**

For clinical use of the ASRS v1.1, permissions are granted via the ADHD in Adults website. For Research and Academic Use agreements, an institutional signatory is required. The NYU TOV licensing portal handles commercial agreements separately.

**Action required:**
- Contact NYU Technology Opportunities and Ventures (TOV) licensing office
- Request commercial SaMD license for the 18Q symptom checklist
- As a solo developer / open source project this may be straightforward but must be formally obtained and documented in QMS

---

### ISI — Insomnia

**Copyright holder:** Prof. Charles M. Morin, Université Laval
**Verdict: 🔴 Requires explicit permission — not freely licensed**

The ISI is distributed by Mapi Research Trust on behalf of its copyright holder, Prof Charles Morin. Any questions on the ISI, its conditions of use, and available translations shall be directed to Mapi Research Trust.

Use of the instrument requires permission from Charles M. Morin, Ph.D. at Université Laval.

**Action required:**
- Submit request via ePROVIDE portal (eprovide.mapi-trust.org)
- Specify: commercial SaMD, open source, self-assessment context
- Outcome is uncertain — Mapi Research Trust handles case by case
- **This is a blocking dependency for v1.0 if ISI is retained**

---

## Summary Table

| Tool | Status | Action |
|---|---|---|
| PHQ-9 | ✅ Free, no restriction | Add copyright notice |
| GAD-7 | ✅ Free, no restriction | Add copyright notice |
| ASRS Part A | ✅ Free with conditions | Attribution + no modifications |
| ASRS Part B | ⚠️ License required | Contact NYU TOV |
| ISI | 🔴 Permission required | Contact Mapi Research Trust |

---

## Design Decision Required

The ISI is a blocking item. Three options:

**Option 1 — Pursue ISI license**
Submit to Mapi Research Trust. Document the request and outcome in QMS. If granted, proceed. If refused, fall back to Option 2.

**Option 2 — Replace ISI**
Substitute with the **Pittsburgh Sleep Quality Index (PSQI)** or the **Epworth Sleepiness Scale**, both of which have cleaner open licensing. PSQI is in the public domain; Epworth is freely available.

**Option 3 — Drop sleep domain from v1.0**
Document as a design decision. Sleep comorbidity screening becomes a v1.1 design change — which is itself a useful QMS demonstration.

---

Which direction do you want to take on the ISI decision?