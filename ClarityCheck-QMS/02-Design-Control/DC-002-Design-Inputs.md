## DC-002 Design Inputs — ClarityCheck v1.0

**Document ID:** DC-002
**Title:** Design Inputs
**Version:** 1.0
**Date:** 2026-04-10
**Status:** Draft
**Author:** [Solo Developer / PRRC]
**Related Documents:** DC-001 Design & Development Plan, DDR-001, DDR-002, RG-001 Annex A

---

### 1. Purpose

This document defines the design inputs for ClarityCheck v1.0 in accordance with ISO 13485 clause 7.3.3. Design inputs represent the requirements that the device must satisfy and form the basis for design verification.

All requirements are traceable to one or more of: intended purpose, regulatory obligation, risk control, or usability obligation.

---

### 2. Intended Purpose (Summary)

ClarityCheck v1.0 is a self-administered SaMD intended to support adults (18+) who suspect they may have ADHD. It presents a fixed battery of three validated questionnaires (ASRS v1.1 Part A, PHQ-9, GAD-7), scores responses, and presents results to support the user in preparing for a clinical consultation. It is not intended to diagnose any condition.

---

### 3. Intended User Profile

| Attribute | Definition |
|---|---|
| Population | Adults aged 18 and over |
| Clinical knowledge | None assumed — lay user |
| Language | English (v1.0) |
| Device literacy | Basic smartphone or desktop browser user |
| Supervision | Unsupervised, community setting |
| Vulnerability | May include users with undiagnosed mental health conditions, cognitive difficulties, or emotional distress |

---

### 4. Use Environment

| Attribute | Definition |
|---|---|
| Platform | Web browser (mobile and desktop) |
| Connectivity | Internet required to load application; no data transmitted to server in v1.0 |
| EHR integration | None |
| Concurrent use | Single user session, no multi-user scenarios |

---

### 5. Functional Requirements

#### 5.1 Battery Administration

| ID | Requirement | Source |
|---|---|---|
| FR-01 | The system shall present all three instruments in a fixed sequence: ASRS Part A → PHQ-9 → GAD-7 | Intended purpose, DDR-002 |
| FR-02 | The system shall present all 22 items across the battery without omission or reordering | Instrument IP conditions |
| FR-03 | The system shall not allow the user to skip individual items | Scoring validity |
| FR-04 | The system shall allow the user to change a response before final submission | Usability |
| FR-05 | The system shall present one instrument at a time with a clear transition between instruments | Usability |
| FR-06 | The system shall display a progress indicator throughout the assessment | Usability |

#### 5.2 Scoring

| ID | Requirement | Source |
|---|---|---|
| FR-07 | The system shall score the ASRS Part A using the published threshold algorithm (Kessler et al. 2005) without modification | IP condition, clinical validity |
| FR-08 | The system shall score the PHQ-9 by summing all 9 item scores (range 0–27) | Clinical validity |
| FR-09 | The system shall score the GAD-7 by summing all 7 item scores (range 0–21) | Clinical validity |
| FR-10 | The system shall apply published severity thresholds for PHQ-9 (5/10/15/20) and GAD-7 (5/10/15) | Clinical validity |
| FR-11 | Scoring shall be performed entirely client-side in v1.0 | Privacy, architecture |

#### 5.3 Output and Results

| ID | Requirement | Source |
|---|---|---|
| FR-12 | The system shall display a results screen upon completion of all three instruments | Intended purpose |
| FR-13 | The results screen shall display the score and severity category for each instrument separately | Intended purpose |
| FR-14 | The results screen shall display a plain-language interpretation of each score appropriate for a lay user | Usability, IEC 62366 |
| FR-15 | The results screen shall include a prominent statement that results do not constitute a diagnosis and require clinical interpretation | Risk control, labeling |
| FR-16 | The results screen shall recommend the user share results with a qualified healthcare professional | Risk control |
| FR-17 | The system shall allow the user to print or save results as a PDF for sharing with a clinician | Intended purpose |
| FR-18 | The system shall not store results beyond the active session in v1.0 | Privacy |

#### 5.4 Safety and Safeguarding

| ID | Requirement | Source |
|---|---|---|
| FR-19 | If the user selects a non-zero response to PHQ-9 item 9 (suicidal ideation), the system shall display a crisis resource prompt before presenting results | Risk control, user safety |
| FR-20 | The crisis prompt shall include at minimum a reference to a national crisis helpline appropriate to the deployment region | Risk control |
| FR-21 | The crisis prompt shall not prevent the user from completing the assessment or viewing results | Usability, autonomy |

