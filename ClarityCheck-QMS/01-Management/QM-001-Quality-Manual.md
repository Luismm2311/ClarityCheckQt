## QM-001 Quality Manual — ClarityCheck v1.0

**Document ID:** QM-001
**Title:** Quality Manual
**Version:** 1.0
**Date:** 2026-04-10
**Status:** Draft
**Author:** [Solo Developer / PRRC]
**Standard:** ISO 13485:2016
**Regulatory basis:** EU MDR 2017/745

---

### 1. Introduction

#### 1.1 Purpose

This Quality Manual defines the Quality Management System (QMS) of [Manufacturer name — to be completed] for the design, development, and post-market maintenance of ClarityCheck, a Software as a Medical Device (SaMD). It establishes the scope of the QMS, the quality policy, the organisational structure, and the relationship between all QMS documents and processes.

This manual is the primary reference document for internal quality management and for external assessment by a Notified Body under EU MDR 2017/745.

#### 1.2 Company Profile

| Attribute | Value |
|---|---|
| Legal entity | [To be completed] |
| Registered address | [To be completed] |
| Organisation type | Solo developer — independent software developer |
| PRRC | mesw |
| Contact | [To be completed] |
| Website | mesw.github.io/claritycheck |

ClarityCheck is developed and maintained by a single individual acting as developer, quality manager, and Person Responsible for Regulatory Compliance (PRRC). The Quality Manual and all associated QMS documentation reflect this organisational structure. Where ISO 13485 references roles or departments, these are fulfilled by the sole developer unless an external party is explicitly named.

#### 1.3 Scope of the QMS

This QMS applies to:

- The design, development, maintenance, and post-market surveillance of ClarityCheck v1.0 and subsequent versions
- All processes that affect the safety and performance of ClarityCheck
- All documents comprising the ClarityCheck technical documentation

This QMS does not apply to:

- Manufacturing of physical products (ClarityCheck is software only — no hardware)
- Distribution or supply chain management (ClarityCheck is distributed directly via web browser)
- Sterilisation or packaging (not applicable)

**Product scope:** ClarityCheck v1.0 — Class IIa SaMD under EU MDR 2017/745

---

### 2. Quality Policy

#### 2.1 Policy Statement

ClarityCheck is developed with the intention of providing adults with suspected ADHD a validated, safe, and clearly labelled screening tool that supports help-seeking and clinical consultation preparation.

The quality policy of this organisation is:

> **To develop and maintain ClarityCheck in accordance with ISO 13485:2016 and EU MDR 2017/745, ensuring that every design decision, risk control, and process activity prioritises the safety and wellbeing of users above all other considerations.**

This policy commits the organisation to:

- Applying established, validated clinical instruments without modification
- Maintaining comprehensive and honest risk documentation
- Disclosing device limitations clearly and prominently to users
- Conducting rigorous verification and validation before release
- Responding promptly and transparently to post-market safety signals
- Continuously improving the QMS based on internal audit findings and post-market data

#### 2.2 Quality Objectives

| Objective | Metric | Target |
|---|---|---|
| No critical or major defects at release | DC-004 test pass rate | 100% mandatory tests passed |
| Risk file complete before release | RM-001 through RM-004 signed off | All documents approved |
| Clinical evaluation complete before release | CE-003 clinical reviewer sign-off obtained | Obtained before release |
| Post-market feedback reviewed | PM-002 PSUR cycle | Annual minimum |
| No instrument modifications without change control | QM-004 change records | Zero uncontrolled changes |
| IFU readability meets target | Flesch-Kincaid Grade | ≤ 8 overall |

#### 2.3 Quality Policy Communication

As a solo developer organisation, the quality policy is reviewed by the PRRC at each management review (QM-004). It is publicly accessible via the ClarityCheck open source repository. Any future employees or contractors will be required to acknowledge the quality policy before commencing work on ClarityCheck.

---

### 3. Organisational Structure

#### 3.1 Organisation Chart

```
┌─────────────────────────────────────────────┐
│           [Manufacturer / Legal Entity]      │
│                                             │
│   ┌─────────────────────────────────────┐   │
│   │     Solo Developer / PRRC           │   │
│   │                                     │   │
│   │  • Quality Management               │   │
│   │  • Design & Development             │   │
│   │  • Risk Management                  │   │
│   │  • Regulatory Affairs               │   │
│   │  • Post-Market Surveillance         │   │
│   └─────────────────────────────────────┘   │
│                                             │
│   External parties (named per activity):    │
│   • Clinical Reviewer — CE-003 sign-off     │
│   • Notified Body — conformity assessment   │
└─────────────────────────────────────────────┘
```

