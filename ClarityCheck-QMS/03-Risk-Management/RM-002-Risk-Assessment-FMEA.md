## RM-002 Risk Assessment (FMEA) — ClarityCheck v1.0

**Document ID:** RM-002
**Title:** Risk Assessment — Failure Mode and Effects Analysis
**Version:** 1.0
**Date:** 2026-04-10
**Status:** Draft
**Author:** [Solo Developer / PRRC]
**Related Documents:** RM-001 Risk Management Plan, DC-002 Design Inputs

---

### 1. Purpose

This document records the hazard identification, risk estimation, risk evaluation, and initial risk control identification for ClarityCheck v1.0 in accordance with ISO 14971:2019 §5–8. Each hazard identified in RM-001 §9 is analysed here. Risk controls are specified at the level of category; detailed implementation is recorded in RM-003.

---

### 2. Severity and Probability Scales

As defined in RM-001 §7.

**Severity:** S1 Negligible / S2 Minor / S3 Serious / S4 Critical
**Probability:** P1 Improbable / P2 Remote / P3 Occasional / P4 Probable
**Risk level:** Acceptable / ALARP / Unacceptable

---

### 3. FMEA Table

---

#### H1 — False Negative: ADHD Screen

**Hazard:** User with clinically significant ADHD scores below the ASRS Part A threshold and is not flagged as a positive screen.

**Hazardous Situation:** User concludes they do not have ADHD, does not seek clinical consultation, continues to experience untreated impairment.

**Harm:** Delayed diagnosis, continued occupational, social, and psychological impairment.

| | Pre-Control |
|---|---|
| Severity | S3 Serious |
| Probability | P3 Occasional |
| Risk Level | ALARP |

**Contributing Causes:**
- ASRS Part A sensitivity is 68.7% — approximately 1 in 3 true cases will not screen positive
- Lay user may not appreciate limitations of a screening tool
- No clinician involved to contextualise a negative result

**Risk Controls:**
- RC-01: IFU and in-app labeling shall state explicitly that a negative result does not exclude ADHD and that clinical assessment is required if symptoms persist
- RC-02: Results screen shall include plain-language statement: *A score below the threshold does not mean you do not have ADHD. If you have concerns, speak to your doctor regardless of your score.*
- RC-03: Intended purpose statement shall frame the tool as a screening aid, not a rule-out instrument

**Residual Probability after controls:** P2 Remote
**Residual Risk Level:** Acceptable

---

#### H2 — False Positive: ADHD Screen

**Hazard:** User without clinically significant ADHD scores at or above the ASRS Part A threshold.

**Hazardous Situation:** User believes they have ADHD, seeks unnecessary clinical referral, or self-labels with consequent psychological impact.

**Harm:** Unnecessary anxiety, stigma, inappropriate self-medication, wasted clinical resources.

| | Pre-Control |
|---|---|
| Severity | S2 Minor |
| Probability | P2 Remote |
| Risk Level | Acceptable |

**Contributing Causes:**
- ASRS Part A specificity 99.5% — false positive rate very low but not zero
- Lay user may interpret a positive screen as a diagnosis

**Risk Controls:**
- RC-04: Results screen shall state clearly that a positive screen is not a diagnosis and requires clinical confirmation
- RC-05: Plain-language interpretation shall avoid diagnostic language (e.g. *Your responses suggest symptoms consistent with ADHD* rather than *You have ADHD*)

**Residual Risk Level:** Acceptable — specificity 99.5% means this hazard is rare; labeling controls sufficient.

---

#### H3 — False Negative: Depression (PHQ-9)

**Hazard:** User with clinically significant depression scores below PHQ-9 threshold.

**Hazardous Situation:** Depression not flagged; user does not seek help for depression.

**Harm:** Untreated depression, worsening mental health, in severe cases risk of self-harm.

| | Pre-Control |
|---|---|
| Severity | S3 Serious |
| Probability | P2 Remote |
| Risk Level | ALARP |

**Contributing Causes:**
- PHQ-9 sensitivity 88% at cutoff ≥10 — approximately 1 in 8 cases missed
- User may underreport symptoms due to stigma or lack of self-awareness
- No clinical oversight of administration

