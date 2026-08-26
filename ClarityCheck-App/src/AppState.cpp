// AppState.cpp
// State transition logic implements DC-003 §7 exactly.

#include "AppState.h"

AppState::AppState(QObject *parent)
    : QObject(parent)
{}

// ── Helpers ─────────────────────────��────────────────────────────────────────

const InstrumentDef &AppState::currentDef() const
{
    return InstrumentData::forId(m_instrumentId);
}

void AppState::transitionToInstrument(const QString &instrumentId)
{
    m_instrumentId = instrumentId;
    m_itemIndex = 0;
    m_screen = QStringLiteral("INSTRUMENT_INTRO");
    emit currentInstrumentChanged();
    emit currentScreenChanged();
    emit currentItemChanged();
    emit canAdvanceChanged();
}

void AppState::computeScores()
{
    m_asrsResult = ScoringEngine::scoreAsrs(QVector<int>(m_asrsResponses.begin(), m_asrsResponses.end()));
    m_phq9Result = ScoringEngine::scorePhq9(QVector<int>(m_phq9Responses.begin(), m_phq9Responses.end()));

    if (m_gad7Available) {
        m_gad7Result = ScoringEngine::scoreGad7(QVector<int>(m_gad7Responses.begin(), m_gad7Responses.end()));
    }

    m_scoresAvailable = true;
    emit scoresAvailableChanged();
}

// ── Property readers ──────────────────────────────────────────────────��──────

bool AppState::canAdvance() const
{
    if (m_screen == QStringLiteral("INSTRUMENT_INTRO"))
        return true;
    if (m_screen != QStringLiteral("QUESTION"))
        return false;
    return currentResponse() >= 0;
}

int AppState::currentResponse() const
{
    if (m_instrumentId == QStringLiteral("ASRS") && m_itemIndex < m_asrsResponses.size())
        return m_asrsResponses[m_itemIndex];
    if (m_instrumentId == QStringLiteral("PHQ9") && m_itemIndex < m_phq9Responses.size())
        return m_phq9Responses[m_itemIndex];
    if (m_instrumentId == QStringLiteral("GAD7") && m_itemIndex < m_gad7Responses.size())
        return m_gad7Responses[m_itemIndex];
    return -1;
}

int AppState::overallItemNumber() const
{
    return InstrumentData::overallItemNumber(m_instrumentId, m_itemIndex);
}

int AppState::sectionItemCount() const
{
    return currentDef().items.size();
}

int AppState::sectionNumber() const
{
    return currentDef().sectionNumber;
}

QString AppState::instrumentFullName() const     { return currentDef().fullName; }
QString AppState::instrumentRecallPeriod() const { return currentDef().recallPeriod; }
QString AppState::instrumentCopyright() const    { return currentDef().copyright; }
QString AppState::currentInstrumentName() const  { return currentDef().name; }

QString AppState::currentItemText() const
{
    const auto &items = currentDef().items;
    if (m_itemIndex < items.size())
        return items[m_itemIndex];
    return {};
}

QStringList AppState::responseOptions() const
{
    return currentDef().responseOptions;
}

// ── Slots / state transitions ─────────────────────────────────────────────────

// DC-003 §7: WELCOME → INSTRUMENT_INTRO (ASRS) only when ageAcknowledged
void AppState::acknowledgeAge()
{
    if (m_screen != QStringLiteral("WELCOME"))
        return;
    m_ageAcknowledged = true;
    emit ageAcknowledgedChanged();
    transitionToInstrument(QStringLiteral("ASRS"));
}

// DC-003 §7: INSTRUMENT_INTRO → QUESTION (always permitted once on intro screen)
void AppState::beginInstrument()
{
    if (m_screen != QStringLiteral("INSTRUMENT_INTRO"))
        return;
    m_screen = QStringLiteral("QUESTION");
    m_itemIndex = 0;
    emit currentScreenChanged();
    emit currentItemChanged();
    emit canAdvanceChanged();
}

// Set response for the current item
void AppState::setCurrentResponse(int value)
{
    if (m_screen != QStringLiteral("QUESTION"))
        return;

    const bool hadResponse = (currentResponse() >= 0);

    if (m_instrumentId == QStringLiteral("ASRS") && m_itemIndex < m_asrsResponses.size())
        m_asrsResponses[m_itemIndex] = value;
    else if (m_instrumentId == QStringLiteral("PHQ9") && m_itemIndex < m_phq9Responses.size())
        m_phq9Responses[m_itemIndex] = value;
    else if (m_instrumentId == QStringLiteral("GAD7") && m_itemIndex < m_gad7Responses.size())
        m_gad7Responses[m_itemIndex] = value;

    emit currentItemChanged();

    if (!hadResponse)
        emit canAdvanceChanged();
}

// DC-003 §7 — advance through the state machine
void AppState::advance()
{
    if (!canAdvance())
        return;

    if (m_screen == QStringLiteral("INSTRUMENT_INTRO")) {
        beginInstrument();
        return;
    }

    if (m_screen != QStringLiteral("QUESTION"))
        return;

    const int itemCount = currentDef().items.size();
    const int nextIndex = m_itemIndex + 1;

    if (nextIndex < itemCount) {
        // More items remain in this instrument
        m_itemIndex = nextIndex;
        emit currentItemChanged();
        emit canAdvanceChanged();
        return;
    }

    // This instrument is complete — determine next transition
    if (m_instrumentId == QStringLiteral("ASRS")) {
        transitionToInstrument(QStringLiteral("PHQ9"));
        return;
    }

    if (m_instrumentId == QStringLiteral("PHQ9")) {
        // DC-003 §7: crisis check after PHQ-9 item 9 (index 8)
        if (m_phq9Responses[8] > 0) {
            m_crisisFlag = true;
            m_screen = QStringLiteral("CRISIS");
            emit crisisFlagChanged();
            emit currentScreenChanged();
        } else {
            transitionToInstrument(QStringLiteral("GAD7"));
        }
        return;
    }

    if (m_instrumentId == QStringLiteral("GAD7")) {
        // All 22 items complete — compute scores and go to results
        m_gad7Available = true;
        computeScores();
        m_screen = QStringLiteral("RESULTS");
        emit currentScreenChanged();
        return;
    }
}

// DC-003 §7: CRISIS → RESULTS only when crisisAcknowledged
// GAD-7 is skipped in the crisis path (see header note).
void AppState::acknowledgeCrisis()
{
    if (m_screen != QStringLiteral("CRISIS"))
        return;
    m_crisisAcknowledged = true;
    m_gad7Available = false;
    computeScores();
    m_screen = QStringLiteral("RESULTS");
    emit crisisAcknowledgedChanged();
    emit currentScreenChanged();
}
