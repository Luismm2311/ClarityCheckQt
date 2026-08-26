// InstrumentIntroScreen.qml
// DC-003 §5.2 — Instrument introduction screen (parametric, reused for all 3 instruments)
// Required elements: instrument name, recall period, item count, section progress,
// copyright notice, crisis resource link (persistent in Main.qml).

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    background: Rectangle { color: "white" }

    // ── Section progress header ───────────────────────────────────────────────
    header: Rectangle {
        width: parent.width
        height: 48
        color: "#F0F4F8"

        Rectangle { width: parent.width; height: 1; anchors.bottom: parent.bottom; color: "#C8D0D8" }

        Text {
            anchors.centerIn: parent
            // DC-003 §5.2: "Section X of 3"
            text: "Section " + AppState.sectionNumber + " of 3"
            color: "#2A6EA6"
            font.pixelSize: 14
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

            // ── Instrument colour band ────────────────────────────────────────
            Rectangle {
                Layout.fillWidth: true
                height: 110
                color: "#2A6EA6"

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 6

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        // DC-003 §5.2: Instrument name
                        text: AppState.instrumentFullName
                        color: "white"
                        font.pixelSize: 19
                        font.bold: true
                        wrapMode: Text.Wrap
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.parent.width - 40
                    }
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                spacing: 16

                // DC-003 §5.2: Recall period instruction
                Rectangle {
                    Layout.fillWidth: true
                    height: recallText.implicitHeight + 20
                    color: "#E8F4FD"
                    radius: 6

                    Text {
                        id: recallText
                        anchors { left: parent.left; right: parent.right; top: parent.top; margins: 10 }
                        text: "Think about how you have felt over <b>" +
                              AppState.instrumentRecallPeriod + "</b> when answering each question."
                        color: "#1A3A52"
                        font.pixelSize: 15
                        wrapMode: Text.Wrap
                        lineHeight: 1.4
                    }
                }

                // DC-003 §5.2: Item count
                Text {
                    Layout.fillWidth: true
                    text: "This section contains " + AppState.sectionItemCount + " questions."
                    color: "#3A3A3C"
                    font.pixelSize: 15
                    wrapMode: Text.Wrap
                }

                // Divider
                Rectangle { Layout.fillWidth: true; height: 1; color: "#E5E5EA" }

                // DC-003 §5.2: Copyright notice — IP condition, DC-003 §9
                Text {
                    Layout.fillWidth: true
                    text: AppState.instrumentCopyright
                    color: "#6B6B6B"
                    font.pixelSize: 12
                    wrapMode: Text.Wrap
                    lineHeight: 1.4
                }

                // Spacer
                Item { Layout.fillWidth: true; height: 8 }

                // Begin section button
                Button {
                    Layout.fillWidth: true
                    Layout.bottomMargin: 8
                    height: 52
                    text: "Begin section"
                    font.pixelSize: 17
                    font.bold: true

                    background: Rectangle {
                        radius: 8
                        color: "#2A6EA6"
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
