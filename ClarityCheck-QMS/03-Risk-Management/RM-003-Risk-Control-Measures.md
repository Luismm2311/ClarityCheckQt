## RM-003 Risk Control Measures — ClarityCheck v1.0

**Document ID:** RM-003
**Title:** Risk Control Measures
**Version:** 1.0
**Date:** 2026-04-10
**Status:** Draft
**Author:** [Solo Developer / PRRC]
**Related Documents:** RM-001, RM-002, DC-002, LB-001

---

### 1. Purpose

This document specifies the implementation of each risk control identified in RM-002, in accordance with ISO 14971:2019 §8. For each risk control measure (RC) it defines:

- The control type (inherent safety / protective measure / information for safety)
- The exact implementation requirement
- The design input or document where it is expressed
- The verification method and acceptance criterion
- The implementation status

Risk controls are applied in priority order per ISO 14971 §8.2:
1. Inherent safety by design
2. Protective measures in the device
3. Information for safety (labeling, IFU)

---

### 2. Risk Control Type Definitions

| Type | Code | Definition |
|---|---|---|
| Inherent safety by design | ISD | The hazard is eliminated or reduced by the design itself, not by warnings or user behaviour |
| Protective measure | PM | The device detects, prevents, or limits the harmful situation through active software behaviour |
| Information for safety | IFS | The risk is communicated to the user via in-app labeling, results screen text, or IFU |

---

### 3. Risk Control Measures

---

#### RC-01 — Negative Result Disclaimer (General)

**Hazards addressed:** H1, H3, H4
**Control type:** IFS

**Requirement:**
Every results screen section shall include a visible statement that a below-threshold score does not exclude the relevant condition and that clinical advice should be sought if concerns persist.

**Implementation:**
- LB-001 Section 7 — score interpretation tables include explicit negative result language per instrument
- In-app results screen — mirror LB-001 Section 7 language exactly
- Applies to all three instruments

**Verification method:** Results screen review against LB-001 Section 7 reference text
**Acceptance criterion:** Disclaimer present and correctly worded for all three instruments on results screen

**Status:** Specified — pending implementation

---

#### RC-02 — ADHD Negative Result Plain-Language Statement

**Hazards addressed:** H1
**Control type:** IFS

**Requirement:**
The results screen shall include a dedicated plain-language statement specifically addressing the known sensitivity limitation of the ASRS Part A screener.

**Implementation:**
- LB-001 Section 7: *"The ASRS screener identifies approximately 2 in 3 adults with ADHD. Approximately 1 in 3 adults with ADHD will score below the threshold. A negative result does not mean you do not have ADHD."*
- In-app results screen — reproduce this statement verbatim beneath the ASRS score display

**Verification method:** Results screen copy review against LB-001 Section 7
**Acceptance criterion:** Statement present verbatim on results screen for all users regardless of ASRS score

**Status:** Specified — pending implementation

---

#### RC-03 — Screening Framing in Intended Purpose

**Hazards addressed:** H1
**Control type:** IFS

**Requirement:**
The intended purpose statement, welcome screen, and all results language shall frame ClarityCheck as a screening support tool, not an assessment or diagnostic tool.

**Implementation:**
- Intended purpose statement (DC-002 §2) — uses term "screening support"
- LB-001 Section 1 — "ClarityCheck is a screening tool. It is not a diagnostic tool."
- Welcome screen — shall reproduce LB-001 Section 1 key statement
- Results screen — shall not use terms "assessment", "diagnosis", or "diagnostic"

**Verification method:** Linguistic audit of all user-facing screens against prohibited terminology list
**Acceptance criterion:** Zero instances of diagnostic framing in user-facing text

**Status:** Specified — pending implementation

---

#### RC-04 — Non-Diagnostic Language in Results

**Hazards addressed:** H2, H6, H12
**Control type:** IFS

**Requirement:**
All results screen text shall use language consistent with screening output, not clinical diagnosis.

**Implementation:**
- Approved phrasing: *"Your responses suggest symptoms consistent with..."*
- Prohibited phrasing: *"You have..."*, *"You are diagnosed with..."*, *"This confirms..."*
- LB-001 Section 7 — score interpretation tables use approved phrasing throughout
- In-app results screen — mirror LB-001 Section 7 exactly

**Verification method:** Copy review of results screen against approved/prohibited phrasing list
**Acceptance criterion:** No prohibited phrasing present anywhere in results output

