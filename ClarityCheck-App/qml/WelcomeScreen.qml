// WelcomeScreen.qml
// DC-003 §5.1 — Welcome screen required elements (11 items)
// RC-03 (screening disclaimer), RC-13 (crisis advisory),
// RC-24 (age restriction), RC-26 (age gate), RC-27 (emotional content advisory)

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root
    background: Rectangle { color: "white" }

    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 0

            // ── App header ────────────────────────────────────────────────────
            Rectangle {
                Layout.fillWidth: true
                height: 120
                color: "#2A6EA6"

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 4

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        // DC-003 §5.1: App name
                        text: "ClarityCheck"
                        color: "white"
                        font.pixelSize: 30
                        font.bold: true
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        // DC-003 §5.1: App version — DC-002 FR-24
                        text: "v1.0 — Research Version"
                        color: "#C8DCF0"
                        font.pixelSize: 13
                    }
                }
            }

            // ── Content ───────────────────────────────────────────────────────
            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                spacing: 20

                // DC-003 §5.1: Screening disclaimer — RC-03, FR-26
                Rectangle {
                    Layout.fillWidth: true
                    height: disclaimerText.implicitHeight + 20
                    color: "#FFF8E1"
                    radius: 6
                    border.color: "#F9A825"; border.width: 1

                    Text {
                        id: disclaimerText
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 10 }
                        text: "ClarityCheck is a screening tool, not a diagnostic tool. " +
                              "Results do not constitute a diagnosis and require clinical interpretation."
                        color: "#5D4037"
                        font.pixelSize: 14
                        wrapMode: Text.Wrap
                    }
                }

                // DC-003 §5.1: Purpose statement — abbreviated from DC-002 §2
                Text {
                    Layout.fillWidth: true
                    text: "ClarityCheck presents three validated questionnaires — for ADHD (ASRS v1.1), " +
                          "depression (PHQ-9), and anxiety (GAD-7) — scores your responses, and provides " +
                          "results to help you prepare for a conversation with a healthcare professional."
                    color: "#1C1C1E"
                    font.pixelSize: 15
                    wrapMode: Text.Wrap
                    lineHeight: 1.4
                }

                // DC-003 §5.1: Emotional content advisory — RC-27
                Rectangle {
                    Layout.fillWidth: true
                    height: emotionalText.implicitHeight + 20
                    color: "#F3F3F3"
                    radius: 6

                    Text {
                        id: emotionalText
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 10 }
                        text: "This assessment includes questions about mood, sleep, and thoughts of " +
                              "self-harm. You may find some questions distressing."
                        color: "#3A3A3C"
                        font.pixelSize: 14
                        wrapMode: Text.Wrap
                    }
                }

                // DC-003 §5.1: Crisis advisory — RC-13, equivalent to LB-001 §1
                Rectangle {
                    Layout.fillWidth: true
                    height: crisisAdvisoryText.implicitHeight + 20
                    color: "#E8F4FD"
                    radius: 6
                    border.color: "#2A6EA6"; border.width: 1

                    Text {
                        id: crisisAdvisoryText
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 10 }
                        text: "If you are in crisis or having thoughts of harming yourself, please " +
                              "contact a crisis helpline before proceeding. The \"Support is available\" " +
                              "link at the bottom of every screen will take you to helpline numbers."
                        color: "#1A3A52"
                        font.pixelSize: 14
                        wrapMode: Text.Wrap
                        lineHeight: 1.4
                    }
                }

                // Divider
                Rectangle { Layout.fillWidth: true; height: 1; color: "#E5E5EA" }

                // DC-003 §5.1: Age restriction statement — RC-24
                Text {
                    Layout.fillWidth: true
                    text: "ClarityCheck is for adults aged 18 and over."
                    color: "#1C1C1E"
                    font.pixelSize: 15
                    font.bold: true
                    wrapMode: Text.Wrap
                }

                // DC-003 §5.1: Age acknowledgement gate — RC-26
                // Begin button disabled until this is checked
                CheckBox {
                    id: ageCheckBox
                    Layout.fillWidth: true
                    text: "I confirm that I am 18 years of age or over."
                    font.pixelSize: 15
                    checked: AppState.ageAcknowledged
                    onCheckedChanged: {
                        if (checked && !AppState.ageAcknowledged)
                            AppState.acknowledgeAge()
                    }
                }

                // DC-003 §5.1: IFU link — FR-25
                // TODO (OIR pending): link to hosted Instructions for Use document
                Text {
                    Layout.fillWidth: true
                    text: "Instructions for Use"
                    color: "#2A6EA6"
                    font.pixelSize: 14
                    font.underline: true
                    // Placeholder — IFU hosting not yet configured
                }

                // DC-003 §5.1: Begin button — disabled until age gate activated
                Button {
                    Layout.fillWidth: true
                    Layout.topMargin: 4
                    Layout.bottomMargin: 8
                    height: 52
                    text: "Begin assessment"
                    enabled: AppState.ageAcknowledged
                    font.pixelSize: 17
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

                    onClicked: AppState.beginInstrument()
                }
            }
        }
    }
}