**Risk Controls:**
- RC-06: Results screen shall include statement that the PHQ-9 screens for depression symptoms only and does not rule out depression
- RC-07: IFU shall advise users experiencing persistent low mood to seek clinical advice regardless of score
- RC-01 (shared): General negative result disclaimer covers this hazard

**Residual Probability after controls:** P1 Improbable
**Residual Risk Level:** Acceptable

---

#### H4 — False Negative: Anxiety (GAD-7)

**Hazard:** User with clinically significant anxiety scores below GAD-7 threshold.

**Hazardous Situation:** Anxiety not flagged; user does not seek help for anxiety.

**Harm:** Untreated anxiety disorder, continued impairment.

| | Pre-Control |
|---|---|
| Severity | S3 Serious |
| Probability | P2 Remote |
| Risk Level | ALARP |

**Contributing Causes:**
- GAD-7 sensitivity 89% at cutoff ≥10
- Same underreporting and self-awareness limitations as PHQ-9

**Risk Controls:**
- RC-08: Results screen shall include equivalent disclaimer for GAD-7 as for PHQ-9
- RC-01, RC-07 (shared): General disclaimers cover this hazard

**Residual Probability after controls:** P1 Improbable
**Residual Risk Level:** Acceptable

---

#### H5 — Suicidal Ideation Not Acted Upon

**Hazard:** User selects a non-zero response to PHQ-9 item 9 (thoughts of being better off dead or of hurting yourself) but is not directed to crisis support.

**Hazardous Situation:** User in acute psychological distress completes assessment and receives only a score, with no safeguarding response.

**Harm:** Escalation of suicidal crisis without intervention; in worst case, death.

| | Pre-Control |
|---|---|
| Severity | S4 Critical |
| Probability | P2 Remote |
| Risk Level | ALARP |

**Contributing Causes:**
- Vulnerable population — adults with undiagnosed ADHD have elevated rates of depression and suicidal ideation
- Self-administered, unsupervised — no clinician to detect and respond to distress
- Software without safeguarding response is a foreseeable misuse scenario

**Risk Controls:**
- RC-09: The system shall detect any non-zero response to PHQ-9 item 9 and trigger a crisis resource prompt before displaying results (FR-19, FR-20)
- RC-10: Crisis prompt shall display prominently, in plain language, with direct reference to a crisis helpline
- RC-11: Crisis prompt shall not block completion — user autonomy preserved — but must be acknowledged before proceeding
- RC-12: IFU shall include a dedicated section on safeguarding, including crisis resources
- RC-13: Welcome screen shall advise users in acute crisis to contact a clinician or crisis service before proceeding

**Residual Probability after controls:** P1 Improbable
**Residual Risk Level:** ALARP — residual risk cannot be eliminated entirely in an unsupervised self-assessment context. Risk-benefit analysis in RM-004 shall demonstrate that clinical benefit of early ADHD screening outweighs this residual risk, and that the safeguarding controls represent best practicable mitigation.

**Note:** This is the highest-severity hazard in the assessment. Implementation of RC-09 through RC-13 is mandatory before v1.0 release. Verification evidence required in DC-004.

---

#### H6 — Misinterpretation of Results

**Hazard:** User treats scored output as a clinical diagnosis and does not seek professional follow-up.

**Hazardous Situation:** User self-labels as having ADHD (or not), makes life decisions on this basis without clinical confirmation.

**Harm:** Delayed appropriate diagnosis, self-medication, stigma, inappropriate medication decisions.

| | Pre-Control |
|---|---|
| Severity | S3 Serious |
| Probability | P3 Occasional |
| Risk Level | ALARP |

**Contributing Causes:**
- Lay users may not distinguish screening from diagnosis
- Digital health tools are widely perceived as more authoritative than intended
- No clinician present to contextualise output

**Risk Controls:**
- RC-04, RC-05 (shared): Non-diagnostic language throughout
- RC-14: Every results screen element shall carry a visible disclaimer
- RC-15: IFU shall include a dedicated section explaining the difference between screening and diagnosis
- RC-16: App shall not use the word "diagnosis" or "diagnose" anywhere in user-facing text

**Residual Probability after controls:** P2 Remote
**Residual Risk Level:** Acceptable

---

#### H7 — Scoring Error

**Hazard:** Software calculates an incorrect score due to an implementation defect.

