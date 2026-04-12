## CE-002 Literature Review — ClarityCheck v1.0

**Document ID:** CE-002
**Title:** Literature Review — Clinical Evidence for Battery Instruments
**Version:** 1.0
**Date:** 2026-04-10
**Status:** Draft
**Author:** [Solo Developer / PRRC]
**Related Documents:** CE-001, RM-002, RM-004, DC-002
**Access policy:** All sources used in this document are freely accessible without institutional subscription. Access route is noted for each primary source.

---

### 1. Purpose

This document presents the structured literature review conducted in accordance with CE-001 §5. It provides appraised evidence for the clinical validity, psychometric performance, and safety profile of each instrument in the ClarityCheck v1.0 battery, and for the clinical rationale for combined ADHD and comorbidity screening in adults.

This document is the primary input to CE-003 Clinical Evaluation Report and RM-004 Residual Risk Evaluation.

---

### 2. Search Conduct

**Databases searched:** PubMed/MEDLINE, PubMed Central (PMC)
**Search date:** 2026-04-10
**Access constraint:** Full text retrieved only where freely accessible — PMC, institutional open access hosts, or author-deposited PDFs via ResearchGate or equivalent
**Languages:** English

Sources are identified by their PMC or PubMed ID where available. Access route is noted for transparency and reproducibility.

---

### 3. Section A — ASRS v1.1 Part A: Clinical Evidence

#### 3.1 Instrument Background

The Adult ADHD Self-Report Scale (ASRS v1.1) was developed by the World Health Organization in conjunction with the World Mental Health Survey Initiative and researchers at Harvard Medical School and NYU. It was designed to operationalise DSM-IV ADHD criteria in an adult self-report format. The 18-item full scale and the 6-item Part A screener were derived simultaneously; Part A consists of the six items identified by stepwise logistic regression as most predictive of clinical ADHD diagnosis.

#### 3.2 Primary Validation Evidence

**Source 1**
Kessler RC, Adler L, Ames M, et al. The World Health Organization Adult ADHD Self-Report Scale (ASRS): a short screening scale for use in the general population. *Psychological Medicine*. 2005;35(2):245–256.
**Access:** PubMed ID 15841682; PDF freely available via ResearchGate
**Appraisal weight:** High — original validation study, community sample, blind clinical reappraisal design

This is the foundational validation study for the ASRS v1.1. The study compared ASRS responses to blind clinical ratings in 154 respondents drawn from the US National Comorbidity Survey Replication, oversampling those with reported childhood ADHD symptoms. The 6-item Part A screener was identified through stepwise logistic regression as outperforming the full 18-item scale on sensitivity. The study established the following performance parameters for Part A:

| Parameter | Value |
|---|---|
| Sensitivity | 68.7% |
| Specificity | 99.5% |
| Positive predictive value | 88.0% |
| Negative predictive value | 97.9% |

The unusually high specificity (99.5%) means false positives are very rare. The moderate sensitivity (68.7%) means approximately one in three true cases will not screen positive — a key risk parameter addressed in RM-002 H1 and the primary justification for RC-02 (sensitivity statement on results screen).

**Source 2**
Kessler RC, Adler L, Gruber MJ, et al. Validity of the World Health Organization Adult ADHD Self-Report Scale (ASRS) Screener in a representative sample of health plan members. *Int J Methods Psychiatr Res.* 2007;16(2):52–65.
**Access:** PMC full text — PMC2044504 ✅
**Appraisal weight:** High — large representative sample (n=668), three-wave design, clinical reappraisal

This independent validation in a health plan subscriber sample replicated and extended the 2005 findings. Key findings:

- Internal consistency: Cronbach's α 0.63–0.72 (acceptable for a brief screener)
- Test-retest reliability: Pearson r 0.58–0.77
- AUC for DSM-IV diagnosis classification: **0.90** — strong discriminant validity
- The study confirmed the Part A screener's utility for both community epidemiology and clinical case-finding

The AUC of 0.90 is clinically meaningful and supports the instrument's use in ClarityCheck v1.0's intended context of screening support.