**Status:** Specified — pending implementation

---

#### RC-05 — Avoid Diagnostic Framing in Output Text

**Hazards addressed:** H2, H6
**Control type:** IFS

**Requirement:**
Score category labels shall not imply clinical diagnosis. Severity language shall be qualified with explicit screening context.

**Implementation:**
- Score categories use descriptive terms (e.g. *Moderate symptoms* not *Moderate depression*)
- Each category description includes a qualifier: *"...that are worth discussing with your doctor"* not *"...indicating a diagnosis of..."*
- LB-001 Section 7 score tables — category descriptions follow this pattern throughout

**Verification method:** Copy review of all score category labels and descriptions
**Acceptance criterion:** All category descriptions include clinical referral qualifier; none imply diagnosis

**Status:** Specified — pending implementation

---

#### RC-06 — PHQ-9 Limitation Disclaimer

**Hazards addressed:** H3
**Control type:** IFS

**Requirement:**
The PHQ-9 results section shall include a statement that the PHQ-9 screens for depression symptoms and does not rule out depression on a negative result.

**Implementation:**
- LB-001 Section 7 PHQ-9 table — includes statement: *"A score of 10 or above does not mean you have depression. It means your symptoms are significant enough to warrant a clinical assessment."*
- Equivalent negative result disclaimer per RC-01
- In-app results screen — mirror LB-001 language

**Verification method:** Results screen review
**Acceptance criterion:** Both statements present on PHQ-9 results section

**Status:** Specified — pending implementation

---

#### RC-07 — Persistent Mood Advisory in IFU

**Hazards addressed:** H3, H4
**Control type:** IFS

**Requirement:**
The IFU shall advise users to seek clinical advice for persistent mood or anxiety symptoms regardless of score.

**Implementation:**
- LB-001 Section 8 Limitations: *"A negative result does not rule anything out... if you still have significant concerns, please speak to your doctor."*
- LB-001 Section 3: explicit statement that ClarityCheck does not cover all possible conditions

**Verification method:** LB-001 review against RC requirement
**Acceptance criterion:** Advisory present in IFU Sections 3 and 8

**Status:** Implemented in LB-001 v1.0 — verified at document level

---

#### RC-08 — GAD-7 Limitation Disclaimer

**Hazards addressed:** H4
**Control type:** IFS

**Requirement:**
The GAD-7 results section shall include an equivalent disclaimer to RC-06 for anxiety.

**Implementation:**
- LB-001 Section 7 GAD-7 table: *"A score of 10 or above does not mean you have an anxiety disorder. It means your symptoms are significant enough to warrant a clinical assessment."*
- In-app results screen — mirror LB-001 language

**Verification method:** Results screen review
**Acceptance criterion:** Disclaimer present on GAD-7 results section

**Status:** Specified — pending implementation

---

#### RC-09 — PHQ-9 Item 9 Crisis Trigger ⚠️ MANDATORY

**Hazards addressed:** H5
**Control type:** PM (Protective measure)

**Requirement:**
The system shall detect any non-zero response to PHQ-9 item 9 and trigger a crisis resource screen before displaying results. This is a mandatory software behaviour with no override.

**Implementation:**
- Software logic: if PHQ-9 item 9 response > 0 then display crisis screen before results
- Crisis screen shall be displayed regardless of overall PHQ-9 score
- Trigger condition: item 9 responses 1 (*Several days*), 2 (*More than half the days*), or 3 (*Nearly every day*) all trigger the crisis screen
- FR-19 in DC-002

**Verification method:** Functional test — test cases shall cover all four possible item 9 response values (0, 1, 2, 3); confirm crisis screen triggered for values 1–3 and not triggered for value 0
**Acceptance criterion:** Crisis screen displayed for all non-zero item 9 responses in 100% of test executions; not displayed for zero response

**Status:** Specified — pending implementation
**Note:** Implementation and verification of RC-09 are mandatory release criteria. Device shall not be released without verified RC-09 implementation.

---

#### RC-10 — Crisis Prompt Content

**Hazards addressed:** H5
**Control type:** PM + IFS

**Requirement:**
The crisis screen triggered by RC-09 shall display crisis helpline information in plain language with sufficient prominence to be seen immediately.