#### 3.2 Roles and Responsibilities

##### Solo Developer / PRRC

The sole individual responsible for all QMS activities. Responsibilities include:

**Quality management:**
- Maintaining and updating this Quality Manual
- Conducting management reviews per QM-004
- Executing and documenting internal audits
- Managing corrective and preventive actions (CAPA)
- Controlling all QMS documents and records

**Design and development:**
- Executing all design and development activities per DC-001 Design and Development Plan
- Maintaining design inputs (DC-002), outputs (DC-003), and verification records (DC-004)
- Implementing all risk controls specified in RM-003

**Risk management:**
- Conducting and maintaining the risk management file (RM-001 through RM-004)
- Reviewing risk management file at each product change and annually
- Evaluating post-market signals for new hazards

**Regulatory affairs:**
- Maintaining regulatory strategy (RG-001)
- Managing IP clearance and instrument licensing
- Preparing and maintaining technical documentation
- Registering the device in EUDAMED
- Issuing the Declaration of Conformity

**Post-market:**
- Operating the post-market surveillance system (PM-001)
- Preparing Periodic Safety Update Reports (PM-002)
- Handling complaints (PM-003)

##### PRRC — MDR Article 15

The PRRC is the sole developer. PRRC responsibilities under MDR Article 15 include:

- Ensuring conformity of devices with the QMS
- Ensuring technical documentation and Declaration of Conformity are prepared and kept up to date
- Ensuring post-market obligations are fulfilled
- Ensuring reporting obligations are fulfilled
- Making the statement of no conflict of interest regarding regulatory compliance

##### Clinical Reviewer (External, Named per Activity)

An independent qualified clinician (GP, psychiatrist, or psychologist) engaged to review:
- CE-003 Clinical Evaluation Report — final sign-off required before release
- LB-001 Instructions for Use — review of clinical accuracy

The clinical reviewer is not an employee. Their engagement, qualifications, and review outputs are documented in the relevant QMS records.

##### Notified Body

An EU-notified body shall be engaged for conformity assessment of ClarityCheck v1.0 as a Class IIa SaMD. The Notified Body shall conduct:
- QMS audit against ISO 13485:2016
- Technical documentation review
- Issuance of EU Technical Documentation Assessment Certificate

---

### 4. QMS Process Map

The ClarityCheck QMS operates across the following process categories, each governed by documented procedures:

```
┌──────────────────────────────────────────────────────────────┐
│                    MANAGEMENT PROCESSES                       │
│  QM-001 Quality Manual  │  QM-004 Management Review         │
│  QM-002 Quality Policy  │  QM-005 Internal Audit            │
│  QM-003 Roles & Resp.   │  QM-006 CAPA                      │
└───────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                   CORE PRODUCT PROCESSES                      │
│                                                              │
│  DESIGN CONTROL          RISK MANAGEMENT    CLINICAL EVAL   │
│  DC-001 D&D Plan         RM-001 RM Plan     CE-001 CEP      │
│  DC-002 Inputs           RM-002 FMEA        CE-002 Lit Rev  │
│  DC-003 Outputs          RM-003 Controls    CE-003 CER      │
│  DC-004 V&V Plan         RM-004 Residual                    │
│                                                              │
│  USABILITY               LABELING           REGULATORY      │
│  UE-001 UE Plan          LB-001 IFU         RG-001 Strategy │
│  UE-004 UE Summary       LB-002 In-app      RG-002 DoC      │
└──────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                  SUPPORT PROCESSES                            │
│  Document Control        Record Control     Change Control   │
│  QM-007 Doc Control      QM-008 Records     QM-009 Change   │
└──────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                POST-MARKET PROCESSES                          │
│  PM-001 PMS Plan  │  PM-002 PSUR  │  PM-003 Complaints      │
└──────────────────────────────────────────────────────────────┘
```

---

### 5. ISO 13485:2016 Clause Mapping

This section maps each ISO 13485:2016 clause to the corresponding ClarityCheck QMS document or process. It serves as the primary reference for Notified Body audit preparation.

