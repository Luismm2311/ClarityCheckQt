// InstrumentData.h
//
// Static instrument content — single source of truth for all item text,
// response labels, and copyright notices.
//
// Implements DC-003 §2.1 (ASRS), §2.2 (PHQ-9), §2.3 (GAD-7), §9 (copyright).
// Verified by DC-004 CT-01, CT-02, CT-03.
// Risk control: RC-21 (instrument text), RC-22 (ASRS character-level verification).
//
// No instrument text shall appear in QML files. All QML screens read
// item text and labels from AppState, which delegates here.

#pragma once

#include <QList>
#include <QString>
#include <QStringList>

struct InstrumentDef
{
    QString id;           // "ASRS", "PHQ9", "GAD7"
    QString name;         // Short display name
    QString fullName;     // Full name for intro screen
    QString recallPeriod; // e.g. "the past 6 months"
    QStringList items;    // Item text, 0-indexed
    QStringList responseOptions; // Response labels, 0-indexed (value = index)
    QString copyright;    // Verbatim copyright per DC-003 §9
    int sectionNumber;    // 1, 2, or 3
};

class InstrumentData
{
public:
    // DC-003 §2.1 — ASRS v1.1 Part A
    static const InstrumentDef &asrs();

    // DC-003 §2.2 — PHQ-9 (9 scored items; functional item omitted per OIR-08)
    static const InstrumentDef &phq9();

    // DC-003 §2.3 — GAD-7 (7 scored items; functional item omitted per OIR-08)
    static const InstrumentDef &gad7();

    // Convenience — returns the def for the given instrument ID string
    static const InstrumentDef &forId(const QString &id);

    static constexpr int totalItems() { return 6 + 9 + 7; } // 22 — DC-002 FR-02

    // Overall 1-based item number across the full battery
    // ASRS: 1–6, PHQ-9: 7–15, GAD-7: 16–22
    static int overallItemNumber(const QString &instrumentId, int zeroBasedIndex);
};