**Hazardous Situation:** User receives an incorrect severity category, potentially leading to wrong action (false reassurance or unnecessary alarm).

**Harm:** Delayed treatment or unnecessary clinical burden depending on direction of error.

| | Pre-Control |
|---|---|
| Severity | S3 Serious |
| Probability | P2 Remote |
| Risk Level | ALARP |

**Contributing Causes:**
- Manual implementation of scoring algorithms without automated verification
- Edge cases in response encoding (e.g. ASRS threshold shading logic)
- Browser-side JavaScript execution variability

**Risk Controls:**
- RC-17: Scoring algorithms shall be implemented against published specification and verified with a complete set of test cases covering all score boundaries (DC-004)
- RC-18: ASRS Part A threshold logic shall be verified against the Kessler 2005 published scoring grid item by item
- RC-19: Automated unit tests shall be written for all scoring functions prior to release
- RC-20: A reference manual scoring table shall be maintained in DC-003 Design Outputs as the verification reference

**Residual Probability after controls:** P1 Improbable
**Residual Risk Level:** Acceptable

---

#### H8 — Instrument Modification

**Hazard:** Item wording, response options, or scoring algorithm is inadvertently altered from the validated published version.

**Hazardous Situation:** Modified instrument produces scores that are not comparable to the validated normative data, generating incorrect severity categories.

**Harm:** Systematic misclassification of all users — false negatives or false positives at scale.

| | Pre-Control |
|---|---|
| Severity | S3 Serious |
| Probability | P2 Remote |
| Risk Level | ALARP |

**Contributing Causes:**
- Typos or reformatting during development
- Translation or truncation of item text for UI layout
- Change control failures during maintenance

**Risk Controls:**
- RC-21: All instrument item text, response options, and scoring algorithms shall be locked in DC-003 Design Outputs as the reference specification
- RC-22: A verification step in DC-004 shall compare deployed item text character-by-character against the reference specification
- RC-23: Change control procedure (QM-004) shall require re-verification of instrument fidelity for any content change

**Residual Probability after controls:** P1 Improbable
**Residual Risk Level:** Acceptable

---

#### H9 — Inappropriate Use: Under-18 Population

**Hazard:** Person under 18 uses ClarityCheck v1.0, which is validated and intended for adults only.

**Hazardous Situation:** Instrument scores applied to an adolescent using adult normative thresholds; incorrect severity classification.

**Harm:** False reassurance or inappropriate alarm; potential delay in appropriate paediatric assessment.

| | Pre-Control |
|---|---|
| Severity | S3 Serious |
| Probability | P3 Occasional |
| Risk Level | ALARP |

**Contributing Causes:**
- No age verification mechanism in v1.0
- Adolescents with ADHD concerns actively seek self-assessment tools
- App may be shared or accessed by minors without intended-user awareness

**Risk Controls:**
- RC-24: Welcome screen shall prominently state that the application is intended for users aged 18 and over
- RC-25: IFU shall state age restriction and explain that validated paediatric tools exist for under-18 assessment
- RC-26: User shall be asked to confirm they are 18 or over before proceeding (acknowledgement gate, not verified)

**Residual Probability after controls:** P2 Remote
**Residual Risk Level:** Acceptable — age cannot be technically enforced in a browser-based app without account creation (excluded by CON-04). Labeling controls are the practicable maximum.

---

#### H10 — Emotional Distress During Administration

**Hazard:** The process of answering questions about ADHD symptoms, depression, and anxiety triggers acute emotional distress in a vulnerable user.

**Hazardous Situation:** User experiences distress mid-assessment, abandons session in a dysregulated state without completing or receiving any results or support signposting.

**Harm:** Acute psychological distress without resolution or support.

| | Pre-Control |
|---|---|
| Severity | S2 Minor |
| Probability | P3 Occasional |
| Risk Level | ALARP |

**Contributing Causes:**
- Questions about depression and anxiety are emotionally loaded
- Unsupervised context means no clinician present to support
- Users may not anticipate the emotional content of a clinical questionnaire

**Risk Controls:**
- RC-27: Welcome screen shall advise users that the assessment includes questions about mood and emotional wellbeing, and that they may stop at any time
- RC-28: A crisis resource link shall be persistently accessible throughout the assessment, not only on the results screen
- RC-13 (shared): Welcome screen safeguarding advisory

