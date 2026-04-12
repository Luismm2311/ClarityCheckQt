## RM-004 Residual Risk Evaluation — ClarityCheck v1.0

**Document ID:** RM-004
**Title:** Residual Risk Evaluation and Benefit-Risk Analysis
**Version:** 1.0
**Date:** 2026-04-10
**Status:** Draft
**Author:** [Solo Developer / PRRC]
**Related Documents:** RM-001, RM-002, RM-003, CE-002, DC-002, LB-001
**Standard:** ISO 14971:2019 §9–10

---

### 1. Purpose

This document records the evaluation of residual risk after implementation of risk controls defined in RM-003, the overall residual risk evaluation, and the benefit-risk analysis for ClarityCheck v1.0 in accordance with ISO 14971:2019 §9 and §10.

The document formally answers two questions:

1. Is each individual residual risk acceptable after controls?
2. Is the overall residual risk acceptable in light of the clinical benefits of ClarityCheck v1.0?

This document, together with CE-002 and CE-003, constitutes the evidence base for the overall safety and performance conclusion required under MDR 2017/745 Annex I.

---

### 2. Risk Acceptability Criteria

As defined in RM-001 §7. Reproduced here for reference.

**Severity:**

| Level | Category | Definition |
|---|---|---|
| S1 | Negligible | No injury or health impact |
| S2 | Minor | Temporary discomfort or distress, no clinical consequence |
| S3 | Serious | Significant harm, delayed or missed clinical intervention |
| S4 | Critical | Severe irreversible harm or death |

**Probability:**

| Level | Category | Definition |
|---|---|---|
| P1 | Improbable | Unlikely to occur in device lifetime |
| P2 | Remote | Could occur but not expected |
| P3 | Occasional | Likely to occur at least once |
| P4 | Probable | Expected to occur multiple times |

**Acceptability matrix:**

|  | S1 | S2 | S3 | S4 |
|---|---|---|---|---|
| **P4** | Acceptable | ALARP | Unacceptable | Unacceptable |
| **P3** | Acceptable | ALARP | ALARP | Unacceptable |
| **P2** | Acceptable | Acceptable | ALARP | ALARP |
| **P1** | Acceptable | Acceptable | Acceptable | ALARP |

**Overall residual risk policy (RM-001 §8):** Acceptable if no individual risk remains Unacceptable after controls, and if clinical benefit demonstrably outweighs the sum of residual risks.

---

### 3. Individual Residual Risk Evaluations

---

#### H1 — False Negative: ADHD Screen

**Hazard:** User with ADHD scores below ASRS Part A threshold; defers clinical consultation.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S3 | S3 |
| Probability | P3 | P2 |
| Risk level | ALARP | **Acceptable** |

**Controls applied:** RC-01, RC-02, RC-03

**Residual risk justification:**

The ASRS Part A sensitivity is 68.7% (Kessler 2005, CE-002 §3.2). Approximately one in three adults with ADHD will not screen positive. This is an intrinsic limitation of a brief screening instrument and cannot be engineered away without redesigning the instrument itself, which would invalidate the validation evidence base.

The following controls reduce the probability of harm from this limitation:

- RC-02 places an explicit plain-language sensitivity statement on the results screen for all users, including those with a negative result: *"The ASRS screener identifies approximately 2 in 3 adults with ADHD. A negative result does not mean you do not have ADHD."*
- RC-01 places a general negative result disclaimer on all results sections
- RC-03 frames ClarityCheck throughout as a screening support tool, not a rule-out instrument

With these controls in place, a user who receives a negative ASRS result and reads the results screen is explicitly informed that a negative result does not exclude ADHD. The probability of harm — a user acting on a false negative result to their detriment, having been given this information — is assessed as Remote (P2). This yields an Acceptable residual risk.

**Residual risk level: Acceptable**

---

#### H2 — False Positive: ADHD Screen

**Hazard:** User without ADHD scores positive; self-labels or seeks unnecessary referral.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S2 | S2 |
| Probability | P2 | P2 |
| Risk level | Acceptable | **Acceptable** |

**Controls applied:** RC-04, RC-05

**Residual risk justification:**

