// InstrumentData.cpp
// Item text verbatim per DC-003 §2. Any change requires change control (QM-009)
// and re-execution of DC-004 CT-01 through CT-03.

#include "InstrumentData.h"

// DC-003 §2.1 — ASRS v1.1 Part A
// Source: Kessler et al. (2005). Psychological Medicine, 35(2), 245–256.
// Copyright: DC-003 §9
const InstrumentDef &InstrumentData::asrs()
{
    static const InstrumentDef def{
        QStringLiteral("ASRS"),
        QStringLiteral("ASRS v1.1"),
        QStringLiteral("Adult ADHD Self-Report Scale — ASRS v1.1 Part A"),
        QStringLiteral("the past 6 months"),
        {
            QStringLiteral("How often do you have trouble wrapping up the final details of a project, once the challenging parts have been done?"),
            QStringLiteral("How often do you have difficulty getting things in order when you have to do a task that requires organisation?"),
            QStringLiteral("How often do you have problems remembering appointments or obligations?"),
            QStringLiteral("When you have a task that requires a lot of thought, how often do you avoid or delay getting started?"),
            QStringLiteral("How often do you fidget or squirm with your hands or feet when you have to sit down for a long time?"),
            QStringLiteral("How often do you feel overly active and compelled to do things, like you were driven by a motor?"),
        },
        {
            QStringLiteral("Never"),
            QStringLiteral("Rarely"),
            QStringLiteral("Sometimes"),
            QStringLiteral("Often"),
            QStringLiteral("Very Often"),
        },
        QStringLiteral("© New York University and the President and Fellows of Harvard College. All rights reserved.\n"
                       "Kessler RC et al. (2005). Psychological Medicine, 35(2), 245\u2013256."),
        1
    };
    return def;
}

// DC-003 §2.2 — PHQ-9
// Source: Kroenke K, Spitzer RL, Williams JBW. (2001). JGIM, 16(9), 606–613.
// Copyright: DC-003 §9
// Note: functional impairment item (item 10) omitted per OIR-08 resolution.
const InstrumentDef &InstrumentData::phq9()
{
    static const InstrumentDef def{
        QStringLiteral("PHQ9"),
        QStringLiteral("PHQ-9"),
        QStringLiteral("Patient Health Questionnaire — PHQ-9"),
        QStringLiteral("the past 2 weeks"),
        {
            QStringLiteral("Little interest or pleasure in doing things"),
            QStringLiteral("Feeling down, depressed, or hopeless"),
            QStringLiteral("Trouble falling or staying asleep, or sleeping too much"),
            QStringLiteral("Feeling tired or having little energy"),
            QStringLiteral("Poor appetite or overeating"),
            QStringLiteral("Feeling bad about yourself \u2014 or that you are a failure or have let yourself or your family down"),
            QStringLiteral("Trouble concentrating on things, such as reading the newspaper or watching television"),
            QStringLiteral("Moving or speaking so slowly that other people could have noticed? Or the opposite \u2014 being so fidgety or restless that you have been moving around a lot more than usual"),
            QStringLiteral("Thoughts that you would be better off dead, or of hurting yourself in some way"),
        },
        {
            QStringLiteral("Not at all"),
            QStringLiteral("Several days"),
            QStringLiteral("More than half the days"),
            QStringLiteral("Nearly every day"),
        },
        QStringLiteral("© 1999 Pfizer Inc. All rights reserved. Developed by Drs. Robert L. Spitzer, Janet B.W. Williams, "
                       "Kurt Kroenke and colleagues. No permission required to reproduce, translate, display or distribute."),
        2
    };
    return def;
}

// DC-003 §2.3 — GAD-7
// Source: Spitzer RL et al. (2006). Archives of Internal Medicine, 166(10), 1092–1097.
// Copyright: DC-003 §9
// Note: functional impairment item (item 8) omitted per OIR-08 resolution.
const InstrumentDef &InstrumentData::gad7()
{
    static const InstrumentDef def{
        QStringLiteral("GAD7"),
        QStringLiteral("GAD-7"),
        QStringLiteral("Generalised Anxiety Disorder Assessment — GAD-7"),
        QStringLiteral("the past 2 weeks"),
        {
            QStringLiteral("Feeling nervous, anxious, or on edge"),
            QStringLiteral("Not being able to stop or control worrying"),
            QStringLiteral("Worrying too much about different things"),
            QStringLiteral("Trouble relaxing"),
            QStringLiteral("Being so restless that it is hard to sit still"),
            QStringLiteral("Becoming easily annoyed or irritable"),
            QStringLiteral("Feeling afraid as if something awful might happen"),
        },
        {
            QStringLiteral("Not at all"),
            QStringLiteral("Several days"),
            QStringLiteral("More than half the days"),
            QStringLiteral("Nearly every day"),
        },
        QStringLiteral("© 1999 Pfizer Inc. All rights reserved. No permission required to reproduce, translate, display or distribute."),
        3
    };
    return def;
}

const InstrumentDef &InstrumentData::forId(const QString &id)
{
    if (id == QStringLiteral("ASRS")) return asrs();
    if (id == QStringLiteral("PHQ9")) return phq9();
    return gad7();
}

int InstrumentData::overallItemNumber(const QString &instrumentId, int zeroBasedIndex)
{
    if (instrumentId == QStringLiteral("ASRS"))
        return zeroBasedIndex + 1;          // 1–6
    if (instrumentId == QStringLiteral("PHQ9"))
        return 6 + zeroBasedIndex + 1;      // 7–15
    return 15 + zeroBasedIndex + 1;         // 16–22
}
