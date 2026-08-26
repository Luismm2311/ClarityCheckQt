## DC-001 Software Development Plan — ClarityCheck v1.0

**Document ID:** DC-001
**Title:** Software Development Plan
**Version:** 1.0
**Date:** 2026-04-12
**Status:** Draft
**Author:** [Solo Developer / PRRC]
**Standard:** IEC 62304:2006+AMD1:2015
**Related Documents:** DC-002, DC-003, DC-004, QM-001

---

### 1. Purpose

This document defines the software development plan for ClarityCheck v1.0 in accordance with IEC 62304:2006+AMD1:2015 clause 5.1. It establishes the software safety class, lifecycle model, development environment, SOUP identification, software unit decomposition, configuration management approach, and traceability strategy.

This plan applies to both the regulated v1.0 release and the research version prototype. The research version follows the same lifecycle activities; regulatory sign-off activities (clinical reviewer, EUDAMED, UDI) are deferred and do not affect the software development lifecycle.

---

### 2. Software Safety Classification

**Declared class: IEC 62304 Class B**

**Rationale:**

ClarityCheck provides screening information to support adult users in preparing for a clinical consultation. It does not make treatment decisions, does not control any therapy or connected device, and does not perform any invasive or physiological measurement.

The consequence of a software failure is provision of incorrect screening information. The most severe foreseeable software failure is failure of the PHQ-9 item 9 crisis detection pathway (H-09 in RM-002), which could result in a user in acute distress not receiving a crisis resource prompt. This constitutes a serious but non-fatal harm category.

Class C applies where software failure could directly cause death or serious irreversible injury as the primary consequence. This is not the case for ClarityCheck: crisis resource information is supplementary to the user's own agency and other safety mechanisms in their environment. The software does not gate access to treatment.

Class A would apply only if no harm or harm limited to temporary discomfort were possible — not appropriate given the vulnerable user population.

**Conclusion:** Class B is the correct and defensible classification. All IEC 62304 Class B obligations apply throughout the software lifecycle.

---

### 3. Lifecycle Model

ClarityCheck v1.0 follows a **sequential development lifecycle** with the following phases:

| Phase | Key Activities | Primary Documents |
|---|---|---|
| Requirements | Define design inputs, intended purpose, user profile, regulatory requirements | DC-002 |
| Design | Define design outputs: instrument specifications, scoring algorithms, screen specs, state model | DC-003 |
| Implementation | Develop software units in defined order; IEC 62304 Class B detail design per unit | Source code |
| Verification | Execute all DC-004 unit and functional tests; record results | DC-004 |
| Validation | Execute end-to-end scenarios; obtain clinical reviewer sign-off | DC-004, CE-003 |
| Release | PRRC sign-off; all mandatory release criteria met; Wasm build deployed to GitHub Pages | DC-004 §12.2 |

Iteration after initial implementation is permitted subject to change control per QM-009. Any change to a verified software unit requires re-execution of the affected DC-004 tests.

---

### 4. Development Environment and Tools

| Tool / Component | Version / Specification | Purpose |
|---|---|---|
| C++ standard | C++17 | Implementation language |
| Qt framework | 6.8.3 | UI framework (Qt Quick / QML), C++ standard library |
| Qt Quick Controls | 6.8.3 (bundled with Qt) | UI components |
| CMake | 3.21 or later | Build system |
| Qt Creator | Current release | IDE; desktop and Wasm build kits |
| Emscripten | See OIR-27 — to be recorded at first successful Wasm build | WebAssembly compilation toolchain |
| Git | Current release | Version control and configuration management |
| GitHub | github.com | Remote repository and release hosting (GitHub Pages) |
| Qt Test (QTest) | 6.8.3 (bundled with Qt) | Unit test framework |
| ctest | Bundled with CMake | Test runner |

**Unit test execution:** All Qt Test unit tests run on the **desktop build kit only**. Qt Test does not run in the Wasm target. The test suite is excluded from the Wasm build via a `if(NOT EMSCRIPTEN)` guard in CMakeLists.txt.

**Build reproducibility:** The Emscripten version must be recorded in this document (§4 above) and in CMakeLists.txt once the first successful Wasm build is confirmed. Wasm release builds shall be tagged in Git (e.g. `v1.0-research`). All QMS documentation is version-controlled in the same Git repository as the source code.

---

### 5. SOUP Identification

Software of Unknown Provenance (SOUP) per IEC 62304 §8.1.2:

| SOUP Item | Version | Manufacturer | Purpose | Known Anomalies Relevant to Intended Use |
|---|---|---|---|---|
| Qt 6.8.3 | 6.8.3 | The Qt Company | UI framework, C++ standard library, QML runtime, WebAssembly runtime | None identified at time of writing |

Qt 6.8.3 is a commercially supported, widely deployed framework. No Qt-specific known anomalies relevant to ClarityCheck's intended use (scoring, crisis detection, screen navigation) have been identified.

SOUP monitoring: Qt release notes and security advisories shall be reviewed at each version update. Any update to Qt requires reassessment of this SOUP entry and, where relevant, re-execution of affected DC-004 tests.