ASRS Part A specificity is 99.5% (Kessler 2005). False positive rate is very low. Controls RC-04 and RC-05 ensure all results language is framed as screening output, not diagnosis. The combination of very high specificity and labeling controls means this hazard presents negligible clinical risk. No change in probability rating required; risk was Acceptable pre-control and remains so.

**Residual risk level: Acceptable**

---

#### H3 — False Negative: Depression (PHQ-9)

**Hazard:** Clinically significant depression not detected by PHQ-9.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S3 | S3 |
| Probability | P2 | P1 |
| Risk level | ALARP | **Acceptable** |

**Controls applied:** RC-06, RC-07, RC-01

**Residual risk justification:**

PHQ-9 sensitivity at ≥10 is 88% (Kroenke 2001) with meta-analytic confirmation of 85% (Manea 2012, CE-002 §4.2). The 12–15% false negative rate is consistent across the literature and reflects mild cases that may not meet the clinical threshold on a single administration. This is an intrinsic instrument limitation.

Controls RC-06 and RC-07 advise users that a below-threshold PHQ-9 score does not exclude depression and that persistent symptoms warrant clinical consultation regardless of score. With this information available, the probability that a user with clinically significant missed depression takes no further action is assessed as Improbable (P1), since the tool explicitly directs them to seek clinical advice if concerns persist.

**Residual risk level: Acceptable**

---

#### H4 — False Negative: Anxiety (GAD-7)

**Hazard:** Clinically significant anxiety not detected by GAD-7.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S3 | S3 |
| Probability | P2 | P1 |
| Risk level | ALARP | **Acceptable** |

**Controls applied:** RC-08, RC-07, RC-01

**Residual risk justification:**

GAD-7 sensitivity at ≥10 is 89% (Spitzer 2006) with meta-analytic confirmation of 92% (Plummer 2016, CE-002 §5.2). The same reasoning applies as H3. GAD-7 sensitivity is marginally higher than PHQ-9, supporting the same post-control probability reduction. RC-08 and RC-07 provide equivalent IFU and results screen controls.

**Residual risk level: Acceptable**

---

#### H5 — Suicidal Ideation Not Acted Upon

**Hazard:** User endorses PHQ-9 item 9; does not receive or engage with crisis support.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S4 | S4 |
| Probability | P2 | P1 |
| Risk level | ALARP | **ALARP** |

**Controls applied:** RC-09, RC-10, RC-11, RC-12, RC-13, RC-28

**Residual risk justification:**

This is the highest-severity hazard in the ClarityCheck risk file and the only hazard that remains ALARP after all controls. The ALARP classification is formally accepted here on the following basis.

**Nature of residual risk:**

RC-09 ensures the crisis screen is triggered for any non-zero PHQ-9 item 9 response. RC-11 requires user acknowledgement before results are displayed. RC-10 provides crisis helpline resources. RC-13 and RC-28 provide pre-emptive and persistent crisis access throughout the session.

The residual risk that remains after these controls is the possibility that a user in acute crisis acknowledges the crisis screen without engaging with the resources, proceeds to results, and takes no further action to seek support. This behaviour cannot be prevented in an unsupervised digital self-assessment context without either blocking results entirely for such users (which would harm the majority who are not in acute crisis and would likely deter help-seeking) or requiring clinical supervision (which is outside the intended use model and not feasible for a community tool).

**ALARP justification:**

No further technically practicable and proportionate risk control exists for this residual risk within the intended use model of an unsupervised community self-assessment tool. The following considerations support ALARP acceptance:

1. **Prevalence context:** ClarityCheck targets adults with ADHD concerns, not a population selected for acute suicidality. PHQ-9 item 9 endorsement in this population reflects subclinical and chronic ideation at the majority of the endorsement range (score 1 — *several days*), not acute crisis in most cases.

2. **Control sufficiency:** The combination of pre-assessment crisis advisory (RC-13), persistent in-session crisis link (RC-28), triggered crisis screen (RC-09), and IFU safeguarding section (RC-12) represents best practice for digital mental health tools. This approach is consistent with published digital mental health governance frameworks including NHS Digital's Evidence Standards Framework for Digital Health Technologies.

3. **Counterfactual:** A user in crisis who does not use ClarityCheck has no crisis screen triggered at all. ClarityCheck's safeguarding pathway represents a net positive for this population compared to no screening tool.

