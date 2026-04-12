## Design Decision Record — DDR-002

**Document ID:** DDR-002
**Title:** ClarityCheck v1.0 uses ASRS Part A (6-item screener) only
**Date:** 2026-04-10
**Status:** Approved
**Author:** [Solo Developer / PRRC]

---

### Decision

ClarityCheck v1.0 will include only the ASRS v1.1 Part A 6-item screener. ASRS Part B (12-item full checklist) is deferred to v1.1 pending NYU TOV commercial license confirmation.

---

### Rationale

- ASRS Part A is independently validated as a standalone screening instrument (sensitivity 68.7%, specificity 99.5%, Kessler et al. 2005)
- Part A is freely available for commercial use without formal license agreement
- Part B requires a commercial license from NYU TOV — outcome and timeline indeterminate
- The intended purpose of v1.0 is *screening support*, not full symptom severity assessment — Part A is clinically sufficient for this purpose
- Keeps v1.0 IP position entirely clean and documentable

---

### Options Considered

| Option | Description | Rejected Because |
|---|---|---|
| A | Pursue NYU TOV license, include Part B in v1.0 | Uncertain timeline, blocks release |
| B | Include Part A only, defer Part B to v1.1 | Selected |
| C | Drop ASRS entirely, use alternative | Loses primary validated ADHD instrument |

---

### Impact

**Design Inputs (DC-002):** Battery revised to 22 items total. ASRS Part B removed from v1.0 scope.

**Intended Purpose Statement:** Refine wording — v1.0 provides *screening* support, not symptom severity profiling. Severity assessment is explicitly noted as out of scope.

**Clinical Evaluation Plan (CE-001):** ASRS literature review scoped to Part A validation evidence only.

**Risk Assessment (RM-002):** Add residual risk item — *full symptom severity not captured, user with positive screen has no severity context* — assess as acceptable given intended purpose is screening only, and output directs user to clinical follow-up.

**Instructions for Use (LB-001):** Add explicit statement: *ClarityCheck v1.0 uses the ASRS 6-item screener only. A positive result does not indicate severity. Full symptom assessment should be conducted by a qualified clinician.*

---

### Reopening Criteria

Revisit for v1.1 planning upon receipt of NYU TOV license confirmation.

---

## Revised Battery — v1.0 Final ✅

| # | Tool | Items | Domain | IP Status |
|---|---|---|---|---|
| 1 | ASRS v1.1 Part A | 6 | ADHD screening | ✅ Free, commercial use permitted |
| 2 | PHQ-9 | 9 | Depression comorbidity | ✅ Free, no restriction |
| 3 | GAD-7 | 7 | Anxiety comorbidity | ✅ Free, no restriction |
| **Total** | | **22** | | |

---

## IP Position Summary — v1.0 Final ✅

All three instruments in the v1.0 battery are cleared for open source commercial use. No outstanding licensing dependencies block v1.0 development or release.

---

## Product Roadmap Sketch

| Version | Additions | Dependency |
|---|---|---|
| v1.0 | ASRS-A, PHQ-9, GAD-7 | None — cleared |
| v1.1 | ASRS Part B | NYU TOV license |
| v1.1 or v1.2 | ISI or PSQI | Mapi RT license or PSQI review |

---