**Implementation:**
- Crisis screen headline: *"Before you continue — if you are in crisis, please reach out for support"*
- Display crisis helpline numbers for target deployment regions
- Minimum content per LB-001 Section 1:
  - UK: Samaritans 116 123
  - US: 988 Suicide and Crisis Lifeline
  - EU: findahelpline.com reference
- FR-20 in DC-002
- Crisis resources also persistently accessible throughout assessment per RC-28

**Verification method:** UI review of crisis screen content against LB-001 Section 1 reference; check display on mobile and desktop viewport sizes
**Acceptance criterion:** All required helpline references present; text legible at minimum viewport width (320px)

**Status:** Specified — pending confirmation of regional helpline references (RM-002 OI-01)

---

#### RC-11 — Crisis Prompt Acknowledgement Gate

**Hazards addressed:** H5
**Control type:** PM

**Requirement:**
The crisis screen shall require a user acknowledgement before the user can proceed to results. The gate shall not prevent proceeding — user autonomy is preserved — but the screen cannot be bypassed without interaction.

**Implementation:**
- Crisis screen shall display a button: *"I have read the above. Continue to my results."*
- Results shall not be displayed until this button is activated
- No timeout — screen persists until user acts
- FR-21 in DC-002

**Verification method:** Functional test — confirm results screen is inaccessible until acknowledgement button is activated
**Acceptance criterion:** Results screen unreachable without acknowledgement in 100% of test executions

**Status:** Specified — pending implementation

---

#### RC-12 — IFU Safeguarding Section

**Hazards addressed:** H5
**Control type:** IFS

**Requirement:**
The IFU shall include a dedicated safeguarding section with crisis resources and an advisory for users in acute distress.

**Implementation:**
- LB-001 Section 1 — *"Important — Please Read Before You Start"* — crisis resources and advisory present
- Crisis helplines listed for UK, US, EU as minimum

**Verification method:** LB-001 review
**Acceptance criterion:** Crisis resources present in LB-001 Section 1; regional helplines confirmed

**Status:** Implemented in LB-001 v1.0 — helpline confirmation outstanding (OI-04)

---

#### RC-13 — Welcome Screen Crisis Advisory

**Hazards addressed:** H5, H10
**Control type:** IFS

**Requirement:**
The application welcome screen shall include a prominent advisory that users in acute crisis should not use the app and should contact a crisis service instead.

**Implementation:**
- Welcome screen shall include verbatim or equivalent to LB-001 Section 1 crisis advisory
- Advisory shall appear before the age acknowledgement gate (RC-26)
- Crisis resource link shall be present on welcome screen

**Verification method:** UI review of welcome screen content against LB-001 Section 1
**Acceptance criterion:** Crisis advisory and resource link present and prominent on welcome screen

**Status:** Specified — pending implementation

---

#### RC-14 — Visible Disclaimer on All Results Elements

**Hazards addressed:** H6
**Control type:** IFS

**Requirement:**
Every distinct section of the results screen shall carry a visible disclaimer that results are not a diagnosis.

**Implementation:**
- Results screen design specification (DC-003): each instrument results card shall include a disclaimer element
- Disclaimer text: *"This is a screening result, not a diagnosis."*
- Disclaimer shall not be hidden below the fold or require scrolling to be visible

**Verification method:** UI review on mobile and desktop viewports; confirm disclaimer visible without scrolling for each results card
**Acceptance criterion:** Disclaimer visible on initial display of each results card without scrolling on all supported viewport sizes

**Status:** Specified — pending DC-003 and implementation

---

#### RC-15 — Screening vs Diagnosis Explanation in IFU

**Hazards addressed:** H6
**Control type:** IFS

**Requirement:**
The IFU shall include an explanation of the difference between screening and diagnosis in plain language.

**Implementation:**
- LB-001 Section 1: *"ClarityCheck is a screening tool. It is not a diagnostic tool. It cannot tell you whether you have ADHD or any other condition. Only a qualified healthcare professional can do that."*
- LB-001 Section 8 Limitations: dedicated limitations section addresses this distinction

**Verification method:** LB-001 review
**Acceptance criterion:** Distinction between screening and diagnosis explained clearly in Sections 1 and 8 of LB-001

**Status:** Implemented in LB-001 v1.0

---

#### RC-16 — No Use of "Diagnosis/Diagnose" in User-Facing Text

**Hazards addressed:** H6, H12
**Control type:** ISD