**Residual Probability after controls:** P2 Remote
**Residual Risk Level:** Acceptable

---

#### H11 — Results Shared Without Context

**Hazard:** User prints or shares results with a third party (employer, insurer, school) who interprets them as a clinical document.

**Hazardous Situation:** Third party makes decisions about the user based on a screening score presented without clinical interpretation.

**Harm:** Discrimination, stigma, or adverse employment/insurance consequences.

| | Pre-Control |
|---|---|
| Severity | S3 Serious |
| Probability | P2 Remote |
| Risk Level | ALARP |

**Contributing Causes:**
- FR-17 requires a printable/saveable output — this is a necessary feature that also enables this hazard
- Users may not appreciate the risks of sharing uncontextualised screening results
- Third parties may lack health literacy to interpret results appropriately

**Risk Controls:**
- RC-29: The printed/saved results document shall include prominent header text: *This document is a self-reported screening output and does not constitute a clinical assessment or diagnosis. It should only be shared with a qualified healthcare professional.*
- RC-30: IFU shall advise users on appropriate and inappropriate sharing of results
- RC-31: Results document shall not use clinical report formatting that could be mistaken for a medical record

**Residual Probability after controls:** P2 Remote
**Residual Risk Level:** Acceptable — user behaviour outside the application cannot be fully controlled. Labeling and output design are the practicable maximum.

---

#### H12 — Use as Sole Basis for Self-Diagnosis and Self-Medication

**Hazard:** User uses a positive ASRS screen as justification for obtaining and self-administering ADHD medication (e.g. stimulants obtained without prescription).

**Hazardous Situation:** User self-medicates based on screening result without clinical evaluation or prescription.

**Harm:** Adverse effects of unsupervised stimulant use; missed comorbidities; delayed appropriate treatment.

| | Pre-Control |
|---|---|
| Severity | S4 Critical |
| Probability | P1 Improbable |
| Risk Level | ALARP |

**Contributing Causes:**
- ADHD medication is sought without prescription via online sources in some jurisdictions
- A positive screening result may be used to justify self-diagnosis to obtain medication
- App cannot control post-use behaviour

**Risk Controls:**
- RC-04, RC-05, RC-14, RC-16 (shared): Non-diagnostic language, prominent disclaimers
- RC-32: Results screen and IFU shall explicitly state that ADHD medication requires clinical assessment and prescription and must not be obtained or used without professional supervision

**Residual Probability after controls:** P1 Improbable
**Residual Risk Level:** Acceptable

---

### 4. Risk Summary Table

| Hazard | Severity | Prob (pre) | Risk (pre) | Key Controls | Prob (post) | Risk (post) |
|---|---|---|---|---|---|---|
| H1 ADHD false negative | S3 | P3 | ALARP | RC-01, RC-02, RC-03 | P2 | Acceptable |
| H2 ADHD false positive | S2 | P2 | Acceptable | RC-04, RC-05 | P2 | Acceptable |
| H3 PHQ-9 false negative | S3 | P2 | ALARP | RC-06, RC-07 | P1 | Acceptable |
| H4 GAD-7 false negative | S3 | P2 | ALARP | RC-08 | P1 | Acceptable |
| H5 Suicidal ideation | S4 | P2 | ALARP | RC-09–RC-13 | P1 | ALARP |
| H6 Misinterpretation | S3 | P3 | ALARP | RC-14–RC-16 | P2 | Acceptable |
| H7 Scoring error | S3 | P2 | ALARP | RC-17–RC-20 | P1 | Acceptable |
| H8 Instrument modification | S3 | P2 | ALARP | RC-21–RC-23 | P1 | Acceptable |
| H9 Under-18 use | S3 | P3 | ALARP | RC-24–RC-26 | P2 | Acceptable |
| H10 Emotional distress | S2 | P3 | ALARP | RC-27, RC-28 | P2 | Acceptable |
| H11 Results shared without context | S3 | P2 | ALARP | RC-29–RC-31 | P2 | Acceptable |
| H12 Self-medication | S4 | P1 | ALARP | RC-32 | P1 | Acceptable |

---

### 5. Outstanding Residual ALARP Risk

One hazard remains at ALARP after controls:

**H5 — Suicidal ideation not acted upon**