#### 5.5 Labeling and Transparency

| ID | Requirement | Source |
|---|---|---|
| FR-22 | The application shall display the intended purpose statement on the welcome screen | MDR Annex I, labeling |
| FR-23 | The application shall display copyright attributions for all three instruments | IP conditions |
| FR-24 | The application shall identify the software version | MDR labeling |
| FR-25 | The application shall provide access to the Instructions for Use (IFU) from within the app | MDR Annex I |
| FR-26 | The application shall state explicitly that it is not a diagnostic tool | Intended purpose, risk control |

---

### 6. Non-Functional Requirements

#### 6.1 Performance

| ID | Requirement |
|---|---|
| NFR-01 | The application shall load fully within 5 seconds on a standard mobile connection (4G) |
| NFR-02 | Score calculation shall complete within 1 second of final submission |

#### 6.2 Usability

| ID | Requirement |
|---|---|
| NFR-03 | All item text shall be legible on screens of 320px width and above |
| NFR-04 | Response options shall be selectable by touch on mobile without zooming |
| NFR-05 | All user-facing text shall be written at no higher than a 8th grade reading level (Flesch-Kincaid) |
| NFR-06 | The application shall be operable without requiring user account creation or login |

#### 6.3 Privacy and Data

| ID | Requirement |
|---|---|
| NFR-07 | The application shall collect no personally identifiable information in v1.0 |
| NFR-08 | No response data shall be transmitted to any server in v1.0 |
| NFR-09 | Session data shall be cleared when the browser tab is closed |

#### 6.4 Compatibility

| ID | Requirement |
|---|---|
| NFR-10 | The application shall function correctly on current versions of Chrome, Firefox, Safari, and Edge |
| NFR-11 | The application shall function correctly on iOS and Android mobile browsers |

#### 6.5 Accessibility

| ID | Requirement |
|---|---|
| NFR-12 | The application shall conform to WCAG 2.1 Level AA |
| NFR-13 | All response inputs shall be accessible via keyboard navigation |

---

### 7. Regulatory and Standards Requirements

| ID | Requirement | Source |
|---|---|---|
| RR-01 | The device shall comply with EU MDR 2017/745 as a Class IIa SaMD | MDR |
| RR-02 | Risk management shall comply with ISO 14971:2019 | MDR Annex I §8 |
| RR-03 | Usability engineering shall comply with IEC 62366-1:2015 | MDR Annex I §5 |
| RR-04 | Software lifecycle shall comply with IEC 62304:2006+AMD1:2015 | MDR Annex I |
| RR-05 | Clinical evaluation shall comply with MDR Annex XIV and MEDDEV 2.7/1 rev 4 | MDR |

---

### 8. Constraints and Exclusions

| ID | Constraint |
|---|---|
| CON-01 | ASRS Part B shall not be included in v1.0 (DDR-002) |
| CON-02 | ISI shall not be included in v1.0 (DDR-001) |
| CON-03 | No EHR or third-party system integration in v1.0 |
| CON-04 | No user account, login, or persistent data storage in v1.0 |
| CON-05 | English language only in v1.0 |
| CON-06 | Instrument wording shall not be modified from published validated versions |

---

### 9. Traceability Summary

| Requirement Group | Count | Primary Source |
|---|---|---|
| Functional — Administration | FR-01 to FR-06 | Intended purpose, IP |
| Functional — Scoring | FR-07 to FR-11 | Clinical validity, IP |
| Functional — Output | FR-12 to FR-18 | Intended purpose, risk |
| Functional — Safety | FR-19 to FR-21 | Risk management |
| Functional — Labeling | FR-22 to FR-26 | MDR, IP |
| Non-functional | NFR-01 to NFR-13 | Usability, privacy |
| Regulatory | RR-01 to RR-05 | MDR, standards |
| Constraints | CON-01 to CON-06 | Design decisions |

---

### 10. Review and Approval

| Role | Name | Date | Signature |
|---|---|---|---|
| Author / PRRC | | 2026-04-10 | |
| Design Review | | | |

---

### 11. Open Items

| ID | Item | Owner | Due |
|---|---|---|---|
| OI-01 | Confirm crisis helpline reference for target deployment region(s) | PRRC | Before CE-001 |
| OI-02 | Define PDF output format spec (FR-17) | Design | DC-003 |
| OI-03 | Confirm Flesch-Kincaid target achievable for all interpretive text (NFR-05) | Design | Usability plan |