**Requirement:**
The words "diagnosis", "diagnose", "diagnosed", and "diagnostic" shall not appear in any user-facing text within the application except in the context of explicitly stating that ClarityCheck is *not* a diagnostic tool.

**Implementation:**
- Prohibited term list maintained in DC-003 Design Outputs
- UI copy review step in DC-004 Verification Plan
- Exception: *"ClarityCheck is not a diagnostic tool"* — this usage is required and permitted

**Verification method:** Automated text search of all user-facing string resources for prohibited terms; manual review of exceptions
**Acceptance criterion:** Zero non-permitted uses of prohibited terms in deployed application

**Status:** Specified — pending implementation and DC-003

---

#### RC-17 — Scoring Algorithm Test Cases

**Hazards addressed:** H7
**Control type:** ISD

**Requirement:**
Scoring algorithms for all three instruments shall be verified against a complete set of test cases covering all score boundary values before release.

**Implementation:**
- DC-004 Verification Plan shall define test cases for:
  - ASRS Part A: all 6 response combinations at the threshold boundary; edge cases (all 0, all maximum)
  - PHQ-9: scores 0, 4, 5, 9, 10, 14, 15, 19, 20, 27
  - GAD-7: scores 0, 4, 5, 9, 10, 14, 15, 21
- Expected outputs for each test case calculated manually and recorded in DC-003

**Verification method:** Automated unit test suite; test results recorded in DC-004
**Acceptance criterion:** 100% pass rate on all defined test cases

**Status:** Specified — test cases to be defined in DC-003 and DC-004

---

#### RC-18 — ASRS Threshold Logic Verified Against Kessler 2005

**Hazards addressed:** H7
**Control type:** ISD

**Requirement:**
The ASRS Part A threshold scoring logic — including the item-specific response threshold mapping — shall be verified item by item against the published Kessler 2005 scoring grid.

**Implementation:**
- The ASRS Part A uses a non-uniform threshold: different response options constitute a positive response for different items (some items threshold at "Sometimes", others at "Often")
- DC-003 shall include a reference table mapping each item number to its threshold response value, sourced directly from the published instrument
- Implementation shall be verified against this reference table

**Verification method:** Item-by-item comparison of implemented threshold logic against DC-003 reference table
**Acceptance criterion:** Implemented threshold matches reference table for all 6 items

**Status:** Specified — reference table to be created in DC-003

---

#### RC-19 — Automated Unit Tests for Scoring Functions

**Hazards addressed:** H7
**Control type:** ISD

**Requirement:**
Automated unit tests shall be written for all scoring functions and shall pass before each release.

**Implementation:**
- Unit tests shall cover all scoring functions: ASRS Part A threshold, PHQ-9 sum, GAD-7 sum, severity category assignment for all three instruments
- Tests shall be run as part of the build process
- Test results shall be recorded in DC-004

**Verification method:** CI build log or manual test execution record in DC-004
**Acceptance criterion:** All unit tests pass; no scoring function released without test coverage

**Status:** Specified — pending implementation

---

#### RC-20 — Reference Scoring Table in DC-003

**Hazards addressed:** H7
**Control type:** ISD

**Requirement:**
DC-003 Design Outputs shall contain a reference scoring specification for all three instruments serving as the ground truth for verification.

**Implementation:**
- DC-003 to include:
  - ASRS Part A: item list, response options, threshold mapping per item, positive screen criteria
  - PHQ-9: item list, response values (0–3), sum calculation, severity thresholds (5/10/15/20)
  - GAD-7: item list, response values (0–3), sum calculation, severity thresholds (5/10/15)

**Verification method:** DC-003 reference table reviewed against published instrument specifications before use in verification
**Acceptance criterion:** Reference table accurately reflects published scoring for all three instruments; reviewed and signed off in DC-003

**Status:** Specified — pending DC-003

---

#### RC-21 — Instrument Text Locked in DC-003

**Hazards addressed:** H8
**Control type:** ISD

**Requirement:**
The verbatim text of all 22 items and all response options for all three instruments shall be recorded in DC-003 as the locked reference specification.

**Implementation:**
- DC-003 to include complete item text for all 22 questions exactly as published
- Response option text locked for each item
- Any deviation from published text constitutes a nonconformity requiring change control

**Verification method:** Character-level comparison of deployed item text against DC-003 reference (RC-22)
**Acceptance criterion:** DC-003 reference text matches published instrument specifications; deployed text matches DC-003