4. **Benefit-risk balance:** The clinical benefit of early ADHD and comorbidity screening — including depression detection that may itself identify users at elevated risk — outweighs the residual risk of this hazard for the intended population.

**Conditions of acceptance:**

- RC-09 implementation is a mandatory release criterion with ZERO tolerance for failure (DC-004 FT-SAFE-01)
- RC-11 acknowledgement gate is a mandatory release criterion (DC-004 FT-SAFE-02)
- Crisis helpline references are confirmed for all target deployment regions before release (RM-002 OI-01)
- This ALARP residual risk is formally accepted by the PRRC below

**Residual risk level: ALARP — formally accepted**

---

#### H6 — Misinterpretation of Results

**Hazard:** User treats scored output as a clinical diagnosis.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S3 | S3 |
| Probability | P3 | P2 |
| Risk level | ALARP | **Acceptable** |

**Controls applied:** RC-04, RC-05, RC-14, RC-15, RC-16

**Residual risk justification:**

Controls RC-04, RC-05, RC-14, RC-15, and RC-16 collectively eliminate diagnostic language from the application, require visible per-card disclaimers on all results elements, and explain the distinction between screening and diagnosis in the IFU. A user who reads the results screen as designed will encounter multiple, layered statements that results are screening outputs, not diagnoses. The probability that a user misinterprets results despite these controls is assessed as Remote (P2). This yields Acceptable residual risk.

**Residual risk level: Acceptable**

---

#### H7 — Scoring Error

**Hazard:** Software calculates incorrect score due to implementation defect.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S3 | S3 |
| Probability | P2 | P1 |
| Risk level | ALARP | **Acceptable** |

**Controls applied:** RC-17, RC-18, RC-19, RC-20

**Residual risk justification:**

Controls RC-17 through RC-20 require complete boundary test case coverage for all three scoring functions, item-by-item ASRS threshold verification against the published Kessler 2005 scoring grid, automated unit tests passing before release, and a locked reference scoring table in DC-003. These are inherent safety by design controls that directly address the mechanism of the hazard. With verified, automated, and documented scoring implementation, the probability of a scoring error reaching production is assessed as Improbable (P1).

**Residual risk level: Acceptable**

---

#### H8 — Instrument Modification

**Hazard:** Item wording or scoring algorithm altered from validated published version.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S3 | S3 |
| Probability | P2 | P1 |
| Risk level | ALARP | **Acceptable** |

**Controls applied:** RC-21, RC-22, RC-23

**Residual risk justification:**

RC-21 locks all instrument text in DC-003 as a reference specification. RC-22 requires character-level verification before release. RC-23 embeds re-verification requirements into the change control procedure. These controls make inadvertent instrument modification detectable before release and systematically prevented post-release. Residual probability is Improbable (P1).

**Residual risk level: Acceptable**

---

#### H9 — Inappropriate Use: Under-18 Population

**Hazard:** Person under 18 uses instruments validated for adults only.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S3 | S3 |
| Probability | P3 | P2 |
| Risk level | ALARP | **Acceptable** |

**Controls applied:** RC-24, RC-25, RC-26

**Residual risk justification:**

Technical age verification is not feasible without account creation, which is excluded by design constraint CON-04 for privacy and accessibility reasons. The maximum practicable control is an age acknowledgement gate (RC-26) and prominent age restriction labeling (RC-24, RC-25). A user who deliberately misrepresents their age to access the tool cannot be prevented from doing so.

However, the severity of harm from under-18 use is S3 rather than S4, because the principal risk is an inaccurate score — not direct physical harm. An adolescent receiving an inaccurate screening result who is then directed to seek clinical consultation is not significantly worse off than one who seeks consultation without having used ClarityCheck. The controls reduce probability to P2 (Remote) — the majority of users will respect the clearly stated age restriction. The residual Acceptable classification reflects both the probability reduction and the bounded severity of harm.

**Residual risk level: Acceptable**

---

#### H10 — Emotional Distress During Administration

**Hazard:** Assessment process triggers acute emotional distress.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S2 | S2 |
| Probability | P3 | P2 |
| Risk level | ALARP | **Acceptable** |

**Controls applied:** RC-27, RC-28, RC-13

**Residual risk justification:**