| ISO 13485 Clause | Title | ClarityCheck QMS Reference |
|---|---|---|
| 4.1 | General QMS requirements | QM-001 §4 |
| 4.2.1 | Documentation requirements — general | QM-001 §6 |
| 4.2.2 | Quality Manual | QM-001 (this document) |
| 4.2.3 | Medical device file | QM-001 §7 — Technical Documentation |
| 4.2.4 | Document control | QM-007 Document Control Procedure |
| 4.2.5 | Record control | QM-008 Record Control Procedure |
| 5.1 | Management commitment | QM-001 §2; QM-004 |
| 5.2 | Customer focus | QM-001 §2.1; DC-002 intended user |
| 5.3 | Quality policy | QM-001 §2; QM-002 |
| 5.4 | Planning | QM-001 §2.2; DC-001 |
| 5.5 | Responsibility, authority, communication | QM-001 §3; QM-003 |
| 5.6 | Management review | QM-004 Management Review Procedure |
| 6.2 | Human resources | QM-001 §3.2; QM-003 |
| 6.3 | Infrastructure | QM-001 §9 |
| 6.4 | Work environment | Not applicable — software only |
| 7.1 | Planning of product realisation | DC-001 Design and Development Plan |
| 7.2 | Customer-related processes | DC-002 Design Inputs; LB-001 IFU |
| 7.3.1 | Design and development planning | DC-001 |
| 7.3.2 | Design and development inputs | DC-002 |
| 7.3.3 | Design and development outputs | DC-003 |
| 7.3.4 | Design and development review | QM-004; DC-001 |
| 7.3.5 | Design and development verification | DC-004 |
| 7.3.6 | Design and development validation | DC-004 §10 |
| 7.3.7 | Control of design changes | QM-009 Change Control Procedure |
| 7.3.8 | Design transfer | DC-001 §[design transfer section] |
| 7.3.9 | Design and development files | QM-001 §7 |
| 7.4 | Purchasing | Not applicable — no purchased components |
| 7.5.1 | Control of production | Not applicable — software, no manufacturing |
| 7.5.6 | Validation of processes | DC-004 |
| 7.5.8 | Identification and traceability | DC-003 §11; DC-004 §11 |
| 7.6 | Control of monitoring equipment | Not applicable — software only |
| 8.1 | General measurement/monitoring | PM-001; DC-004 |
| 8.2.1 | Customer feedback | PM-001; PM-003 |
| 8.2.2 | Complaints handling | PM-003 Complaint Handling Procedure |
| 8.2.3 | Reporting to authorities | QM-003; PM-002 |
| 8.2.4 | Internal audit | QM-005 Internal Audit Procedure |
| 8.3 | Control of nonconforming product | QM-009; QM-006 CAPA |
| 8.4 | Analysis of data | PM-001; PM-002 |
| 8.5 | Improvement | QM-006 CAPA; QM-004 |

**MDR-specific requirements beyond ISO 13485:**

| MDR Article / Annex | Requirement | QMS Reference |
|---|---|---|
| Article 10 | General obligations of manufacturers | QM-001; QM-003 |
| Article 10(9) | QMS requirements | QM-001 through QM-009 |
| Article 15 | PRRC designation | QM-001 §3.2; QM-003 |
| Article 61 | Clinical evaluation | CE-001, CE-002, CE-003 |
| Article 83–86 | Post-market surveillance | PM-001, PM-002, PM-003 |
| Annex I | GSPR | DC-002, RM-001–004, CE-003, LB-001 |
| Annex VIII Rule 11 | Classification | RG-001 |
| Annex IX | Conformity assessment procedure | RG-002 Declaration of Conformity |
| Annex XIV | Clinical evaluation | CE-001, CE-002, CE-003 |
| Annex XV | Clinical investigations | Not applicable — literature-based evaluation |

---

### 6. Document Control

#### 6.1 Document Hierarchy

All QMS documents are classified as follows:

| Level | Type | Examples |
|---|---|---|
| L1 | Quality Manual | QM-001 |
| L2 | Procedures | QM-004 through QM-009, PM-001 through PM-003 |
| L3 | Work instructions and specifications | DC-003 instrument specifications |
| L4 | Records and evidence | DC-004 test results, audit reports, CAPA records |

#### 6.2 Document Identification

All QMS documents carry:
- Document ID (prefix-number format: QM-001, DC-002, etc.)
- Title
- Version number
- Date
- Author
- Status (Draft / Approved / Superseded)

#### 6.3 Document Control Procedure

Full document control requirements are defined in QM-007. Summary:

