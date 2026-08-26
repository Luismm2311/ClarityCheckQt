// AppState.h
//
// Application state machine and session data.
// Implements DC-003 §7 state transition rules.
// Safety-critical controls: age gate (RC-26), crisis gate (RC-09, RC-11).
// Verified by DC-004 FT-SAFE-01, FT-SAFE-02, FT-SAFE-03.
//
// Registered as a QML context property in main.cpp.
// QML reads all session state through this object only.
// No scoring or safety-critical logic lives in QML.
//
// Note on crisis path (DC-003 §7):
//   When PHQ-9 item 9 (index 8) response > 0, the crisis screen is shown
//   immediately after PHQ-9 completes. GAD-7 is skipped; scores are computed
//   for ASRS and PHQ-9 only. The GAD-7 result will be unavailable on the
//   results screen in crisis cases.
//   If functional impairment item is added in future (OIR-08), update
//   phq9ItemCount() and gad7ItemCount() only; the crisis check index (8)
//   does not change.

#pragma once

#include <QList>
#include <QObject>
#include <QString>
#include <QStringList>

#include "InstrumentData.h"
#include "ScoringEngine.h"

class AppState : public QObject
{
    Q_OBJECT

    // ── Navigation ───────────────────────────────────────────────────────────
    Q_PROPERTY(QString currentScreen   READ currentScreen   NOTIFY currentScreenChanged)
    Q_PROPERTY(QString currentInstrumentId READ currentInstrumentId NOTIFY currentInstrumentChanged)

    // ── Gates ────────────────────────────────────────────────────────────────
    Q_PROPERTY(bool ageAcknowledged    READ ageAcknowledged    NOTIFY ageAcknowledgedChanged)
    Q_PROPERTY(bool crisisAcknowledged READ crisisAcknowledged NOTIFY crisisAcknowledgedChanged)
    Q_PROPERTY(bool crisisFlag         READ crisisFlag         NOTIFY crisisFlagChanged)

    // ── Current item ─────────────────────────────────────────────────────────
    Q_PROPERTY(int  currentItemIndex   READ currentItemIndex   NOTIFY currentItemChanged)
    Q_PROPERTY(bool canAdvance         READ canAdvance         NOTIFY canAdvanceChanged)
    Q_PROPERTY(int  currentResponse    READ currentResponse    NOTIFY currentItemChanged)

    // ── Progress display ─────────────────────────────────────────────────────
    Q_PROPERTY(int overallItemNumber   READ overallItemNumber  NOTIFY currentItemChanged)
    Q_PROPERTY(int overallItemCount    READ overallItemCount   CONSTANT)
    Q_PROPERTY(int sectionItemNumber   READ sectionItemNumber  NOTIFY currentItemChanged)
    Q_PROPERTY(int sectionItemCount    READ sectionItemCount   NOTIFY currentInstrumentChanged)
    Q_PROPERTY(int sectionNumber       READ sectionNumber      NOTIFY currentInstrumentChanged)

    // ── Instrument metadata (for intro screen) ───────────────────────────────
    Q_PROPERTY(QString instrumentFullName  READ instrumentFullName  NOTIFY currentInstrumentChanged)
    Q_PROPERTY(QString instrumentRecallPeriod READ instrumentRecallPeriod NOTIFY currentInstrumentChanged)
    Q_PROPERTY(QString instrumentCopyright READ instrumentCopyright NOTIFY currentInstrumentChanged)

    // ── Current question content ─────────────────────────────────────────────
    Q_PROPERTY(QString currentItemText       READ currentItemText       NOTIFY currentItemChanged)
    Q_PROPERTY(QStringList responseOptions   READ responseOptions       NOTIFY currentInstrumentChanged)
    Q_PROPERTY(QString currentInstrumentName READ currentInstrumentName NOTIFY currentInstrumentChanged)