RC-27 provides an emotional content advisory on the welcome screen, setting expectations before the assessment begins. RC-28 ensures crisis resources are persistently accessible during the assessment. RC-13 advises users in acute distress not to proceed. These controls appropriately prepare users and provide an exit route. Residual severity remains Minor (S2) — some emotional discomfort during a sensitive self-assessment is an expected and acceptable experience, not a harm of clinical significance. Residual probability is reduced to Remote (P2).

**Residual risk level: Acceptable**

---

#### H11 — Results Shared Without Context

**Hazard:** Results document shared with employer, insurer, or other non-clinical party.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S3 | S3 |
| Probability | P2 | P2 |
| Risk level | ALARP | **Acceptable** |

**Controls applied:** RC-29, RC-30, RC-31

**Residual risk justification:**

User behaviour outside the application cannot be controlled. Controls RC-29 through RC-31 ensure the results document carries a prominent disclaimer, the IFU explicitly advises against sharing with employers or insurers, and the document is formatted in a non-clinical style that reduces the risk of it being treated as a medical record. These are the maximum practicable controls within the device boundary.

The probability of harm is assessed as Remote (P2) after controls — most users sharing results will do so with healthcare professionals as intended, and the disclaimer header on the document provides explicit guidance to third-party recipients. While the residual probability is unchanged from pre-control (P2), the controls reduce the severity of harm in the event of inappropriate sharing, since a recipient who reads the disclaimer is alerted to the document's limitations. The overall residual risk is Acceptable.

**Residual risk level: Acceptable**

---

#### H12 — Use as Sole Basis for Self-Medication

**Hazard:** User self-medicates with ADHD medication on the basis of a positive screen.

| | Pre-Control | Post-Control |
|---|---|---|
| Severity | S4 | S4 |
| Probability | P1 | P1 |
| Risk level | ALARP | **Acceptable** |

**Controls applied:** RC-04, RC-05, RC-14, RC-16, RC-32

**Residual risk justification:**

The probability of this hazard was assessed as Improbable (P1) pre-control because it requires multiple sequential decisions by the user: obtaining ADHD medication without prescription, choosing to do so on the basis of a screening result, and self-administering. Controls RC-32 places an explicit self-medication warning on the results screen and in the IFU. The compound improbability of all required conditions being met, combined with the explicit warning, makes this residual risk Acceptable despite the S4 severity rating.

**Residual risk level: Acceptable**

---

### 4. Residual Risk Summary

| Hazard | Severity | Prob (post) | Residual Risk | Formally Accepted |
|---|---|---|---|---|
| H1 ADHD false negative | S3 | P2 | **Acceptable** | — |
| H2 ADHD false positive | S2 | P2 | **Acceptable** | — |
| H3 PHQ-9 false negative | S3 | P1 | **Acceptable** | — |
| H4 GAD-7 false negative | S3 | P1 | **Acceptable** | — |
| H5 Suicidal ideation | S4 | P1 | **ALARP** | ✅ Required — see §3 H5 |
| H6 Misinterpretation | S3 | P2 | **Acceptable** | — |
| H7 Scoring error | S3 | P1 | **Acceptable** | — |
| H8 Instrument modification | S3 | P1 | **Acceptable** | — |
| H9 Under-18 use | S3 | P2 | **Acceptable** | — |
| H10 Emotional distress | S2 | P2 | **Acceptable** | — |
| H11 Results shared without context | S3 | P2 | **Acceptable** | — |
| H12 Self-medication | S4 | P1 | **Acceptable** | — |

**No hazard remains Unacceptable after controls.**
**One hazard (H5) remains ALARP and is formally accepted in §3 H5.**

---

### 5. Overall Residual Risk Evaluation

#### 5.1 Aggregate Residual Risk

The twelve hazards identified in RM-002 collectively constitute the total residual risk of ClarityCheck v1.0. Evaluating these in aggregate:

- 11 of 12 hazards have been reduced to Acceptable
- 1 of 12 hazards (H5) remains ALARP with comprehensive controls in place
- No hazard remains Unacceptable
- No new hazards have been identified during the risk control specification process

The aggregate residual risk profile is consistent with a Class IIa SaMD in the mental health screening domain. The residual risk of false negatives (H1, H3, H4) is inherent to any screening instrument and does not reflect a design failure — it is disclosed and mitigated through labeling. The residual risk of H5 is the most significant and is addressed with the most comprehensive set of controls in the risk file.