**Status:** Specified — pending DC-003

---

#### RC-22 — Character-Level Text Verification

**Hazards addressed:** H8
**Control type:** ISD

**Requirement:**
A verification step in DC-004 shall confirm that all deployed item text matches the DC-003 reference specification at the character level.

**Implementation:**
- DC-004 test procedure: extract all item text strings from the deployed application and compare against DC-003 reference
- Automated string comparison preferred; manual comparison acceptable for v1.0
- Verification applies to: item text, response option text, scoring labels

**Verification method:** String comparison test documented in DC-004
**Acceptance criterion:** Zero character-level deviations between deployed text and DC-003 reference

**Status:** Specified — pending DC-003 and DC-004

---

#### RC-23 — Change Control Re-Verification Requirement

**Hazards addressed:** H8
**Control type:** ISD

**Requirement:**
The change control procedure shall require re-execution of instrument text and scoring verification (RC-22, RC-17) for any change to instrument content, scoring logic, or results display.

**Implementation:**
- QM-004 Change Control Procedure shall list RC-17 and RC-22 verification activities as mandatory for any change affecting instrument content or scoring
- Change records shall reference verification evidence

**Verification method:** QM-004 procedure review; change record audit
**Acceptance criterion:** QM-004 explicitly requires re-verification for instrument content and scoring changes

**Status:** Specified — pending QM-004

---

#### RC-24 — Age Restriction on Welcome Screen

**Hazards addressed:** H9
**Control type:** IFS

**Requirement:**
The welcome screen shall prominently state that ClarityCheck is intended for users aged 18 and over.

**Implementation:**
- Welcome screen text shall include: *"ClarityCheck is for adults aged 18 and over."*
- Age statement shall appear before the user proceeds to any questions
- LB-001 Section 2 is the reference

**Verification method:** UI review of welcome screen
**Acceptance criterion:** Age restriction statement present and prominent on welcome screen

**Status:** Specified — pending implementation

---

#### RC-25 — Age Restriction and Paediatric Tools in IFU

**Hazards addressed:** H9
**Control type:** IFS

**Requirement:**
The IFU shall state the age restriction and advise users under 18 to seek appropriate paediatric assessment.

**Implementation:**
- LB-001 Section 2: *"Do not use ClarityCheck if you are under 18... If you are under 18 and have concerns about ADHD, please speak to your doctor or a parent or guardian."*

**Verification method:** LB-001 review
**Acceptance criterion:** Age restriction and paediatric referral advisory present in LB-001 Section 2

**Status:** Implemented in LB-001 v1.0

---

#### RC-26 — Age Acknowledgement Gate

**Hazards addressed:** H9
**Control type:** PM

**Requirement:**
The application shall present an acknowledgement gate on the welcome screen requiring the user to confirm they are 18 or over before proceeding to the assessment.

**Implementation:**
- Welcome screen gate: checkbox or button — *"I confirm that I am 18 years of age or over."*
- Assessment shall not begin until gate is activated
- Gate is a self-declaration only — technical age verification is not feasible without account creation (excluded per CON-04)

**Verification method:** Functional test — confirm assessment inaccessible until age gate is activated
**Acceptance criterion:** Assessment unreachable without age acknowledgement in 100% of test executions

**Status:** Specified — pending implementation

---

#### RC-27 — Emotional Content Advisory on Welcome Screen

**Hazards addressed:** H10
**Control type:** IFS

**Requirement:**
The welcome screen shall advise the user that the assessment includes questions about mood and emotional wellbeing and that they may stop at any time.

**Implementation:**
- Welcome screen text: *"This assessment includes questions about your mood, anxiety, and emotional wellbeing. You may stop at any time."*
- LB-001 Section 5: *"Some questions ask about sensitive topics including mood, anxiety, and thoughts of self-harm. It is best to complete ClarityCheck somewhere you feel safe and are not rushed."*

**Verification method:** UI review of welcome screen
**Acceptance criterion:** Emotional content advisory present on welcome screen before assessment begins

**Status:** Specified — pending implementation

---

#### RC-28 — Persistent Crisis Resource Link Throughout Assessment

**Hazards addressed:** H10, H5
**Control type:** PM + IFS

**Requirement:**
A crisis resource link shall be accessible at all times during the assessment, not only on the results screen or crisis screen.