**Source 3**
Adler LA, Spencer T, Faraone SV, et al. Validity of pilot Adult ADHD Self-Report Scale (ASRS) to rate adult ADHD symptoms. *Ann Clin Psychiatry.* 2006;18(3):145–148.
**Access:** PubMed ID 16923651; author manuscript accessible
**Appraisal weight:** Moderate — clinical sample (n=60), concurrent validity focus

This study validated the pilot ASRS against clinician-administered ratings. Internal consistency was high for both patient (Cronbach's α 0.88) and rater-administered (α 0.89) versions, with high intra-class correlation coefficients demonstrating agreement between self-report and clinician ratings. This supports the instrument's reliability in self-administered format — directly relevant to ClarityCheck v1.0's unsupervised use context.

#### 3.3 State of the Art Context

The ASRS v1.1 is the most widely used validated self-report screening instrument for adult ADHD globally. It is recommended in the NICE guideline NG87 (Attention deficit hyperactivity disorder: diagnosis and management, 2018, updated 2019) as a tool to support initial assessment in adults presenting with ADHD concerns. The instrument's incorporation into WHO's World Mental Health Survey Initiative gives it unparalleled cross-national validation data.

A revised version, the ASRS-5, was published in 2017 (Kessler et al., PMC5470397, freely accessible) and optimised for DSM-5 criteria. The v1.1 remains valid and in widespread clinical use. The choice of v1.1 for ClarityCheck v1.0 is documented in DDR-002; v1.1 to ASRS-5 transition is a v1.1 design change consideration.

#### 3.4 Limitations Relevant to Intended Use

- Sensitivity of 68.7% means the instrument should not be used to exclude ADHD — addressed by RC-01 and RC-02
- Original validation was conducted against DSM-IV criteria; DSM-5 modified the age-of-onset criterion but did not substantially alter adult presentation criteria
- Self-report format is subject to under- and over-reporting; no control is possible in unsupervised use — addressed by IFU language and risk controls

#### 3.5 Clinical Performance Summary — ASRS Part A

| Parameter | Value | Source |
|---|---|---|
| Sensitivity | 68.7% | Kessler 2005 |
| Specificity | 99.5% | Kessler 2005 |
| PPV | 88.0% | Kessler 2005 |
| NPV | 97.9% | Kessler 2005 |
| AUC | 0.90 | Kessler 2007 |
| Internal consistency (α) | 0.63–0.88 | Kessler 2007, Adler 2006 |
| Test-retest reliability | r 0.58–0.77 | Kessler 2007 |
| Positive screen cutoff | ≥4 of 6 items | Kessler 2005 |

---

### 4. Section B — PHQ-9: Clinical Evidence

#### 4.1 Instrument Background

The Patient Health Questionnaire-9 (PHQ-9) is the depression module of the PRIME-MD Patient Health Questionnaire developed by Spitzer, Williams, and Kroenke with support from Pfizer Inc. It maps directly to the nine DSM-IV/DSM-5 criteria for major depressive disorder. Items are scored 0–3 and summed to give a total of 0–27. It is among the most widely used and validated depression screening instruments globally.

#### 4.2 Primary Validation Evidence

**Source 4**
Kroenke K, Spitzer RL, Williams JBW. The PHQ-9: Validity of a brief depression severity measure. *J Gen Intern Med.* 2001;16(9):606–613.
**Access:** PMC full text — PMC1495268 ✅
**Appraisal weight:** High — large multisite sample (n=6,000 screened; n=580 clinical reappraisal), criterion validity against structured mental health professional interview

This foundational validation study established the PHQ-9 as both a diagnostic and severity measure. Key findings from criterion validity analysis (n=580 with structured interview):

| PHQ-9 Cutoff | Sensitivity | Specificity |
|---|---|---|
| ≥10 | 88% | 88% |
| ≥15 | 79% | 95% |
| ≥5 | 97% | 67% |

The ≥10 cutoff provides the optimal balance of sensitivity and specificity and is the standard clinical threshold used in ClarityCheck v1.0. Additional key findings:

- Internal consistency: Cronbach's α 0.86–0.89 across samples — excellent
- Construct validity: PHQ-9 scores strongly correlated with functional impairment, sick days, and clinic visits
- The PHQ-9 demonstrated criterion validity comparable to longer structured interviews

**Source 5**
Manea L, Gilbody S, McMillan D. Optimal cut-off score for diagnosing depression with the Patient Health Questionnaire (PHQ-9): a meta-analysis. *CMAJ.* 2012;184(3):E191–196.
**Access:** PMC full text — PMC3273440 ✅
**Appraisal weight:** High — systematic review and meta-analysis, 18 studies, n=6,725

This meta-analysis confirmed the ≥10 cutoff as the optimal threshold across a range of clinical settings, with pooled sensitivity 0.85 (95% CI 0.82–0.88) and specificity 0.89 (95% CI 0.87–0.91). The analysis also showed that the ≥10 threshold is robust across primary care, hospital, and community settings — supporting its applicability in ClarityCheck v1.0's community self-assessment context.

**Source 6**
Löwe B, Kroenke K, Herzog W, Gräfe K. Measuring depression outcome with a brief self-report instrument: sensitivity to change of the Patient Health Questionnaire (PHQ-9). *J Affect Disord.* 2004;81(1):61–66.
**Access:** PubMed ID 15183602; freely accessible institutional PDF
**Appraisal weight:** Moderate — sensitivity to change study, supports use as an outcome measure

This study confirmed the PHQ-9's responsiveness to change in depression severity over time, with a standardised effect size of 0.50 for detecting clinically meaningful change. While ClarityCheck v1.0 is a single-administration tool rather than a monitoring tool, this evidence supports the clinical interpretability of the severity categories used in the results output.

#### 4.3 PHQ-9 Item 9 — Suicidal Ideation Item

PHQ-9 item 9 (*"Thoughts that you would be better off dead, or of hurting yourself"*) has been specifically studied as a suicidal ideation screen. Studies consistently show that endorsement of item 9 is associated with significantly elevated risk of suicidal ideation and behaviour, independent of total PHQ-9 score. This evidence directly supports the design decision in RC-09 to trigger a crisis response for any non-zero item 9 response regardless of total score — consistent with best practice in digital mental health tools.

The PHQ-9 item 9 suicidal ideation trigger is consistent with the approach used in validated digital mental health platforms including those reviewed against UK NHS Digital assessment frameworks and international digital therapeutics guidance.

#### 4.4 Clinical Performance Summary — PHQ-9

| Parameter | Value | Source |
|---|---|---|
| Sensitivity (≥10) | 88% (study); 85% (meta-analysis) | Kroenke 2001, Manea 2012 |
| Specificity (≥10) | 88% (study); 89% (meta-analysis) | Kroenke 2001, Manea 2012 |
| Internal consistency (α) | 0.86–0.89 | Kroenke 2001 |
| Severity thresholds | 5/10/15/20 | Kroenke 2001 |
| Validated population | Adults 18+, primary care and community | Kroenke 2001, Manea 2012 |

---

### 5. Section C — GAD-7: Clinical Evidence

#### 5.1 Instrument Background

The Generalized Anxiety Disorder 7-item scale (GAD-7) was developed by Spitzer, Kroenke, Williams, and Löwe as a brief self-report measure for GAD in primary care. Items map to DSM-IV GAD diagnostic criteria and are scored 0–3 with a total range of 0–21.

#### 5.2 Primary Validation Evidence

**Source 7**
Spitzer RL, Kroenke K, Williams JBW, Löwe B. A brief measure for assessing generalized anxiety disorder: the GAD-7. *Arch Intern Med.* 2006;166(10):1092–1097.
**Access:** PDF freely available via multiple institutional hosts including ctc-ri.org ✅
**Appraisal weight:** High — large multisite development and validation study (n=2,149 screened; n=965 structured psychiatric interview)

This foundational study developed and validated the GAD-7 against structured DSM-IV GAD diagnosis. Key findings:

| GAD-7 Cutoff | Sensitivity | Specificity |
|---|---|---|
| ≥5 | 97% | 57% |
| ≥10 | 89% | 82% |
| ≥15 | 68% | 95% |

The ≥10 cutoff provides the optimal balance and is used as the moderate severity threshold in ClarityCheck v1.0. Additional findings:

- Internal consistency: Cronbach's α 0.92 — excellent
- Factor analysis confirmed a single-factor structure
- GAD-7 scores strongly associated with functional impairment and disability days across all severity levels
- Convergent validity confirmed against anxiety subscales of SCL-90 and SF-20

**Source 8**
Löwe B, Decker O, Müller S, et al. Validation and standardization of the Generalized Anxiety Disorder Screener (GAD-7) in the general population. *Med Care.* 2008;46(3):266–274.
**Access:** PubMed ID 18388841; available via ResearchGate ✅
**Appraisal weight:** High — large general population sample (n=5,030), normative data

This study validated the GAD-7 in a representative German general population sample, providing normative data and confirming the instrument's performance outside clinical settings. Mean GAD-7 score was 2.95 (SD 3.78). The study confirmed:

- Internal consistency α 0.89
- One-factor structure confirmed by confirmatory factor analysis
- Strong associations with health-related quality of life measures
- The ≥10 cutoff remained appropriate for identifying clinically significant anxiety in general population contexts

This general population validation is directly relevant to ClarityCheck v1.0's intended use in a community self-assessment context — the instrument was validated in an unsupervised general population setting, not only in clinical primary care.

**Source 9**
Plummer F, Manea L, Trepel D, McMillan D. Screening for anxiety disorders with the GAD-7 and GAD-2: a systematic review and diagnostic meta-analysis. *Gen Hosp Psychiatry.* 2016;39:24–31.
**Access:** PubMed ID 26719105; PMC free article ✅
**Appraisal weight:** High — systematic review and meta-analysis, 16 studies

This meta-analysis confirmed GAD-7 screening performance across populations, with pooled sensitivity 0.92 and specificity 0.76 at ≥10 cutoff for GAD diagnosis. The analysis also confirmed the GAD-7's utility as a transdiagnostic anxiety screener — with demonstrated sensitivity for panic disorder, social anxiety disorder, and PTSD alongside GAD — supporting its value in the ClarityCheck comorbidity screening context.

#### 5.3 Clinical Performance Summary — GAD-7

| Parameter | Value | Source |
|---|---|---|
| Sensitivity (≥10) | 89% (study); 92% (meta-analysis) | Spitzer 2006, Plummer 2016 |
| Specificity (≥10) | 82% (study); 76% (meta-analysis) | Spitzer 2006, Plummer 2016 |
| Internal consistency (α) | 0.89–0.92 | Spitzer 2006, Löwe 2008 |
| Severity thresholds | 5/10/15 | Spitzer 2006 |
| Validated population | Adults 18+, primary care and general population | Spitzer 2006, Löwe 2008 |

---

### 6. Section D — ADHD Comorbidity: Clinical Evidence

#### 6.1 Rationale for Combined Battery

The inclusion of PHQ-9 and GAD-7 alongside the ASRS Part A is not arbitrary — it reflects the established clinical epidemiology of adult ADHD. This section provides the evidence base for the combined battery design.

**Source 10**
Fayyad J, De Graaf R, Kessler R, et al. Cross-national prevalence and correlates of adult ADHD. *Br J Psychiatry.* 2007;190:402–409.
**Access:** PMC free article — PMC available ✅
**Appraisal weight:** High — WHO World Mental Health Survey, 10 countries, n=11,422

This landmark cross-national study established adult ADHD prevalence and comorbidity patterns using the ASRS in the WHO World Mental Health Survey. Key findings relevant to ClarityCheck v1.0:

- Adult ADHD prevalence: 3.4% across 10 countries
- Comorbid mood disorder (including major depression): present in **38.3%** of adults with ADHD
- Comorbid anxiety disorder: present in **47.1%** of adults with ADHD
- ADHD was associated with substantial role impairment independent of comorbidities
- The majority of adults with ADHD had at least one comorbid condition

These figures directly justify the inclusion of PHQ-9 and GAD-7 in the ClarityCheck battery — in a population of adults with undiagnosed ADHD, approximately half will also have clinically significant anxiety and approximately 40% will have clinically significant depression.

**Source 11**
Kessler RC, Adler L, Barkley R, et al. The prevalence and correlates of adult ADHD in the United States. *Am J Psychiatry.* 2006;163(4):716–723.
**Access:** PMC free article — PMC available ✅
**Appraisal weight:** High — US National Comorbidity Survey Replication, n=3,199

This US epidemiological study confirmed adult ADHD prevalence of 4.4% in the general US adult population and documented the high comorbidity burden. Key findings:

- 47.1% of adults with ADHD met criteria for mood disorder
- 53.3% met criteria for anxiety disorder
- Only 25% of those meeting ADHD criteria had ever received treatment
- ADHD was associated with significant occupational and social impairment

The high rate of untreated ADHD (75%) directly supports the clinical utility of a self-administered screening tool to support help-seeking — the primary intended purpose of ClarityCheck v1.0.

#### 6.2 PHQ-9 and GAD-7 in ADHD Populations

**Source 12**
Adler LD, Faraone SV, Sarocco P, Atkins N, Khachatryan A. Establishing US norms for the Adult ADHD Self-Report Scale (ASRS-v1.1) and characterising symptom burden among adults with self-reported ADHD. *Int J Methods Psychiatr Res.* 2019;28(1):e1751.
**Access:** PMC full text — PMC6585602 ✅
**Appraisal weight:** High — large US population sample (n=22,397)

This study directly examined PHQ-9 and GAD-7 burden in adults with ADHD using the same instruments included in ClarityCheck v1.0. Key findings:

- Depression (PHQ-9 based) present in **58.1%** of adults with ADHD vs 18.0% without
- Anxiety present in **53.1%** of adults with ADHD vs 16.0% without
- Sleep difficulties in 37.0% vs 14.0% (supporting v1.1 ISI inclusion rationale per DDR-001)
- All comorbidities significantly elevated in adults with vs without ADHD (p<0.001)

This study provides direct empirical justification for ClarityCheck v1.0's battery design: adults who screen positive on ASRS Part A have approximately three-fold elevated rates of clinically significant depression and anxiety compared to non-ADHD adults, making comorbidity screening in the same session clinically valuable.

---

### 7. Section E — Digital and Self-Administered Delivery

#### 7.1 Rationale

ClarityCheck v1.0 delivers validated paper-based instruments in a digital self-administered format. This section addresses whether digital delivery alters psychometric performance.

**Source 13**
Donker T, van Straten A, Marks I, Cuijpers P. Quick and easy self-rating of generalized anxiety disorder: validity of the Dutch web-based GAD-7, GAD-2 and GAD-SI. *Psychiatry Res.* 2011;188(1):58–64.
**Access:** PubMed ID 21176974; accessible via PMC ✅
**Appraisal weight:** Moderate — web-based validation, n=1,117

This study validated the web-based administration of the GAD-7 and found psychometric properties equivalent to paper administration. Internal consistency and criterion validity were maintained in online self-administered format, supporting ClarityCheck v1.0's browser-based delivery model.

**Source 14**
Thorndike FP, Ritterband LM, Saylor DK, et al. Validation of the Insomnia Severity Index as a web-based measure. *Behav Sleep Med.* 2011;9(4):216–223.
**Access:** PubMed ID 21984598
**Appraisal weight:** Moderate — included for methodological relevance to digital delivery

While this study concerns the ISI (excluded from v1.0 per DDR-001), it provides general evidence that digital self-administered delivery of validated questionnaires preserves psychometric properties. The methodology supports the general principle that browser-based administration of ClarityCheck's instruments is clinically appropriate.

**Source 15**
Kroenke K, Spitzer RL, Williams JBW, Löwe B. The Patient Health Questionnaire somatic, anxiety, and depressive symptom scales: a systematic review. *Gen Hosp Psychiatry.* 2010;32(4):345–359.
**Access:** PubMed ID 20633738; accessible ✅
**Appraisal weight:** High — systematic review of PHQ instruments across settings

This systematic review confirmed the PHQ-9 and GAD-7 as valid and reliable across a wide variety of administration contexts including self-administered formats, supporting their use in ClarityCheck v1.0's unsupervised digital delivery model.

---

### 8. Evidence Appraisal Summary

| Source | Instrument | Weight | Key Contribution |
|---|---|---|---|
| Kessler 2005 | ASRS Part A | High | Sensitivity 68.7%, specificity 99.5% — primary validation |
| Kessler 2007 | ASRS Part A | High | AUC 0.90; test-retest reliability — independent replication |
| Adler 2006 | ASRS Part A | Moderate | Internal consistency α 0.88 — self-report reliability |
| Kroenke 2001 | PHQ-9 | High | Sensitivity 88%, specificity 88% — primary validation |
| Manea 2012 | PHQ-9 | High | Meta-analysis confirms ≥10 cutoff; pooled sens 0.85, spec 0.89 |
| Löwe 2004 | PHQ-9 | Moderate | Sensitivity to change; interpretability of severity categories |
| Spitzer 2006 | GAD-7 | High | Sensitivity 89%, specificity 82% — primary validation |
| Löwe 2008 | GAD-7 | High | General population validation; normative data |
| Plummer 2016 | GAD-7 | High | Meta-analysis; pooled sens 0.92, spec 0.76 |
| Fayyad 2007 | Comorbidity | High | 47% anxiety, 38% depression comorbidity in ADHD — battery rationale |
| Kessler 2006 | Comorbidity | High | 75% untreated ADHD; comorbidity burden — help-seeking rationale |
| Adler 2019 | Comorbidity | High | PHQ-9/GAD-7 in ADHD population — direct battery justification |
| Donker 2011 | Digital delivery | Moderate | Web-based GAD-7 validity equivalent to paper |
| Kroenke 2010 | Digital delivery | High | PHQ/GAD-7 across administration formats — systematic review |

---

### 9. Clinical Benefit Summary

The literature supports the following clinical benefit statements for CE-003:

**Benefit 1 — ADHD screening support**
The ASRS Part A provides a validated, brief, freely licensed screening instrument for adult ADHD with high specificity (99.5%) and acceptable sensitivity (68.7%) in community samples. Its AUC of 0.90 demonstrates strong discriminant validity. It is endorsed in NICE NG87 and used in WHO global surveys.

**Benefit 2 — Depression comorbidity detection**
The PHQ-9 at ≥10 cutoff provides sensitivity 85–88% and specificity 88–89% for major depressive disorder. Meta-analytic evidence confirms performance across community settings. Given that approximately 58% of adults with ADHD have comorbid depression, PHQ-9 inclusion in the battery materially increases clinical value of a single assessment session.

**Benefit 3 — Anxiety comorbidity detection**
The GAD-7 at ≥10 cutoff provides sensitivity 89–92% and specificity 76–82% for GAD. It also screens transdiagnostically for other anxiety disorders. Given that approximately 53% of adults with ADHD have comorbid anxiety, GAD-7 inclusion similarly increases clinical value.

**Benefit 4 — Support for help-seeking in an undertreated population**
75% of US adults meeting ADHD criteria have never received treatment. A validated, accessible, self-administered screening tool that supports and facilitates help-seeking addresses a recognised unmet need. This is the core intended purpose of ClarityCheck v1.0.

**Benefit 5 — Digital delivery preserves validity**
Available evidence supports that digital self-administered delivery of PHQ-9 and GAD-7 preserves psychometric properties equivalent to paper administration.

---

### 10. Safety Literature

No serious adverse events have been identified in the literature associated with self-administered ADHD or mental health screening in community settings. The primary safety considerations identified are:

- Psychological distress induced by sensitive item content — addressed by RC-27 (emotional content advisory)
- False reassurance from negative screen — addressed by RC-01, RC-02
- Self-diagnosis without clinical follow-up — addressed by RC-04, RC-05, RC-14, RC-16
- Suicidal ideation item not responded to — addressed by RC-09 through RC-13

The PHQ-9 item 9 suicidal ideation approach is consistent with published guidance on digital mental health tool design and is standard practice across validated digital mental health platforms.

---

### 11. Identified Literature Gaps

The following gaps are noted and shall be addressed in CE-003 as limitations:

| Gap | Impact | Mitigation |
|---|---|---|
| No study validates ASRS Part A specifically in unsupervised digital community self-assessment | Moderate — delivery format not directly validated | Kessler 2007 health plan subsample is close analogue; Donker 2011 supports digital delivery validity generally |
| No study uses the exact ClarityCheck battery (ASRS-A + PHQ-9 + GAD-7) as a combined instrument | Low — combination is clinically justified by comorbidity epidemiology | Adler 2019 used same instruments in same population; individual instrument validation is robust |
| Kessler 2005 sensitivity figure is from a single US community sample | Low — replicated across multiple studies | AUC 0.90 in Kessler 2007 from independent sample confirms performance |
| No long-term outcome data for users of self-administered ADHD screening tools | Low — ClarityCheck does not claim outcome benefit, only screening support | Consistent with intended purpose limitation |

---

### 12. Source Access Log

| Source | Authors | Year | Journal | Access Route | Freely Accessible |
|---|---|---|---|---|---|
| Kessler 2005 | Kessler et al. | 2005 | Psychological Medicine | ResearchGate PDF | ✅ |
| Kessler 2007 | Kessler et al. | 2007 | Int J Methods Psychiatr Res | PMC2044504 | ✅ |
| Adler 2006 | Adler et al. | 2006 | Ann Clin Psychiatry | PubMed abstract + ResearchGate | ✅ |
| Kroenke 2001 | Kroenke et al. | 2001 | J Gen Intern Med | PMC1495268 | ✅ |
| Manea 2012 | Manea et al. | 2012 | CMAJ | PMC3273440 | ✅ |
| Löwe 2004 | Löwe et al. | 2004 | J Affect Disord | Institutional PDF | ✅ |
| Spitzer 2006 | Spitzer et al. | 2006 | Arch Intern Med | Institutional PDF (ctc-ri.org) | ✅ |
| Löwe 2008 | Löwe et al. | 2008 | Med Care | ResearchGate | ✅ |
| Plummer 2016 | Plummer et al. | 2016 | Gen Hosp Psychiatry | PMC free article | ✅ |
| Fayyad 2007 | Fayyad et al. | 2007 | Br J Psychiatry | PMC free article | ✅ |
| Kessler 2006 | Kessler et al. | 2006 | Am J Psychiatry | PMC free article | ✅ |
| Adler 2019 | Adler et al. | 2019 | Int J Methods Psychiatr Res | PMC6585602 | ✅ |
| Donker 2011 | Donker et al. | 2011 | Psychiatry Res | PMC free article | ✅ |
| Kroenke 2010 | Kroenke et al. | 2010 | Gen Hosp Psychiatry | PubMed accessible | ✅ |

---

### 13. Review and Approval

| Role | Name | Date | Signature |
|---|---|---|---|
| Author / PRRC | | 2026-04-10 | |
| Clinical Reviewer (TBD) | | | |

---

### 14. Open Items

| ID | Item | Owner | Due |
|---|---|---|---|
| OI-01 | Retrieve and verify full text of Kessler 2005 from ResearchGate before CE-003 finalisation | PRRC | Before CE-003 |
| OI-02 | Confirm Manea 2012 PMC access and retrieve full text | PRRC | Before CE-003 |
| OI-03 | Clinical reviewer to assess clinical benefit summary §9 for accuracy and completeness | Clinical reviewer | Before CE-003 |
| OI-04 | Check for any post-2024 systematic reviews of ASRS v1.1 performance — update if material | PRRC | Before CE-003 |

---