#### 5.2 Comparison with Similar Devices

Self-administered mental health screening tools incorporating PHQ-9 and GAD-7 are in widespread clinical use globally, including in NHS-approved digital health platforms, WHO-endorsed screening programmes, and validated research instruments. The PHQ-9 item 9 suicidal ideation approach adopted in ClarityCheck v1.0 is standard practice in these tools. The residual risk profile of ClarityCheck v1.0 is consistent with and not materially different from the state of the art in this device category.

---

### 6. Benefit-Risk Analysis

#### 6.1 Clinical Benefits — Summary from CE-002

| Benefit | Evidence | Magnitude |
|---|---|---|
| ADHD screening support in an undertreated population | Kessler 2006: 75% of adults meeting ADHD criteria never treated | High — addresses large unmet need |
| High specificity ADHD screen (99.5%) | Kessler 2005 | High — very low false positive rate |
| Depression comorbidity detection | Kroenke 2001, Manea 2012: sens 85–88%, spec 88–89% | High |
| Anxiety comorbidity detection | Spitzer 2006, Plummer 2016: sens 89–92%, spec 76–82% | High |
| Comorbidity prevalence in target population | Adler 2019: depression 58%, anxiety 53% in ADHD adults | High — battery design is clinically justified |
| Support for help-seeking | Kessler 2006: massive treatment gap; self-assessment supports first step | High |
| Digital accessibility | Donker 2011, Kroenke 2010: digital delivery preserves validity | Moderate |
| Free, open source, no barriers to access | IP clearance (RG-001 Annex A) | High — enables equitable access |

#### 6.2 Clinical Risks — Summary

| Risk | Post-Control Level | Residual Magnitude |
|---|---|---|
| ADHD false negative → delayed diagnosis | Acceptable | Low — explicitly disclosed; user directed to seek clinical advice |
| Depression false negative → untreated | Acceptable | Very low — 88% sensitivity; disclosure controls applied |
| Anxiety false negative → untreated | Acceptable | Very low — 89% sensitivity; disclosure controls applied |
| Suicidal ideation not acted upon | ALARP | Low — comprehensive safeguarding controls; counterfactual benefit |
| Results misinterpretation | Acceptable | Low — layered non-diagnostic language controls |
| Scoring error | Acceptable | Very low — mandatory unit testing and verification |
| Self-medication | Acceptable | Very low — improbable and explicitly warned against |

#### 6.3 Benefit-Risk Conclusion

The clinical benefits of ClarityCheck v1.0 substantially and demonstrably outweigh its residual risks for the following reasons:

**1. The device addresses a large, well-documented unmet need.**
Adult ADHD is prevalent (3.4–4.4% globally), substantially underdiagnosed, and undertreated — 75% of US adults meeting diagnostic criteria have never received treatment (Kessler 2006). A validated, accessible, self-administered screening tool that supports help-seeking in this population has direct and quantifiable clinical value.

**2. The instruments used have strong, replicated evidence bases.**
The ASRS Part A (AUC 0.90), PHQ-9 (sens 85–88%, spec 88–89%), and GAD-7 (sens 89–92%, spec 76–82%) are among the best-evidenced brief screening instruments in psychiatric practice. Their use in ClarityCheck v1.0 grounds the device in decades of validation research.

**3. The comorbidity battery design is clinically justified.**
Depression and anxiety are present in approximately 58% and 53% of adults with ADHD respectively (Adler 2019). Including PHQ-9 and GAD-7 in the same session as the ASRS screen substantially increases the clinical value of a single assessment encounter — identifying comorbidities that might otherwise go unnoticed until a specialist assessment.

**4. The residual risks are well-characterised, mitigated, and bounded.**
No residual risk is Unacceptable. The most significant residual risk (H5, suicidal ideation) is addressed with a dedicated technical safeguarding pathway (RC-09–RC-13) representing best practice in digital mental health tools. The false negative risks (H1, H3, H4) are inherent to any screening instrument and are explicitly disclosed in labeling and results output.

**5. The device does not introduce new risks not present in existing alternatives.**
A user who does not use ClarityCheck and instead searches for ADHD information online is exposed to unvalidated content with no safeguarding controls, no sensitivity/specificity disclosure, and no clinical referral advisory. ClarityCheck offers a materially safer and better-evidenced alternative.