**Implementation:**
- A persistent UI element (e.g. footer link or help icon) shall be present on all question screens
- Link text: *"In crisis? Get help now"* or equivalent
- Link shall navigate to crisis resources screen (same content as RC-10)

**Verification method:** UI review of all question screens; confirm crisis link present and functional on each screen
**Acceptance criterion:** Crisis link present and functional on 100% of question screens across all three instruments

**Status:** Specified — pending implementation

---

#### RC-29 — Disclaimer Header on Printed/Saved Results

**Hazards addressed:** H11
**Control type:** IFS

**Requirement:**
The printed or saved results document shall include a prominent header disclaimer identifying the document as a screening output and not a clinical record.

**Implementation:**
- Results document header: *"This document is a self-reported screening output and does not constitute a clinical assessment or diagnosis. It should only be shared with a qualified healthcare professional."*
- LB-001 Section 9 is the reference
- Disclaimer shall appear at the top of the document, before any scores

**Verification method:** Generate sample results PDF/print output and review against LB-001 Section 9
**Acceptance criterion:** Disclaimer present at top of results document; text matches LB-001 Section 9 reference

**Status:** Specified — pending FR-17 implementation

---

#### RC-30 — Results Sharing Guidance in IFU

**Hazards addressed:** H11
**Control type:** IFS

**Requirement:**
The IFU shall include explicit guidance on appropriate and inappropriate sharing of results.

**Implementation:**
- LB-001 Section 9 — includes positive list (share with GP, psychiatrist, psychologist) and negative list (do not share with employers, insurers, schools)

**Verification method:** LB-001 review
**Acceptance criterion:** Both positive and negative sharing guidance present in LB-001 Section 9

**Status:** Implemented in LB-001 v1.0

---

#### RC-31 — Non-Clinical Formatting for Results Document

**Hazards addressed:** H11
**Control type:** ISD

**Requirement:**
The results document shall not use formatting that could be mistaken for a medical record or clinical report.

**Implementation:**
- DC-003 shall specify results document design: no clinical letterhead, no medical record number field, no clinical report structure
- Document title shall be: *"ClarityCheck Screening Results"* — not *"Clinical Assessment Report"* or similar
- Font, layout, and terminology shall be clearly consumer-facing

**Verification method:** Design review of results document against DC-003 specification
**Acceptance criterion:** Results document does not resemble a clinical record; reviewed and approved in DC-003

**Status:** Specified — pending DC-003

---

#### RC-32 — Self-Medication Warning in Results and IFU

**Hazards addressed:** H12
**Control type:** IFS

**Requirement:**
The results screen and IFU shall explicitly state that ADHD medication requires clinical assessment and prescription and must not be self-administered.

**Implementation:**
- LB-001 Section 10: *"ADHD medication... requires a formal clinical assessment and a prescription from a qualified doctor. It must not be obtained or used without professional supervision. A positive result on the ClarityCheck ADHD screener is not a basis for self-medicating."*
- Results screen: if ASRS Part A is positive, display a brief version of this warning alongside the result

**Verification method:** LB-001 review; UI review of ASRS positive results screen
**Acceptance criterion:** Self-medication warning present in LB-001 Section 10; brief warning present on ASRS positive result display

**Status:** IFU implemented in LB-001 v1.0; in-app warning pending implementation

---

### 4. Risk Control Implementation Summary

