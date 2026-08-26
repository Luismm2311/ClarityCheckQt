// CrisisScreen.qml
// DC-003 §5.4 — Crisis pathway screen
// Shown when PHQ-9 item 9 response > 0 (crisisFlag == true).
// Safety-critical: results are unreachable until AppState.acknowledgeCrisis() is called.
// Verified by DC-004 FT-SAFE-01, FT-SAFE-02.
//
// Required elements (DC-003 §5.4):
//   Headline, plain-language body, crisis helplines, acknowledgement button.
// Prohibited: score display, severity language, diagnostic language.

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    background: Rectangle { color: "white" }

    // ── Header ────────────────────────────────────────────────────────────────
    header: Rectangle {
        width: parent.width
        height: 48
        color: "#C0392B"

        Text {
            anchors.centerIn: parent
            text: "Support is available"
            color: "white"
            font.pixelSize: 17
            font.bold: true
        }
    }

    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 0

            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 24
                spacing: 20

                // DC-003 §5.4: Headline
                Text {
                    Layout.fillWidth: true
                    text: "Before you continue"
                    color: "#1C1C1E"
                    font.pixelSize: 22
                    font.bold: true
                    wrapMode: Text.Wrap
                }

                // DC-003 §5.4: Plain-language body
                // OIR-01: region not confirmed — placeholder wording for research version
                Text {
                    Layout.fillWidth: true
                    text: "One of your answers indicated that you may have been " +
                          "bothered by thoughts of self-harm or feeling better off dead. " +
                          "If you are having these thoughts right now, please reach out " +
                          "to a crisis support service. Trained counsellors are available " +
                          "to listen — free of charge, any time."
                    color: "#1C1C1E"
                    font.pixelSize: 16
                    wrapMode: Text.Wrap
                    lineHeight: 1.5
                }

                // DC-003 §5.4: Crisis helplines
                // OIR-01: region not confirmed — placeholders used for research version
                Rectangle {
                    Layout.fillWidth: true
                    height: crisisCardCol1.implicitHeight + 24
                    color: "#FEF2F2"
                    radius: 8
                    border.color: "#FECACA"
                    border.width: 1

                    ColumnLayout {
                        id: crisisCardCol1
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 12 }
                        spacing: 4

                        Text {
                            Layout.fillWidth: true
                            text: "UK \u2014 Samaritans"
                            color: "#7F1D1D"
                            font.pixelSize: 14
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        Text {
                            Layout.fillWidth: true
                            text: "Call or text: 116 123"
                            color: "#1C1C1E"
                            font.pixelSize: 20
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        Text {
                            Layout.fillWidth: true
                            text: "Free, 24 hours a day, 7 days a week"
                            color: "#6B6B6B"
                            font.pixelSize: 13
                            wrapMode: Text.Wrap
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: crisisCardCol2.implicitHeight + 24
                    color: "#FEF2F2"
                    radius: 8
                    border.color: "#FECACA"
                    border.width: 1

                    ColumnLayout {
                        id: crisisCardCol2
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 12 }
                        spacing: 4

                        Text {
                            Layout.fillWidth: true
                            text: "US \u2014 988 Suicide and Crisis Lifeline"
                            color: "#7F1D1D"
                            font.pixelSize: 14
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        Text {
                            Layout.fillWidth: true
                            text: "Call or text: 988"
                            color: "#1C1C1E"
                            font.pixelSize: 20
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        Text {
                            Layout.fillWidth: true
                            text: "Free, 24 hours a day, 7 days a week"
                            color: "#6B6B6B"
                            font.pixelSize: 13
                            wrapMode: Text.Wrap
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: crisisCardCol3.implicitHeight + 24
                    color: "#FEF2F2"
                    radius: 8
                    border.color: "#FECACA"
                    border.width: 1

                    ColumnLayout {
                        id: crisisCardCol3
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 12 }
                        spacing: 4

                        Text {
                            Layout.fillWidth: true
                            text: "International"
                            color: "#7F1D1D"
                            font.pixelSize: 14
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        Text {
                            Layout.fillWidth: true
                            text: "findahelpline.com"
                            color: "#1C1C1E"
                            font.pixelSize: 20
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        Text {
                            Layout.fillWidth: true
                            text: "Directory of crisis lines worldwide"
                            color: "#6B6B6B"
                            font.pixelSize: 13
                            wrapMode: Text.Wrap
                        }
                    }
                }

                // Divider
                Rectangle { Layout.fillWidth: true; height: 1; color: "#E5E5EA" }

                // DC-003 §5.4: Pre-acknowledgement note
                Text {
                    Layout.fillWidth: true
                    text: "When you are ready, you may continue to view your results. " +
                          "Your results will still be there whenever you need them."
                    color: "#6B6B6B"
                    font.pixelSize: 14
                    wrapMode: Text.Wrap
                    lineHeight: 1.4
                }

                // DC-003 §5.4: Acknowledgement button
                // Safety gate: results unreachable without acknowledgement (FT-SAFE-01, FT-SAFE-02)
                Button {
                    Layout.fillWidth: true
                    Layout.bottomMargin: 16
                    height: 52
                    text: "I have read the above. Continue to my results."
                    font.pixelSize: 15
                    font.bold: true

                    background: Rectangle { radius: 8; color: "#2A6EA6" }
                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        font: parent.font
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        padding: 8
                    }

                    onClicked: AppState.acknowledgeCrisis()
                }
            }
        }
    }
}