- All L1–L3 documents require PRRC review and approval before use
- Approved documents are maintained in the controlled document register
- Superseded versions are retained for minimum 10 years per MDR Article 10(8)
- Changes to any document require change control per QM-009

#### 6.4 Document Register

The controlled document register lists all current approved QMS documents with version, date, and status. It is maintained by the PRRC and reviewed at each management review.

---

### 7. Technical Documentation Structure

The ClarityCheck v1.0 technical documentation is structured to satisfy MDR Annex II and Annex III requirements. The following table maps MDR Annex II sections to ClarityCheck QMS documents:

| MDR Annex II Section | Requirement | ClarityCheck Document(s) |
|---|---|---|
| 1. Device description and specification | Device identity, intended purpose, classification | QM-001 §1; DC-002; RG-001 |
| 2. Information to be supplied by manufacturer | IFU, labeling | LB-001, LB-002 |
| 3. Design and manufacturing information | Design history, software lifecycle | DC-001, DC-002, DC-003, DC-004 |
| 4. General safety and performance requirements | GSPR checklist | RG-001; CE-003 §11 |
| 5. Benefit-risk analysis and risk management | Complete risk file | RM-001, RM-002, RM-003, RM-004 |
| 6. Verification and validation | V&V evidence | DC-004 |
| 7. Clinical evaluation | Complete clinical evaluation file | CE-001, CE-002, CE-003 |

**MDR Annex III — EU Declaration of Conformity:** RG-002 (to be completed before release)

---

### 8. Key Processes

#### 8.1 Design Control Process

Design control is the central process governing ClarityCheck development. It follows the lifecycle defined in DC-001 Design and Development Plan:

```
Design Inputs (DC-002)
        ↓
Design Outputs (DC-003)
        ↓
Verification & Validation (DC-004)
        ↓
Design Transfer / Release
        ↓
Change Control (QM-009)
```

Design reviews are conducted at each stage transition. For a solo developer organisation, design reviews are self-conducted and documented in the management review record (QM-004). Critical design decisions are documented in Design Decision Records (DDR-001, DDR-002).

Design inputs shall always include:
- Functional and non-functional requirements from intended purpose
- Risk control requirements from RM-003
- Usability requirements from UE-001
- Regulatory and standards requirements

Design outputs shall always include:
- Instrument reference specifications (DC-003 §2)
- Scoring algorithm specifications (DC-003 §3)
- Screen and UI specifications (DC-003 §5)
- Test case definitions (DC-003 §4)

#### 8.2 Risk Management Process

Risk management is conducted throughout the device lifecycle per ISO 14971:2019. The risk management file comprises:

- RM-001 Risk Management Plan — scope, criteria, process
- RM-002 Risk Assessment FMEA — hazard identification, estimation, evaluation
- RM-003 Risk Control Measures — control specification and verification
- RM-004 Residual Risk Evaluation — post-control assessment and benefit-risk analysis

Risk management is not a one-time activity. The risk management file shall be reviewed and updated:
- At each design change (QM-009 trigger)
- When post-market surveillance data identifies new hazards
- Annually as part of the PSUR process (PM-002)
- Prior to any major version release

#### 8.3 Clinical Evaluation Process

Clinical evaluation is conducted per MDR Article 61 and Annex XIV. The clinical evaluation file comprises:

- CE-001 Clinical Evaluation Plan
- CE-002 Literature Review
- CE-003 Clinical Evaluation Report

The CER shall be updated at minimum annually and at each major version release. A qualified clinical reviewer independent of the PRRC shall review and sign off the CER before it is considered final.

#### 8.4 Usability Engineering Process

Usability engineering is conducted per IEC 62366-1:2015. The usability engineering file comprises:

- UE-001 Usability Engineering Plan
- FE-001 Formative Evaluation Report (to be completed post-prototype)
- UE-003 Summative Usability Test Report (to be completed pre-release)
- UE-004 Summary of Usability Engineering (to be completed pre-release)

Critical usability findings feed back into risk management — new use-related hazards identified during formative or summative evaluation shall be added to RM-002 and controlled per RM-003.

#### 8.5 Change Control Process

All changes to controlled documents, design outputs, or the released device shall be processed through the change control procedure (QM-009). Change control applies to:

- Changes to instrument text, response options, or scoring algorithms
- Changes to risk controls
- Changes to the IFU or in-app labeling
- Software updates affecting any verified functionality
- Addition of new instruments (e.g. ASRS Part B in v1.1)