---

### 6. Software Units Decomposition

ClarityCheck is decomposed into the following software units for the purpose of IEC 62304 verification traceability:

| Software Unit | File(s) | Responsibility | Safety-Critical? |
|---|---|---|---|
| `ScoringEngine` | `src/ScoringEngine.h`, `src/ScoringEngine.cpp` | Implements scoring algorithms for ASRS Part A, PHQ-9, and GAD-7 per DC-003 §3. Pure static functions with no Qt UI dependencies. | Yes — incorrect scoring is a reportable hazard (RM-002 H-03, H-04, H-05) |
| `InstrumentData` | `src/InstrumentData.h`, `src/InstrumentData.cpp` | Holds all static instrument content: item text, response labels, response integer values, instrument names, recall periods, copyright notices. Single source of truth for CT-01–CT-03. | Yes — incorrect item text is a hazard (RM-002 H-06) |
| `AppState` | `src/AppState.h`, `src/AppState.cpp` | QObject state machine. Manages session state, response storage, state transitions per DC-003 §7, and crisis flag evaluation. Exposes Q_PROPERTYs to QML. | Yes — crisis gate (H-09) and age gate (H-13) are implemented here |
| QML UI layer | `qml/*.qml` | Screens and navigation. Reads from and writes to AppState. Does not implement any scoring or safety-critical logic. | No — safety logic delegated to AppState and ScoringEngine |

---

### 7. Configuration Management

**Version control system:** Git, hosted on GitHub.

**Branch strategy:**
- `main` — production-ready code and QMS documentation; protected
- `develop` — active development branch

**Release tagging:** Wasm release builds are tagged in Git at the point of deployment (e.g. `v1.0-research`, `v1.0`). Tags are immutable.

**What is version controlled:** All source code, CMakeLists.txt, all QMS Markdown documents, and CLAUDE.md are committed to the same repository. There is a single version history for both software and QMS documents.

**Change control after initial verification:** Any change to a software unit that has passed its DC-004 tests requires a QM-009 change control record documenting the change, rationale, impact on safety, and which DC-004 tests must be re-executed. This applies to all verified units, including instrument text in InstrumentData.

**Build identification:** The application displays its version number on the welcome screen (DC-003 §5.1, FR-24). The version string in CMakeLists.txt is the authoritative version identifier.

---

### 8. Traceability Matrix

This matrix links DC-002 requirements to DC-003 design output sections, the implementing software unit, and DC-004 verification tests. It extends the traceability established in DC-003 §11.

| DC-002 Requirement(s) | DC-003 Section | Software Unit | DC-004 Test(s) |
|---|---|---|---|
| FR-07 (ASRS scoring) | §3.2, §4.1 | `ScoringEngine` | UT-ASRS-01 to UT-ASRS-08 |
| FR-08 (PHQ-9 scoring) | §3.3, §4.2 | `ScoringEngine` | UT-PHQ-01 to UT-PHQ-12 |
| FR-09, FR-10 (GAD-7 scoring) | §3.4, §4.3 | `ScoringEngine` | UT-GAD-01 to UT-GAD-09 |
| FR-19 (crisis trigger) | §5.4, §7 | `AppState` | FT-SAFE-01 |
| FR-19, FR-21 (crisis gate) | §7 | `AppState` | FT-SAFE-02 |
| FR-01, FR-02 (sequence, completeness) | §7 | `AppState`, QML | FT-FLOW-01 |
| FR-03 (skip prevention) | §7 | QML (`QuestionScreen`) | FT-FLOW-02 |
| FR-04 (response change) | §7 | `AppState`, QML | FT-FLOW-03 |
| FR-06 (progress indicator) | §5.3 | QML (`QuestionScreen`) | FT-FLOW-04 |
| FR-22, FR-26 (welcome screen content) | §5.1, §6 | QML (`WelcomeScreen`) | UI-01, FT-SAFE-03 |
| FR-22–FR-26 (age gate) | §5.1 | `AppState`, QML | FT-SAFE-03 |
| FR-12–FR-16 (results screen) | §5.5 | QML (`ResultsScreen`) | UI-02, UI-03 |
| FR-17 (results document) | §5.6 | QML + C++ HTML generation | UI-04 |
| FR-23 (copyright notices) | §2.1–2.3 | `InstrumentData`, QML | UI-05 |
| FR-11, NFR-07–NFR-09 (no data transmitted) | §8 | `AppState` (no persistence) | FT-DATA-01 |
| NFR-03, NFR-04 (viewport, touch) | §5 (general) | QML | UI-06 |
| NFR-10, NFR-11 (browser compatibility) | §4 | All units | UI-07 |
| Instrument text fidelity | §2.1–2.3 | `InstrumentData` | CT-01, CT-02, CT-03 |
| Prohibited terms | §6 | All user-facing strings | CT-04 |

---

### 9. Open Items

| ID | Item | Owner | Due |
|---|---|---|---|
| OIR-27 | Record the Emscripten version used for the Wasm build in §4 of this document and in CMakeLists.txt | PRRC | At first successful Wasm build |
