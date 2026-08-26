// QuestionScreen.qml
// DC-003 §5.3 — Question screen
// Required elements: progress indicator, section label, item number, item text,
// response options, Next button (disabled until response selected).
// No skip button. No back navigation across instrument boundaries.

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    background: Rectangle { color: "white" }

    // ── Progress header ───────────────────────────────────────────────────────
    // DC-003 §5.3: Overall progress + section label — FR-06
    header: Rectangle {
        width: parent.width
        height: 56
        color: "#F0F4F8"

        Rectangle { width: parent.width; height: 1; anchors.bottom: parent.bottom; color: "#C8D0D8" }

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 2

            Text {
                Layout.alignment: Qt.AlignHCenter
                // DC-003 §5.3: Overall progress
                text: "Question " + AppState.overallItemNumber + " of " + AppState.overallItemCount
                color: "#2A6EA6"
                font.pixelSize: 13
                font.bold: true
            }
            Text {
                Layout.alignment: Qt.AlignHCenter
                // DC-003 §5.3: Section label + within-section progress
                text: AppState.currentInstrumentName +
                      "  ·  " + AppState.sectionItemNumber + " of " + AppState.sectionItemCount
                color: "#6B6B6B"
                font.pixelSize: 12
            }
        }
    }

    // ── Progress bar ─────────────────────────────────────────────────────────
    Rectangle {
        id: progressBar
        anchors { top: parent.top; left: parent.left }
        height: 3
        color: "#2A6EA6"
        width: parent.width * (AppState.overallItemNumber / AppState.overallItemCount)

        Behavior on width { NumberAnimation { duration: 200 } }
    }

    // ── Scrollable question + responses ──────────────────────────────────────
    ScrollView {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: nextButtonRow.top
        }
        contentWidth: availableWidth
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 0

            // DC-003 §5.3: Item number + item text — RC-21, RC-22
            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                spacing: 12

                Text {
                    Layout.fillWidth: true
                    text: "Question " + AppState.sectionItemNumber
                    color: "#6B6B6B"
                    font.pixelSize: 13
                }

                Text {
                    Layout.fillWidth: true
                    // DC-003 §5.3: Item text verbatim from InstrumentData — RC-21
                    text: AppState.currentItemText
                    color: "#1C1C1E"
                    font.pixelSize: 17
                    wrapMode: Text.Wrap
                    lineHeight: 1.5
                }
            }

            // Divider
            Rectangle { Layout.fillWidth: true; height: 1; color: "#E5E5EA"; Layout.leftMargin: 20; Layout.rightMargin: 20 }

            // DC-003 §5.3: Response options — single selection, all options shown
            // User may change selection before advancing (FR-04)
            ButtonGroup { id: responseGroup }

            Repeater {
                model: AppState.responseOptions

                delegate: Rectangle {
                    required property int index
                    required property string modelData

                    Layout.fillWidth: true
                    height: responseButton.implicitHeight + 16
                    color: responseButton.checked ? "#E8F4FD" : "white"

                    Rectangle {
                        width: parent.width; height: 1
                        anchors.bottom: parent.bottom
                        color: "#E5E5EA"
                    }

                    RadioButton {
                        id: responseButton
                        anchors {
                            left: parent.left; right: parent.right
                            verticalCenter: parent.verticalCenter
                            leftMargin: 12; rightMargin: 12
                        }
                        text: modelData
                        font.pixelSize: 16
                        ButtonGroup.group: responseGroup
                        // Reflect stored response when question changes
                        checked: AppState.currentResponse === index

                        onClicked: AppState.setCurrentResponse(index)
                    }
                }
            }

            Item { Layout.fillWidth: true; height: 12 }
        }
    }

    // ── Next button ───────────────────────────────────────────────────────────
    // DC-003 §5.3: Disabled until response selected — FR-03
    Rectangle {
        id: nextButtonRow
        anchors { left: parent.left; right: parent.right; bottom: parent.bottom }
        height: 72
        color: "white"

        Rectangle { width: parent.width; height: 1; color: "#E5E5EA" }

        Button {
            anchors {
                left: parent.left; right: parent.right
                verticalCenter: parent.verticalCenter
                leftMargin: 20; rightMargin: 20
            }
            height: 52
            text: "Next"
            enabled: AppState.canAdvance
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

            onClicked: AppState.advance()
        }
    }
}