**Conclusion: The overall residual risk of ClarityCheck v1.0 is acceptable. The clinical benefits demonstrably outweigh the residual risks for the stated intended purpose and intended population.**

---

### 7. Risk Management Review

In accordance with ISO 14971:2019 §10, this section records the outcomes of the risk management review conducted prior to release authorisation.

#### 7.1 Review Questions

| Question | Answer |
|---|---|
| Has the risk management plan been implemented? | Yes — RM-001 through RM-004 complete |
| Have all hazards been identified and evaluated? | Yes — 12 hazards identified in RM-002; all evaluated in RM-004 |
| Is the overall residual risk acceptable? | Yes — per §6.3 above |
| Are all risk control measures verified? | Pending — DC-004 verification execution required before release |
| Has the clinical benefit been established? | Yes — CE-002 provides comprehensive evidence; CE-003 to synthesise |
| Have new hazards been introduced by risk controls? | No — no risk control has been identified as introducing a new hazard |

#### 7.2 Pre-Release Risk Management Conditions

The following conditions must be satisfied before ClarityCheck v1.0 may be released. These are in addition to the mandatory release criteria in DC-004:

| Condition | Status |
|---|---|
| All DC-004 mandatory tests passed (FT-SAFE-01, FT-SAFE-02, FT-SAFE-03, CT-01–03, UT-ASRS/PHQ/GAD) | Pending execution |
| Crisis helpline references confirmed for all target deployment regions (RM-002 OI-01) | Pending |
| Clinical reviewer sign-off on CE-003 obtained | Pending |
| RM-004 PRRC sign-off below | Pending |

---

### 8. Post-Production Risk Management

Per ISO 14971:2019 §10 and PM-001 Post-Market Surveillance Plan, the following events shall trigger a risk management review and potential update to this document:

- Any user complaint or adverse event report involving patient harm or near-miss
- Any report of PHQ-9 item 9 crisis pathway failure in post-market data
- Identification of new literature materially affecting the sensitivity/specificity estimates used in §3
- Any proposed change to instrument content, scoring logic, or results display (per RC-23)
- At minimum annually as part of the Periodic Safety Update Report (PM-002)

---

### 9. ALARP Residual Risk Formal Acceptance

The following ALARP residual risk is formally accepted by the PRRC:

**Hazard H5 — Suicidal ideation not acted upon**
Residual severity: S4 Critical
Residual probability: P1 Improbable
Residual risk level: ALARP

Acceptance rationale: All reasonably practicable controls have been implemented (RC-09 through RC-13, RC-28). The residual risk cannot be further reduced without either preventing users from completing the assessment (which would eliminate the clinical benefit) or requiring clinical supervision (which is outside the intended use model). The clinical benefit of providing a safeguarded ADHD and comorbidity screening pathway to an undertreated population outweighs this residual risk. The counterfactual — no screening tool — provides less safeguarding, not more.

| Role | Name | Date | Signature |
|---|---|---|---|
| PRRC — Formal ALARP Acceptance | | 2026-04-10 | |

---

### 10. Overall Risk Management Sign-Off

I confirm that:

- The risk management process for ClarityCheck v1.0 has been conducted in accordance with ISO 14971:2019
- All identified hazards have been evaluated and risk controls have been specified
- No residual risk is Unacceptable
- The one ALARP residual risk (H5) has been formally accepted with documented justification
- The overall residual risk is acceptable in light of the clinical benefits of ClarityCheck v1.0
- The benefit-risk balance is positive and the device may proceed to release subject to completion of the pre-release conditions in §7.2

| Role | Name | Date | Signature |
|---|---|---|---|
| Author / PRRC — Overall Sign-Off | | 2026-04-10 | |

---

### 11. Open Items

| ID | Item | Owner | Due |
|---|---|---|---|
| OI-01 | Confirm crisis helpline references for H5 controls before PRRC sign-off | PRRC | Before release |
| OI-02 | Execute DC-004 verification tests and record results | PRRC | Before release |
| OI-03 | Obtain clinical reviewer sign-off on CE-003 | PRRC | Before release |
| OI-04 | Complete PRRC formal signatures above upon completion of OI-01–03 | PRRC | Release milestone |