    // ── Scores (available only when currentScreen == "RESULTS") ─────────────
    Q_PROPERTY(bool   scoresAvailable      READ scoresAvailable      NOTIFY scoresAvailableChanged)
    Q_PROPERTY(int    asrsPositiveCount    READ asrsPositiveCount    NOTIFY scoresAvailableChanged)
    Q_PROPERTY(bool   asrsPositiveScreen   READ asrsPositiveScreen   NOTIFY scoresAvailableChanged)
    Q_PROPERTY(int    phq9Score            READ phq9Score            NOTIFY scoresAvailableChanged)
    Q_PROPERTY(QString phq9Category        READ phq9Category         NOTIFY scoresAvailableChanged)
    Q_PROPERTY(int    gad7Score            READ gad7Score            NOTIFY scoresAvailableChanged)
    Q_PROPERTY(QString gad7Category        READ gad7Category         NOTIFY scoresAvailableChanged)
    Q_PROPERTY(bool   gad7Available        READ gad7Available        NOTIFY scoresAvailableChanged)

public:
    explicit AppState(QObject *parent = nullptr);

    // ── Property readers ─────────────────────────────────────────────────────
    QString currentScreen() const   { return m_screen; }
    QString currentInstrumentId() const { return m_instrumentId; }

    bool ageAcknowledged() const    { return m_ageAcknowledged; }
    bool crisisAcknowledged() const { return m_crisisAcknowledged; }
    bool crisisFlag() const         { return m_crisisFlag; }

    int  currentItemIndex() const   { return m_itemIndex; }
    bool canAdvance() const;
    int  currentResponse() const;

    int  overallItemNumber() const;
    int  overallItemCount() const   { return InstrumentData::totalItems(); }
    int  sectionItemNumber() const  { return m_itemIndex + 1; }
    int  sectionItemCount() const;
    int  sectionNumber() const;

    QString instrumentFullName() const;
    QString instrumentRecallPeriod() const;
    QString instrumentCopyright() const;
    QString currentItemText() const;
    QStringList responseOptions() const;
    QString currentInstrumentName() const;

    bool    scoresAvailable() const  { return m_scoresAvailable; }
    int     asrsPositiveCount() const { return m_asrsResult.positiveCount; }
    bool    asrsPositiveScreen() const { return m_asrsResult.positiveScreen; }
    int     phq9Score() const        { return m_phq9Result.score; }
    QString phq9Category() const     { return m_phq9Result.category; }
    int     gad7Score() const        { return m_gad7Result.score; }
    QString gad7Category() const     { return m_gad7Result.category; }
    bool    gad7Available() const    { return m_gad7Available; }

public slots:
    // DC-003 §7: WELCOME → INSTRUMENT_INTRO only when ageAcknowledged == true
    void acknowledgeAge();

    // DC-003 §7: INSTRUMENT_INTRO → QUESTION (always permitted)
    void beginInstrument();

    // Set response for current item; enables canAdvance
    void setCurrentResponse(int value);

    // Advance to next item or screen per DC-003 §7 state machine
    void advance();

    // DC-003 §7: CRISIS → RESULTS only when crisisAcknowledged == true
    void acknowledgeCrisis();

signals:
    void currentScreenChanged();
    void currentInstrumentChanged();
    void ageAcknowledgedChanged();
    void crisisAcknowledgedChanged();
    void crisisFlagChanged();
    void currentItemChanged();
    void canAdvanceChanged();
    void scoresAvailableChanged();

private:
    void transitionToInstrument(const QString &instrumentId);
    void computeScores();
    const InstrumentDef &currentDef() const;

    // Navigation state
    QString m_screen        { QStringLiteral("WELCOME") };
    QString m_instrumentId  { QStringLiteral("ASRS") };
    int     m_itemIndex     { 0 };

    // Gates
    bool m_ageAcknowledged    { false };
    bool m_crisisAcknowledged { false };
    bool m_crisisFlag         { false };

    // Responses — -1 means no response recorded
    QList<int> m_asrsResponses { -1, -1, -1, -1, -1, -1 };
    QList<int> m_phq9Responses { -1, -1, -1, -1, -1, -1, -1, -1, -1 };
    QList<int> m_gad7Responses { -1, -1, -1, -1, -1, -1, -1 };

    // Scores
    bool       m_scoresAvailable { false };
    bool       m_gad7Available   { false };
    AsrsResult m_asrsResult;
    Phq9Result m_phq9Result;
    Gad7Result m_gad7Result;
};
