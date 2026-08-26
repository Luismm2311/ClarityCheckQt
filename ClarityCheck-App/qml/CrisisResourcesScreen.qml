// CrisisResourcesScreen.qml
// DC-003 §5.7 — Crisis resources screen
// Accessible persistently from all screens via the "Support is available" bar.
// Required elements: heading, body, UK helpline, US helpline, EU reference,
// context-sensitive return navigation.

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: crisisResourcesPage
    background: Rectangle { color: "white" }

    // ── Header ────────────────────────────────────────────────────────────────
    header: Rectangle {
        width: parent.width
        height: 48
        color: "#2A6EA6"

        Text {
            anchors.centerIn: parent
            text: "Support is available"
            color: "white"
            font.pixelSize: 17
            font.bold: true
        }
    }

    // DC-003 §5.7: helpline data
    // OIR-01: region not confirmed — these placeholders used for research version
    ListModel {
        id: helplineModel
        ListElement {
            cardTitle: "UK — Samaritans"
            cardNumber: "Call or text: 116 123"
            cardNote: "Free, 24 hours a day, 7 days a week"
        }
        ListElement {
            cardTitle: "US — 988 Suicide and Crisis Lifeline"
            cardNumber: "Call or text: 988"
            cardNote: "Free, 24 hours a day, 7 days a week"
        }
        ListElement {
            cardTitle: "International"
            cardNumber: "findahelpline.com"
            cardNote: "Directory of crisis lines worldwide"
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

                // DC-003 §5.7: Body — brief plain-language statement
                Text {
                    Layout.fillWidth: true
                    text: "If you are struggling right now, you do not have to face it alone. " +
                          "Trained counsellors are available to listen — free of charge, any time."
                    color: "#1C1C1E"
                    font.pixelSize: 16
                    wrapMode: Text.Wrap
                    lineHeight: 1.5
                }

                // DC-003 §5.7: Helpline cards
                Repeater {
                    model: helplineModel

                    Rectangle {
                        required property string cardTitle
                        required property string cardNumber
                        required property string cardNote

                        Layout.fillWidth: true
                        height: cardColumn.implicitHeight + 24
                        color: "#F0F7FF"
                        radius: 8
                        border.color: "#C8D8EC"
                        border.width: 1

                        ColumnLayout {
                            id: cardColumn
                            anchors {
                                left: parent.left; right: parent.right
                                top: parent.top; margins: 12
                            }
                            spacing: 4

                            Text {
                                Layout.fillWidth: true
                                text: cardTitle
                                color: "#1A3A52"
                                font.pixelSize: 14
                                font.bold: true
                                wrapMode: Text.Wrap
                            }
                            Text {
                                Layout.fillWidth: true
                                text: cardNumber
                                color: "#1C1C1E"
                                font.pixelSize: 18
                                font.bold: true
                                wrapMode: Text.Wrap
                            }
                            Text {
                                Layout.fillWidth: true
                                text: cardNote
                                color: "#6B6B6B"
                                font.pixelSize: 13
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }

                // Divider
                Rectangle { Layout.fillWidth: true; height: 1; color: "#E5E5EA" }

                Text {
                    Layout.fillWidth: true
                    text: "You can return to ClarityCheck at any time by tapping the button below."
                    color: "#6B6B6B"
                    font.pixelSize: 14
                    wrapMode: Text.Wrap
                }

                // DC-003 §5.7: Context-sensitive return navigation
                Button {
                    Layout.fillWidth: true
                    Layout.bottomMargin: 8
                    height: 52
                    text: (AppState.currentScreen === "RESULTS")
                          ? "Return to my results"
                          : "Return to assessment"
                    font.pixelSize: 16
                    font.bold: true

                    background: Rectangle { radius: 8; color: "#2A6EA6" }
                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        font: parent.font
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    onClicked: StackView.view.pop()
                }
            }
        }
    }
}
