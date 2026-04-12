## RM-001 Risk Management Plan — ClarityCheck v1.0

**Document ID:** RM-001
**Title:** Risk Management Plan
**Version:** 1.0
**Date:** 2026-04-10
**Status:** Draft
**Author:** [Solo Developer / PRRC]
**Related Documents:** DC-002 Design Inputs, DDR-001, DDR-002, ISO 14971:2019

---

### 1. Purpose

This document defines the risk management process for ClarityCheck v1.0 in accordance with ISO 14971:2019. It establishes the scope, responsibilities, criteria, and planned activities for identifying, evaluating, controlling, and monitoring risks associated with the device throughout its lifecycle.

---

### 2. Scope

This Risk Management Plan applies to:

- ClarityCheck v1.0 software in all supported deployment configurations (web browser, mobile and desktop)
- All phases of the device lifecycle: design, development, release, post-market surveillance
- Risks arising from the device itself, its intended use, and reasonably foreseeable misuse
- Risks to patients, users, and third parties

This plan does not cover:

- Infrastructure risks outside the application boundary (user device, browser, network)
- Risks associated with instruments excluded from v1.0 (ASRS Part B, ISI)

---

### 3. Responsibilities

| Role | Responsibility |
|---|---|
| Solo Developer / PRRC | Risk management process owner. Responsible for all activities in this plan. Responsible for final risk acceptability decisions. |

As a solo developer organisation, no delegation is possible. All risk management activities are performed and reviewed by the same individual. This is a known limitation and is mitigated by reference to published literature, external clinical validation evidence, and documented reasoning at each step.

---

### 4. Risk Management Activities

The following activities shall be performed and documented:

| Activity | Output Document | Standard Reference |
|---|---|---|
| Hazard identification | RM-002 Risk Assessment | ISO 14971 §5 |
| Risk estimation | RM-002 Risk Assessment | ISO 14971 §6 |
| Risk evaluation | RM-002 Risk Assessment | ISO 14971 §7 |
| Risk control | RM-003 Risk Control Measures | ISO 14971 §8 |
| Residual risk evaluation | RM-004 Residual Risk Evaluation | ISO 14971 §9 |
| Risk-benefit analysis | RM-004 Residual Risk Evaluation | ISO 14971 §9 |
| Overall residual risk evaluation | RM-004 Residual Risk Evaluation | ISO 14971 §9 |
| Risk management review | RM-004 Residual Risk Evaluation | ISO 14971 §10 |
| Post-production monitoring | PM-001 PMS Plan | ISO 14971 §10 |

---

### 5. Intended Use and Intended Users

As defined in DC-002:

- **Intended user:** Adult (18+), lay user, unsupervised, community setting
- **Intended use:** Self-administered ADHD screening battery; output supports preparation for clinical consultation
- **Use environment:** Personal device, browser-based, no clinical supervision

---

### 6. Safety Characteristics

The following characteristics of ClarityCheck v1.0 are relevant to safety, per ISO 14971 Annex C:

| Characteristic | Relevance |
|---|---|
| Intended population | Adults 18+, may include vulnerable users (undiagnosed mental health conditions, emotional distress, suicidal ideation) |
| Output type | Scored results with severity categories and plain-language interpretation |
| Clinical decision influence | Output may influence user decision to seek or defer clinical consultation |
| No physiological measurement | Software only — no sensors, no hardware |
| No connectivity in v1.0 | No data transmission — limits certain risk categories |
| Self-administered | No clinician involvement in administration or interpretation |
| Lay user | User may lack ability to contextualise results appropriately |

---

### 7. Risk Acceptability Criteria

#### 7.1 Severity Categories

| Level | Category | Definition |
|---|---|---|
| S1 | Negligible | No injury or health impact |
| S2 | Minor | Temporary discomfort or distress, no clinical consequence |
| S3 | Serious | Significant harm, delayed or missed clinical intervention |
| S4 | Critical | Severe irreversible harm or death |

#### 7.2 Probability Categories

| Level | Category | Definition |
|---|---|---|
| P1 | Improbable | Unlikely to occur in device lifetime |
| P2 | Remote | Could occur but not expected |
| P3 | Occasional | Likely to occur at least once |
| P4 | Probable | Expected to occur multiple times |

#### 7.3 Risk Acceptability Matrix