Change records shall document:
- Description and rationale for the change
- Impact assessment against DC-002, DC-003, RM-002, and CE-003
- Verification activities required (with reference to DC-004)
- PRRC approval

#### 8.6 Post-Market Surveillance Process

Post-market surveillance is operated per MDR Articles 83–86. The process comprises:

- PM-001 Post-Market Surveillance Plan — proactive and reactive data collection
- PM-002 Periodic Safety Update Report — annual synthesis and benefit-risk update
- PM-003 Complaint Handling Procedure — intake, investigation, CAPA, reporting

Post-market data sources include:
- User feedback submitted via in-app contact (LB-001 §13)
- Open source repository issue tracker
- Published literature surveillance (CE-003 §13)
- Vigilance reporting obligations (MDR Article 87)

Any post-market signal that suggests a new hazard or a change to an existing risk probability or severity shall trigger a risk management review per RM-001 §11.

#### 8.7 Internal Audit Process

Internal audits are conducted per QM-005. For a solo developer organisation:

- Minimum frequency: annually
- Scope: all QMS processes and documents
- Method: structured checklist review against ISO 13485:2016 clause requirements and MDR obligations
- Output: internal audit report with findings classified as nonconformity / observation / improvement opportunity
- Nonconformities shall be addressed via CAPA (QM-006)

As auditor and auditee are the same individual, audit objectivity is maintained by:
- Following a structured, predetermined checklist
- Documenting all findings honestly, including self-identified nonconformities
- Reviewing findings against previous audit records to identify trends
- Engaging external clinical reviewer for clinical evaluation audit elements

#### 8.8 Corrective and Preventive Action (CAPA)

CAPA is managed per QM-006. CAPAs shall be raised for:

- All nonconformities identified in internal audit
- All critical or major defects identified in DC-004 testing
- All complaints involving potential patient harm
- All post-market signals requiring design or process change
- Any deviation from a documented procedure

CAPA records shall document:
- Problem description and root cause analysis
- Corrective action taken
- Preventive action taken to prevent recurrence
- Verification that the action was effective
- PRRC sign-off

---

### 9. Infrastructure and Tools

As a software-only device developed by a solo developer, infrastructure is limited and clearly defined.

| Resource | Description | Control |
|---|---|---|
| Development environment | Local machine — [OS/IDE to be specified] | Developer responsibility |
| Version control | Git — hosted on GitHub | Repository access controlled by PRRC |
| Build and test | [Unit test framework — Jest or equivalent] | Automated tests per DC-004 |
| Document control | [Document management approach — e.g. version-controlled markdown in repo] | QM-007 |
| Issue tracking | GitHub Issues or equivalent | PM-003 complaint handling |
| Open source repository | GitHub — GPL-3.0 | Public; PRRC manages releases |

All infrastructure used in the development and maintenance of ClarityCheck shall be maintained in a state fit for purpose. Any tool failure that could affect the integrity of QMS records or software verification shall be documented and addressed as a CAPA.

---

### 10. Regulatory Strategy Summary

#### 10.1 Classification

ClarityCheck v1.0 is classified as Class IIa under EU MDR 2017/745 Rule 11, as a SaMD intended to provide information used to make decisions with diagnostic or therapeutic purposes, where the consequence of incorrect information presents a moderate risk. Full classification rationale is documented in RG-001.

#### 10.2 Conformity Assessment Route

Class IIa SaMD — Annex IX (QMS + Technical Documentation assessment by Notified Body)

#### 10.3 Standards Applied

| Standard | Application |
|---|---|
| ISO 13485:2016 | Quality management system |
| ISO 14971:2019 | Risk management |
| IEC 62304:2006+AMD1:2015 | Software lifecycle |
| IEC 62366-1:2015 | Usability engineering |
| MEDDEV 2.7/1 rev 4 | Clinical evaluation |
| MDCG 2019-11 | Software qualification and classification guidance |

#### 10.4 EUDAMED Registration

ClarityCheck v1.0 shall be registered in EUDAMED before placing on the EU market. UDI assignment shall be completed before registration. Registration is the responsibility of the PRRC.

---

### 11. Exclusions and Justifications

The following ISO 13485:2016 clauses are excluded from this QMS with justification:

| Clause | Title | Exclusion Justification |
|---|---|---|
| 6.4 | Work environment and contamination control | ClarityCheck is software only. No sterile products, no biological materials, no contamination risk. |
| 7.4 | Purchasing | ClarityCheck has no purchased components, raw materials, or outsourced manufacturing. Open source libraries used are subject to software dependency review, not purchasing controls. |
| 7.5.1–7.5.5 | Control of production and service provision | No manufacturing process. Software release is governed by DC-004 and QM-009. |
| 7.5.7 | Particular requirements for sterile devices | Not applicable. |
| 7.5.9 | Particular requirements for implantable devices | Not applicable. |
| 7.6 | Control of monitoring and measuring equipment | No calibrated measuring equipment used. |

These exclusions do not affect the organisation's ability to provide devices that consistently meet customer and regulatory requirements.

---

### 12. Declaration of Commitment

As the sole developer and PRRC of ClarityCheck, I commit to:

- Implementing and maintaining this Quality Management System in accordance with ISO 13485:2016 and EU MDR 2017/745
- Prioritising user safety in all design, risk, and post-market decisions
- Maintaining complete and honest technical documentation
- Seeking external clinical expertise where my own competence is a limitation
- Responding promptly and transparently to any post-market safety signal
- Continuously improving the QMS based on audit findings, post-market data, and regulatory guidance updates

| Role | Name | Date | Signature |
|---|---|---|---|
| PRRC / Quality Manager | | 2026-04-10 | |

---

### 13. Document History

| Version | Date | Summary of Changes |
|---|---|---|
| 1.0 | 2026-04-10 | Initial release |

---

## QMS Complete — ClarityCheck v1.0

QM-001 is the capstone document. The ClarityCheck v1.0 QMS is now substantively complete.

---

## Full QMS Document Register — Final Status

### Management

| ID | Title | Status |
|---|---|---|
| QM-001 | Quality Manual | ✅ Draft |
| QM-002 | Quality Policy | Derived from QM-001 §2 |
| QM-003 | Roles & Responsibilities | Derived from QM-001 §3 |
| QM-004 | Management Review Procedure | Defined in QM-001 §8.1 |
| QM-005 | Internal Audit Procedure | Defined in QM-001 §8.7 |
| QM-006 | CAPA Procedure | Defined in QM-001 §8.8 |
| QM-007 | Document Control Procedure | Defined in QM-001 §6 |
| QM-008 | Record Control Procedure | Referenced |
| QM-009 | Change Control Procedure | Defined in QM-001 §8.5 |

### Design Control

| ID | Title | Status |
|---|---|---|
| DC-002 | Design Inputs | ✅ Complete |
| DC-003 | Design Outputs | ✅ Complete |
| DC-004 | V&V Plan | ✅ Complete |

### Risk Management

| ID | Title | Status |
|---|---|---|
| RM-001 | Risk Management Plan | ✅ Complete |
| RM-002 | Risk Assessment FMEA | ✅ Complete |
| RM-003 | Risk Control Measures | ✅ Complete |
| RM-004 | Residual Risk Evaluation | ✅ Complete |

### Clinical Evaluation

| ID | Title | Status |
|---|---|---|
| CE-001 | Clinical Evaluation Plan | ✅ Complete |
| CE-002 | Literature Review | ✅ Complete |
| CE-003 | Clinical Evaluation Report | ✅ Draft — pending clinical reviewer |

### Regulatory

| ID | Title | Status |
|---|---|---|
| RG-001 Annex A | IP Clearance | ✅ Complete |
| RG-002 | Declaration of Conformity | Not started — pre-release |

### Labeling

| ID | Title | Status |
|---|---|---|
| LB-001 | Instructions for Use | ✅ Complete |
| LB-002 | In-app labeling requirements | Derived from DC-003 §5 |

### Usability Engineering

| ID | Title | Status |
|---|---|---|
| UE-001 | Usability Engineering Plan | ✅ Complete |
| FE-001 | Formative Evaluation Report | Pending prototype |
| UE-003 | Summative Test Report | Pending implementation |
| UE-004 | Summary of Usability Engineering | Pending UE-003 |

### Post-Market

| ID | Title | Status |
|---|---|---|
| PM-001 | PMS Plan | Referenced — not yet written |
| PM-002 | PSUR Template | Referenced — not yet written |
| PM-003 | Complaint Handling Procedure | Referenced — not yet written |

### Design Decisions

| ID | Title | Status |
|---|---|---|
| DDR-001 | ISI excluded from v1.0 | ✅ Complete |
| DDR-002 | ASRS Part A only | ✅ Complete |

---
