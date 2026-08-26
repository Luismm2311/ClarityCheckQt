# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

This repository contains two things:

1. **QMS documentation** (`ClarityCheck-QMS/`) — regulatory and quality documentation for ClarityCheck v1.0, a Class IIa SaMD under EU MDR 2017/745, authored in Markdown.
2. **Source code** (`ClarityCheck-App/`) — a C++/Qt Quick implementation of ClarityCheck targeting **WebAssembly**, to be deployed on GitHub Pages as a **research version** with appropriate disclaimers. Regulatory activities for the full MDR release are not complete; the research version exists to make the tool usable while that work continues.

The device is a self-administered questionnaire app presenting three validated instruments (ASRS v1.1 Part A, PHQ-9, GAD-7) to adults suspected of having ADHD. It scores responses and helps users prepare for a clinical consultation. It does **not** diagnose any condition.

The organisation is a solo developer who also acts as PRRC (Person Responsible for Regulatory Compliance).

---

## Source Code

### Technology Stack

- **Language:** C++17
- **UI framework:** Qt Quick (QML) via Qt 6
- **Build system:** CMake
- **Target platform:** WebAssembly (primary), desktop (development/testing)
- **Deployment:** GitHub Pages (static hosting of the Wasm build)

### Build

Builds are done in **Qt Creator** using Qt 6.8.3. Two kits are configured:
- Desktop kit — for development and testing
- WebAssembly kit — for release builds targeting GitHub Pages

The Wasm build output (`*.js`, `*.wasm`, `qtloader.js`) is deployed to GitHub Pages.

### Architecture

All processing is **client-side only** — no network calls, no server, no data leaves the browser. The application is a single-session, single-user flow:

1. **Disclaimer screen** — research-version notice, not-a-diagnosis warning
2. **Questionnaire flow** — one instrument at a time (ASRS → PHQ-9 → GAD-7), one question per screen or paged
3. **Scoring engine** — C++ classes compute scores per instrument against published cut-offs
4. **Results screen** — plain-language summary with score breakdown and prompt to consult a clinician
5. **Crisis pathway** — if PHQ-9 item 9 ≥ 1, a crisis resource notice is shown before results

The QML layer owns navigation and presentation. C++ owns scoring logic, instrument definitions, and any data model. Keep scoring logic in C++ and unit-testable independent of QML.

### Instrument Constraints

- **ASRS v1.1 Part A (6 items):** item text must match the Harvard/NYU published instrument character-for-character (OIR-07). Cut-off: ≥ 4 of 6 items in the shaded zone.
- **PHQ-9 (9 items + optional item 10):** PHQ-9 item 10 (functional impairment) inclusion is pending IP confirmation with Pfizer (OIR-08) — omit until resolved. Scoring 0–27; standard severity bands apply.
- **GAD-7 (7 items):** scoring 0–21; standard severity bands apply.
- **ASRS Part B** is excluded from v1.0/research version — NYU licensing issue (DDR-002, RG-001).
- Do not paraphrase, reorder, or modify any instrument item wording.

---

## Document Structure

Documents follow a strict ID scheme and folder layout:

| Folder | Scope |
|---|---|
| `01-Management/` | Quality Manual (QM-001) |
| `02-Design-Control/` | Design inputs (DC-002), outputs (DC-003), V&V plan (DC-004), design decision records (DDR-*) |
| `03-Risk-Management/` | Risk plan (RM-001), FMEA (RM-002), risk controls (RM-003), residual risk (RM-004) |
| `04-Clinical-Evaluation/` | CE plan, literature review, CE report (CE-001 to CE-003) |
| `05-Usability/` | Usability engineering plan (UE-001); summative report (UE-003) not yet written |
| `06-Regulatory/` | IP clearance report (RG-001); Declaration of Conformity (RG-002) not yet written |
| `07-Document-Control/` | (empty — procedures not yet written) |
| `08-Post-Market/` | (empty — PM-001/002/003 not yet written) |
| `09-Labeling/` | Instructions for Use (LB-001) |
| `Open-Items-Register.md` | Master list of all open actions across all documents |

Each document has a standard frontmatter block: Document ID, Title, Version, Date, Status, Author, and related documents. Status values are: `Draft`, `Under Review`, `Approved`.

---

## Document Conventions

- Every document that has pending actions carries an **Open Items** section at the end, listing items with IDs in the form `[DOC-ID] OI-NN`.
- The `Open-Items-Register.md` (OIR-001) aggregates all open items across all documents. When an item is resolved, it must be marked ✅ in both the source document and OIR-001.
- Open item IDs in OIR-001 use the scheme `OIR-NN`.
- All version changes must go through QM-004 Change Control (not yet written — see OIR-19).
- Documents reference each other by document ID (e.g., `DC-004`, `RM-002`), not by file path.

---

## Key Facts to Keep in Mind

- **Instrument fidelity is critical.** ASRS v1.1 Part A, PHQ-9, and GAD-7 must not be modified. Any wording change requires change control and IP review.
- **PHQ-9 item 10** (functional impairment) — omit from the research version until OIR-08 (Pfizer IP) is resolved.
- **ASRS Part B** is excluded from v1.0 and the research version — NYU licensing (DDR-002, RG-001).
- **No data is transmitted to a server** — all processing is client-side in both the research version and v1.0.
- **Crisis pathway** (PHQ-9 item 9 score ≥ 1) must show a crisis resource notice. The target deployment region for crisis helpline details is not yet confirmed (OIR-01); use a generic placeholder in the research version.
- **Manufacturer identity fields** in QMS docs are placeholders — see OIR-04. Not relevant to source code.
- The **Open-Items-Register.md** is the authoritative source for what must be resolved before the full MDR v1.0 release.