|  | S1 Negligible | S2 Minor | S3 Serious | S4 Critical |
|---|---|---|---|---|
| **P4 Probable** | Acceptable | ALARP | Unacceptable | Unacceptable |
| **P3 Occasional** | Acceptable | ALARP | ALARP | Unacceptable |
| **P2 Remote** | Acceptable | Acceptable | ALARP | ALARP |
| **P1 Improbable** | Acceptable | Acceptable | Acceptable | ALARP |

**Acceptable:** No further action required beyond documentation.
**ALARP:** Risk must be reduced As Low As Reasonably Practicable. Residual risk must be justified.
**Unacceptable:** Risk must be reduced by design or risk controls until it reaches ALARP or Acceptable. Device cannot be released with an Unacceptable residual risk.

---

### 8. Risk Policy — Overall Residual Risk

Overall residual risk shall be considered acceptable if:

- No individual risk remains Unacceptable after controls
- The clinical benefit of ClarityCheck v1.0 demonstrably outweighs the sum of residual risks
- Benefit-risk analysis is documented in RM-004 with reference to clinical evaluation evidence

---

### 9. Preliminary Hazard Categories

The following hazard categories shall be addressed in RM-002. This list is not exhaustive and shall be expanded during detailed risk assessment.

| # | Hazard Category | Example Scenarios |
|---|---|---|
| H1 | False negative — ADHD | User with ADHD scores below threshold; defers seeking help |
| H2 | False positive — ADHD | User without ADHD scores positive; unnecessary clinical burden or self-labelling |
| H3 | False negative — Depression | PHQ-9 misses clinically significant depression |
| H4 | False negative — Anxiety | GAD-7 misses clinically significant anxiety |
| H5 | Suicidal ideation not acted upon | PHQ-9 item 9 positive; user not directed to crisis support |
| H6 | Misinterpretation of results | User treats score as diagnosis; does not seek clinical follow-up |
| H7 | Scoring error | Software calculates incorrect score due to implementation defect |
| H8 | Instrument modification | Item wording or scoring algorithm altered; invalidates clinical validity |
| H9 | Inappropriate use — population | Used by person under 18; instrument not validated for this population |
| H10 | Emotional distress during administration | Assessment triggers acute distress in vulnerable user |
| H11 | Results shared without context | Printed results misinterpreted by third party (employer, insurer) |
| H12 | Use as sole basis for self-diagnosis | User self-diagnoses and self-medicates without clinical consultation |

---

### 10. Risk Control Strategy

Risk controls shall be applied in priority order per ISO 14971 §8.2:

1. **Inherent safety by design** — e.g. enforcing validated scoring algorithms, preventing item skipping
2. **Protective measures in the device** — e.g. crisis prompt on PHQ-9 item 9, prominent disclaimers
3. **Information for safety** — e.g. IFU, in-app labeling, plain-language warnings

Risk controls shall be documented in RM-003 with traceability to the hazard and to the relevant design input in DC-002.

---

### 11. Lifecycle Considerations

| Phase | Risk Management Activity |
|---|---|
| Design | Hazard identification, risk estimation, risk control specification |
| Development | Verification that risk controls are implemented (link to DC-004) |
| Release | Residual risk evaluation, overall risk-benefit analysis, sign-off |
| Post-market | New hazard identification from user feedback, complaints, literature |

Post-market risk management triggers are defined in PM-001.

---

### 12. Relationship to Other Documents

| Document | Relationship |
|---|---|
| DC-002 Design Inputs | Risk controls generate design requirements; traceability maintained |
| CE-001 Clinical Evaluation Plan | Clinical evidence supports benefit-risk analysis in RM-004 |
| UE-001 Usability Engineering Plan | Use errors identified in usability activities feed RM-002 |
| PM-001 Post-Market Surveillance Plan | Post-production information feeds back into risk management |
| LB-001 Instructions for Use | IFU content driven partly by risk controls in RM-003 |

---

### 13. Review and Approval

| Role | Name | Date | Signature |
|---|---|---|---|
| Author / PRRC | | 2026-04-10 | |

---

### 14. Open Items

| ID | Item | Owner | Due |
|---|---|---|---|
| OI-01 | Complete RM-002 Risk Assessment (FMEA) for all hazard categories | PRRC | Before design freeze |
| OI-02 | Confirm crisis helpline references for FR-20 (feeds H5 control) | PRRC | DC-002 OI-01 |
| OI-03 | Review usability testing outputs for additional use-error hazards | PRRC | After UE-003 |

---