This hazard cannot be reduced to Acceptable in an unsupervised self-assessment context. No technically practicable control can guarantee a user in crisis will contact support services. The residual ALARP classification is accepted on the basis that:

- All reasonably practicable controls have been specified (RC-09 through RC-13)
- The clinical benefit of early ADHD and mental health screening in an underserved population demonstrably outweighs this residual risk
- The PHQ-9 item 9 safeguarding trigger is consistent with best practice in digital mental health tools
- This residual risk is formally accepted in RM-004

---

### 6. Risk Control Summary (RC Index)

| RC | Description | Hazard(s) | Implementation |
|---|---|---|---|
| RC-01 | Negative result disclaimer — general | H1, H3, H4 | LB-001, FR in DC-002 |
| RC-02 | ADHD negative result plain-language statement | H1 | Results screen |
| RC-03 | Screening framing in intended purpose | H1 | Intended purpose statement |
| RC-04 | Non-diagnostic language in results | H2, H6, H12 | UI copy, LB-001 |
| RC-05 | Avoid diagnostic framing in output text | H2, H6 | UI copy |
| RC-06 | PHQ-9 limitation disclaimer | H3 | Results screen |
| RC-07 | Persistent mood advisory in IFU | H3, H4 | LB-001 |
| RC-08 | GAD-7 limitation disclaimer | H4 | Results screen |
| RC-09 | PHQ-9 item 9 crisis trigger (FR-19) | H5 | Software — mandatory |
| RC-10 | Crisis prompt content (FR-20) | H5 | UI, LB-001 |
| RC-11 | Crisis prompt acknowledgement gate (FR-21) | H5 | Software |
| RC-12 | IFU safeguarding section | H5 | LB-001 |
| RC-13 | Welcome screen crisis advisory | H5, H10 | UI |
| RC-14 | Visible disclaimer on all results elements | H6 | UI |
| RC-15 | Screening vs diagnosis explanation in IFU | H6 | LB-001 |
| RC-16 | No use of "diagnosis/diagnose" in UI | H6, H12 | UI copy review |
| RC-17 | Scoring algorithm test cases (DC-004) | H7 | Verification |
| RC-18 | ASRS threshold logic verified against Kessler 2005 | H7 | Verification |
| RC-19 | Automated unit tests for scoring functions | H7 | Software |
| RC-20 | Reference scoring table in DC-003 | H7 | DC-003 |
| RC-21 | Instrument text locked in DC-003 | H8 | DC-003 |
| RC-22 | Character-level text verification in DC-004 | H8 | Verification |
| RC-23 | Change control re-verification requirement | H8 | QM-004 |
| RC-24 | Age restriction on welcome screen | H9 | UI |
| RC-25 | Age restriction and paediatric tools in IFU | H9 | LB-001 |
| RC-26 | Age acknowledgement gate | H9 | UI |
| RC-27 | Emotional content advisory on welcome screen | H10 | UI |
| RC-28 | Persistent crisis resource link throughout assessment | H10 | UI |
| RC-29 | Disclaimer header on printed/saved results | H11 | FR-17 output |
| RC-30 | Results sharing guidance in IFU | H11 | LB-001 |
| RC-31 | Non-clinical formatting for results document | H11 | UI/output design |
| RC-32 | Self-medication warning in results and IFU | H12 | UI, LB-001 |

---

### 7. Review and Approval

| Role | Name | Date | Signature |
|---|---|---|---|
| Author / PRRC | | 2026-04-10 | |

---

### 8. Open Items

| ID | Item | Owner | Due |
|---|---|---|---|
| OI-01 | Confirm crisis helpline references for RC-10 per target region | PRRC | Before DC-003 |
| OI-02 | Usability testing may surface additional use-error hazards — RM-002 to be updated post UE-003 | PRRC | After UE-003 |
| OI-03 | RM-004 benefit-risk analysis to formally accept H5 residual ALARP risk | PRRC | Before release |

---

RM-002 is now complete as a first-pass FMEA. The next logical documents are either:

- **RM-003 Risk Control Measures** — specifying exact implementation of each RC
- **CE-001 Clinical Evaluation Plan** — the evidence base that supports the benefit side of the benefit-risk analysis

The CE plan is needed before RM-004 can be completed, so **CE-001 is the critical path item**.

Ready to write it?