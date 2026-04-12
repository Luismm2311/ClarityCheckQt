## Design Decision Record — DDR-001

**Document ID:** DDR-001
**Title:** Exclusion of sleep comorbidity screening from ClarityCheck v1.0
**Date:** 2026-04-10
**Status:** Approved
**Author:** [Solo Developer / PRRC]

---

### Decision

The Insomnia Severity Index (ISI) is excluded from the ClarityCheck v1.0 fixed battery. Sleep comorbidity screening is deferred to v1.1.

---

### Background

IP clearance activity (RG-001 Annex A, 2026-04-10) identified that the ISI is copyright Prof. Charles M. Morin and distributed exclusively via Mapi Research Trust. Commercial use requires explicit case-by-case permission via the ePROVIDE portal. Outcome is uncertain and timeline is indeterminate.

---

### Options Considered

| Option | Description | Rejected Because |
|---|---|---|
| A | Pursue ISI license via Mapi Research Trust | Uncertain outcome, blocks v1.0 release |
| B | Substitute alternative sleep tool (PSQI / Epworth) | Adds scope, delays v1.0, not validated alongside chosen battery |
| C | Exclude sleep domain from v1.0 | Selected |

---

### Rationale

- The core intended purpose of ClarityCheck v1.0 — ADHD symptom screening with depression and anxiety comorbidity flags — is fully achievable without sleep assessment
- PHQ-9 and GAD-7 capture the highest-prevalence comorbidities (depression and anxiety occur in ~50–80% of adults with ADHD; sleep disorders ~30–50%)
- Excluding ISI does not compromise the clinical validity of the v1.0 battery
- Deferral to v1.1 allows time to either pursue ISI licensing properly or evaluate PSQI as a validated substitute
- This decision keeps v1.0 scope controlled and IP position unambiguous

---

### Impact

**Design Inputs (DC-002):** Remove ISI from battery definition. Total items revised from 41 to 34.

**Intended Purpose Statement:** Remove reference to sleep domain. No change to core intended purpose.

**Clinical Evaluation Plan (CE-001):** Remove ISI literature review section. Add note that sleep comorbidity is a known limitation of v1.0, addressed in v1.1 roadmap.

**Risk Assessment (RM-002):** Add residual risk item — *sleep comorbidity not screened, user with clinically significant insomnia may not be flagged* — assess and document as acceptable for v1.0.

**Instructions for Use (LB-001):** Add explicit statement: *ClarityCheck v1.0 does not assess sleep difficulties. If you are experiencing significant sleep problems, discuss these separately with your healthcare provider.*

---

### Reopening Criteria

This decision shall be revisited for v1.1 planning. Reopening triggers:

- ISI license granted by Mapi Research Trust
- PSQI selected as validated substitute following literature review
- Clinical evidence emerges that sleep screening materially improves battery sensitivity

---

## Revised Battery — v1.0 Final

| # | Tool | Items | Domain | IP Status |
|---|---|---|---|---|
| 1 | ASRS v1.1 Part A | 6 | ADHD screener | ✅ Free |
| 2 | ASRS v1.1 Part B | 12 | ADHD symptom severity | ⚠️ License pending |
| 3 | PHQ-9 | 9 | Depression | ✅ Free |
| 4 | GAD-7 | 7 | Anxiety | ✅ Free |
| **Total** | | **34** | | |

