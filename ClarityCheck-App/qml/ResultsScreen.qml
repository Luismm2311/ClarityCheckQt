// ResultsScreen.qml
// DC-003 §5.5 — Results screen
// Displayed when AppState.currentScreen == "RESULTS" and AppState.scoresAvailable == true.
//
// Required elements (DC-003 §5.5):
//   Global disclaimer (RC-02, RC-04), three instrument result cards (ASRS/PHQ-9/GAD-7),
//   per-card disclaimers, clinical referral advisory, persistent crisis link, print/save button (FR-17).
//
// LB-001 §7 plain-language interpretations used verbatim for result text.
// Prohibited language: diagnosis, diagnose, test, disorder (RC-14 — RC-17).
// ADHD sensitivity statement required (RC-02).
//
// GAD-7 card shown only when AppState.gad7Available == true
// (skipped when crisis path was taken — DC-003 §7).
//
// FR-17 / OIR-28: Print button placeholder — DDR-003 decision pending.

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    background: Rectangle { color: "white" }

    // ── Header ────────────────────────────────────────────────────────────────
    header: Rectangle {
        width: parent.width
        height: 48
        color: "#2A6EA6"

        Text {
            anchors.centerIn: parent
            text: "Your results"
            color: "white"
            font.pixelSize: 17
            font.bold: true
        }
    }

    // ── Helper functions ──────────────────────────────────────────────────────
    // Map ScoringEngine category strings (DC-003 §3) to LB-001 §7 display text

    function phq9Headline(cat) {
        if (cat === "MINIMAL")           return "Few or no symptoms"
        if (cat === "MILD")              return "Some symptoms \u2014 worth monitoring"
        if (cat === "MODERATE")          return "Symptoms worth discussing with a doctor"
        if (cat === "MODERATELY_SEVERE") return "Significant symptoms \u2014 speak to a doctor soon"
        if (cat === "SEVERE")            return "Speak to a doctor as soon as possible"
        return ""
    }

    function phq9Body(cat) {
        if (cat === "MINIMAL")
            return "Your score suggests few or no symptoms of depression at this time."
        if (cat === "MILD")
            return "Your score suggests some symptoms of low mood that may be worth keeping an eye on."
        if (cat === "MODERATE")
            return "Your score suggests symptoms of low mood that would be worth discussing with your doctor or a mental health professional."
        if (cat === "MODERATELY_SEVERE")
            return "Your score suggests significant symptoms of low mood. It would be a good idea to speak to your doctor or a mental health professional soon."
        if (cat === "SEVERE")
            return "Your score suggests severe symptoms of low mood. Please speak to your doctor or a mental health professional as soon as possible."
        return ""
    }

    function gad7Headline(cat) {
        if (cat === "MINIMAL")  return "Few or no symptoms"
        if (cat === "MILD")     return "Some symptoms \u2014 worth monitoring"
        if (cat === "MODERATE") return "Symptoms worth discussing with a doctor"
        if (cat === "SEVERE")   return "Significant symptoms \u2014 speak to a doctor soon"
        return ""
    }

    function gad7Body(cat) {
        if (cat === "MINIMAL")
            return "Your score suggests few or no symptoms of anxiety at this time."
        if (cat === "MILD")
            return "Your score suggests some symptoms of anxiety that may be worth keeping an eye on."
        if (cat === "MODERATE")
            return "Your score suggests symptoms of anxiety that would be worth discussing with your doctor or a mental health professional."
        if (cat === "SEVERE")
            return "Your score suggests significant symptoms of anxiety. It would be a good idea to speak to your doctor or a mental health professional soon."
        return ""
    }

    function severityColor(cat) {
        if (cat === "MINIMAL")           return "#F0F7FF"
        if (cat === "MILD")              return "#FFF8E6"
        if (cat === "MODERATE")          return "#FFF3E0"
        if (cat === "MODERATELY_SEVERE") return "#FEF2F2"
        if (cat === "SEVERE")            return "#FEF2F2"
        return "#F0F7FF"
    }

    function severityBorder(cat) {
        if (cat === "MINIMAL")           return "#C8D8EC"
        if (cat === "MILD")              return "#FFD88A"
        if (cat === "MODERATE")          return "#FFAB76"
        if (cat === "MODERATELY_SEVERE") return "#FECACA"
        if (cat === "SEVERE")            return "#F87171"
        return "#C8D8EC"
    }

    function severityLabel(cat) {
        if (cat === "MINIMAL")           return "Minimal"
        if (cat === "MILD")              return "Mild"
        if (cat === "MODERATE")          return "Moderate"
        if (cat === "MODERATELY_SEVERE") return "Moderately severe"
        if (cat === "SEVERE")            return "Severe"
        return cat
    }

    // ── Main scroll area ──────────────────────────────────────────────────────
    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 0

            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                spacing: 20

                // ── Global disclaimer (RC-02, RC-04) ──────────────────────────
                Rectangle {
                    Layout.fillWidth: true
                    height: disclaimerCol.implicitHeight + 20
                    color: "#F5F5F5"
                    radius: 8
                    border.color: "#D0D0D0"
                    border.width: 1

                    ColumnLayout {
                        id: disclaimerCol
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 12 }
                        spacing: 6

                        Text {
                            Layout.fillWidth: true
                            text: "Important: these results are not a diagnosis"
                            color: "#1C1C1E"
                            font.pixelSize: 14
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        // RC-02: ADHD sensitivity statement required
                        Text {
                            Layout.fillWidth: true
                            text: "Screening tools are not designed to provide a definitive answer about whether you have a " +
                                  "condition. A score above a threshold does not mean you have ADHD, depression, or anxiety, " +
                                  "and a score below a threshold does not rule these out. Only a qualified clinician can " +
                                  "properly assess your situation. Please share these results with your doctor."
                            color: "#3C3C3E"
                            font.pixelSize: 13
                            wrapMode: Text.Wrap
                            lineHeight: 1.4
                        }
                    }
                }

                // ── ASRS result card ──────────────────────────────────────────
                Rectangle {
                    Layout.fillWidth: true
                    height: asrsCardCol.implicitHeight + 24
                    color: AppState.asrsPositiveScreen ? "#FFF8E6" : "#F0F7FF"
                    radius: 8
                    border.color: AppState.asrsPositiveScreen ? "#FFD88A" : "#C8D8EC"
                    border.width: 1

                    ColumnLayout {
                        id: asrsCardCol
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 14 }
                        spacing: 6

                        // Card header row
                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "ADHD Screening"
                                color: "#1A3A52"
                                font.pixelSize: 13
                                font.bold: true
                            }
                            Item { Layout.fillWidth: true }
                            Text {
                                text: AppState.asrsPositiveScreen ? "Positive screen" : "Negative screen"
                                color: AppState.asrsPositiveScreen ? "#92400E" : "#1A3A52"
                                font.pixelSize: 12
                                font.bold: true
                            }
                        }

                        // Score
                        Text {
                            Layout.fillWidth: true
                            text: AppState.asrsPositiveCount + " of 6 items positive"
                            color: "#1C1C1E"
                            font.pixelSize: 16
                            font.bold: true
                        }

                        // LB-001 §7 interpretation
                        Text {
                            Layout.fillWidth: true
                            text: AppState.asrsPositiveScreen
                                  ? "Your answers suggest symptoms that are highly consistent with ADHD in adults. " +
                                    "This does not mean you have ADHD. Speak to your doctor to discuss a proper assessment."
                                  : "Your answers did not reach the threshold associated with ADHD. " +
                                    "This does not rule out ADHD \u2014 approximately 1 in 3 adults with ADHD will " +
                                    "score below this threshold. Speak to your doctor if you have concerns."
                            color: "#3C3C3E"
                            font.pixelSize: 14
                            wrapMode: Text.Wrap
                            lineHeight: 1.4
                        }

                        // Per-card disclaimer
                        Text {
                            Layout.fillWidth: true
                            text: "ASRS v1.1 \u00A9 World Health Organization. Reproduced with permission for research use."
                            color: "#8E8E93"
                            font.pixelSize: 11
                            wrapMode: Text.Wrap
                        }
                    }
                }

                // ── PHQ-9 result card ─────────────────────────────────────────
                Rectangle {
                    Layout.fillWidth: true
                    height: phqCardCol.implicitHeight + 24
                    color: severityColor(AppState.phq9Category)
                    radius: 8
                    border.color: severityBorder(AppState.phq9Category)
                    border.width: 1

                    ColumnLayout {
                        id: phqCardCol
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 14 }
                        spacing: 6

                        // Card header row
                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "Depression Screening"
                                color: "#1A3A52"
                                font.pixelSize: 13
                                font.bold: true
                            }
                            Item { Layout.fillWidth: true }
                            Text {
                                text: severityLabel(AppState.phq9Category)
                                color: "#3C3C3E"
                                font.pixelSize: 12
                                font.bold: true
                            }
                        }

                        // Score
                        Text {
                            Layout.fillWidth: true
                            text: "Score: " + AppState.phq9Score + " / 27"
                            color: "#1C1C1E"
                            font.pixelSize: 16
                            font.bold: true
                        }

                        // LB-001 §7 headline + body
                        Text {
                            Layout.fillWidth: true
                            text: phq9Headline(AppState.phq9Category)
                            color: "#1C1C1E"
                            font.pixelSize: 14
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        Text {
                            Layout.fillWidth: true
                            text: phq9Body(AppState.phq9Category)
                            color: "#3C3C3E"
                            font.pixelSize: 14
                            wrapMode: Text.Wrap
                            lineHeight: 1.4
                        }

                        // Per-card disclaimer
                        Text {
                            Layout.fillWidth: true
                            text: "PHQ-9 \u00A9 Pfizer Inc. Reproduced with permission for research use."
                            color: "#8E8E93"
                            font.pixelSize: 11
                            wrapMode: Text.Wrap
                        }
                    }
                }

                // ── GAD-7 result card (hidden when crisis path taken) ─────────
                Rectangle {
                    Layout.fillWidth: true
                    visible: AppState.gad7Available
                    height: gad7CardCol.implicitHeight + 24
                    color: severityColor(AppState.gad7Category)
                    radius: 8
                    border.color: severityBorder(AppState.gad7Category)
                    border.width: 1

                    ColumnLayout {
                        id: gad7CardCol
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 14 }
                        spacing: 6

                        // Card header row
                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "Anxiety Screening"
                                color: "#1A3A52"
                                font.pixelSize: 13
                                font.bold: true
                            }
                            Item { Layout.fillWidth: true }
                            Text {
                                text: severityLabel(AppState.gad7Category)
                                color: "#3C3C3E"
                                font.pixelSize: 12
                                font.bold: true
                            }
                        }

                        // Score
                        Text {
                            Layout.fillWidth: true
                            text: "Score: " + AppState.gad7Score + " / 21"
                            color: "#1C1C1E"
                            font.pixelSize: 16
                            font.bold: true
                        }

                        // LB-001 §7 headline + body
                        Text {
                            Layout.fillWidth: true
                            text: gad7Headline(AppState.gad7Category)
                            color: "#1C1C1E"
                            font.pixelSize: 14
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        Text {
                            Layout.fillWidth: true
                            text: gad7Body(AppState.gad7Category)
                            color: "#3C3C3E"
                            font.pixelSize: 14
                            wrapMode: Text.Wrap
                            lineHeight: 1.4
                        }

                        // Per-card disclaimer
                        Text {
                            Layout.fillWidth: true
                            text: "GAD-7 \u00A9 Pfizer Inc. Reproduced with permission for research use."
                            color: "#8E8E93"
                            font.pixelSize: 11
                            wrapMode: Text.Wrap
                        }
                    }
                }

                // ── GAD-7 not available notice (crisis path) ──────────────────
                Rectangle {
                    Layout.fillWidth: true
                    visible: !AppState.gad7Available
                    height: gad7NaCol.implicitHeight + 20
                    color: "#F5F5F5"
                    radius: 8
                    border.color: "#D0D0D0"
                    border.width: 1

                    ColumnLayout {
                        id: gad7NaCol
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 12 }
                        spacing: 4

                        Text {
                            Layout.fillWidth: true
                            text: "Anxiety Screening \u2014 not completed"
                            color: "#1A3A52"
                            font.pixelSize: 13
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        Text {
                            Layout.fillWidth: true
                            text: "The anxiety screening was not completed during this session. " +
                                  "You may complete a full assessment at another time."
                            color: "#6B6B6B"
                            font.pixelSize: 13
                            wrapMode: Text.Wrap
                            lineHeight: 1.4
                        }
                    }
                }

                // Divider
                Rectangle { Layout.fillWidth: true; height: 1; color: "#E5E5EA" }

                // ── Clinical referral advisory ────────────────────────────────
                Text {
                    Layout.fillWidth: true
                    text: "Next steps"
                    color: "#1C1C1E"
                    font.pixelSize: 16
                    font.bold: true
                }
                Text {
                    Layout.fillWidth: true
                    text: "These results are designed to help you have a more informed conversation with your doctor. " +
                          "Please share them during your appointment. Your doctor will be able to advise you on " +
                          "appropriate next steps, which may include a more detailed clinical assessment."
                    color: "#3C3C3E"
                    font.pixelSize: 14
                    wrapMode: Text.Wrap
                    lineHeight: 1.5
                }

                // Divider
                Rectangle { Layout.fillWidth: true; height: 1; color: "#E5E5EA" }

                // ── Print / save button (FR-17) ───────────────────────────────
                // OIR-28: DDR-003 decision pending — placeholder shows button but
                // printing is not yet implemented (Wasm target approach TBD).
                Text {
                    Layout.fillWidth: true
                    text: "You can save or print these results to take to your appointment."
                    color: "#6B6B6B"
                    font.pixelSize: 14
                    wrapMode: Text.Wrap
                }

                Button {
                    Layout.fillWidth: true
                    height: 52
                    text: "Save / print results"
                    font.pixelSize: 16
                    font.bold: true

                    background: Rectangle {
                        radius: 8
                        color: parent.enabled ? "#2A6EA6" : "#B0BEC5"
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        font: parent.font
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    // OIR-28: DDR-003 pending — no-op for now
                    onClicked: { /* FR-17 implementation pending DDR-003 */ }
                }

                // ── Research disclaimer footer ────────────────────────────────
                Text {
                    Layout.fillWidth: true
                    Layout.bottomMargin: 8
                    text: "ClarityCheck is a research prototype. It has not been registered as a medical " +
                          "device and must not be used as the sole basis for any clinical decision."
                    color: "#8E8E93"
                    font.pixelSize: 11
                    wrapMode: Text.Wrap
                    lineHeight: 1.4
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}