| RC | Type | Hazard(s) | Implementation Location | Status |
|---|---|---|---|---|
| RC-01 | IFS | H1, H3, H4 | Results screen, LB-001 §7 | Pending |
| RC-02 | IFS | H1 | Results screen, LB-001 §7 | Pending |
| RC-03 | IFS | H1 | Intended purpose, welcome screen, LB-001 §1 | Partial |
| RC-04 | IFS | H2, H6, H12 | Results screen, LB-001 §7 | Pending |
| RC-05 | IFS | H2, H6 | Results screen, LB-001 §7 | Pending |
| RC-06 | IFS | H3 | Results screen, LB-001 §7 | Pending |
| RC-07 | IFS | H3, H4 | LB-001 §3, §8 | Implemented |
| RC-08 | IFS | H4 | Results screen, LB-001 §7 | Pending |
| RC-09 | PM | H5 | Software — FR-19 | **Mandatory — pending** |
| RC-10 | PM+IFS | H5 | Crisis screen, LB-001 §1 | Partial |
| RC-11 | PM | H5 | Software — FR-21 | **Mandatory — pending** |
| RC-12 | IFS | H5 | LB-001 §1 | Implemented |
| RC-13 | IFS | H5, H10 | Welcome screen, LB-001 §1 | Pending |
| RC-14 | IFS | H6 | Results screen — DC-003 | Pending |
| RC-15 | IFS | H6 | LB-001 §1, §8 | Implemented |
| RC-16 | ISD | H6, H12 | UI copy — DC-003 | Pending |
| RC-17 | ISD | H7 | DC-003, DC-004 | Pending |
| RC-18 | ISD | H7 | DC-003, DC-004 | Pending |
| RC-19 | ISD | H7 | Software — unit tests | Pending |
| RC-20 | ISD | H7 | DC-003 | Pending |
| RC-21 | ISD | H8 | DC-003 | Pending |
| RC-22 | ISD | H8 | DC-004 | Pending |
| RC-23 | ISD | H8 | QM-004 | Pending |
| RC-24 | IFS | H9 | Welcome screen | Pending |
| RC-25 | IFS | H9 | LB-001 §2 | Implemented |
| RC-26 | PM | H9 | Welcome screen — software | Pending |
| RC-27 | IFS | H10 | Welcome screen, LB-001 §5 | Pending |
| RC-28 | PM+IFS | H10, H5 | All question screens | Pending |
| RC-29 | IFS | H11 | Results document header | Pending |
| RC-30 | IFS | H11 | LB-001 §9 | Implemented |
| RC-31 | ISD | H11 | DC-003, results document | Pending |
| RC-32 | IFS | H12 | Results screen, LB-001 §10 | Partial |

---

### 5. Mandatory Release Criteria

The following risk controls are mandatory release criteria. The device shall not be released without verified implementation of all of the following:

| RC | Description |
|---|---|
| RC-09 | PHQ-9 item 9 crisis trigger — functional test 100% pass |
| RC-11 | Crisis acknowledgement gate — functional test 100% pass |
| RC-26 | Age acknowledgement gate — functional test 100% pass |
| RC-17 | Scoring algorithm test cases — 100% pass |
| RC-18 | ASRS threshold logic verified against Kessler 2005 |
| RC-19 | Automated unit tests passing for all scoring functions |
| RC-22 | Character-level text verification — zero deviations |

---

### 6. Verification Traceability

Full verification evidence for each RC is recorded in **DC-004 Verification and Validation Plan**. RM-003 specifies the requirement; DC-004 specifies the test and records the result.

| RM-003 RC | DC-004 Test Reference |
|---|---|
| RC-09 | To be assigned in DC-004 |
| RC-11 | To be assigned in DC-004 |
| RC-17 | To be assigned in DC-004 |
| RC-18 | To be assigned in DC-004 |
| RC-19 | To be assigned in DC-004 |
| RC-22 | To be assigned in DC-004 |
| RC-26 | To be assigned in DC-004 |
| All others | To be assigned in DC-004 |

---

### 7. Review and Approval

| Role | Name | Date | Signature |
|---|---|---|---|
| Author / PRRC | | 2026-04-10 | |

---

### 8. Open Items

| ID | Item | Owner | Due |
|---|---|---|---|
| OI-01 | Confirm crisis helpline references for RC-10 (linked to RM-002 OI-01, LB-001 OI-04) | PRRC | Before release |
| OI-02 | DC-003 required to complete RC-16, RC-17, RC-18, RC-20, RC-21, RC-31 | PRRC | Next milestone |
| OI-03 | DC-004 required to assign test references for all RCs | PRRC | After DC-003 |
| OI-04 | QM-004 required to implement RC-23 | PRRC | QMS milestone |

---

RM-003 is now complete. The risk management file is structurally solid:

| Document | Status |
|---|---|
| RM-001 Risk Management Plan | ✅ Complete |
| RM-002 Risk Assessment FMEA | ✅ Complete |
| RM-003 Risk Control Measures | ✅ Complete |
| RM-004 Residual Risk Evaluation | Pending — needs CE-002 first |

The critical dependency for RM-004 is the clinical benefit evidence from CE-002. The critical dependency for most pending RCs is **DC-003 Design Outputs**, which locks instrument text, scoring tables, and results document design.

**DC-003** is the most unblocking next step. Ready to write it?