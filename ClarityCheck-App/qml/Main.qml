import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    visible: true
    width: 480
    height: 800
    title: "ClarityCheck"

    // Track which screen type is currently shown to avoid redundant replacements
    property string shownScreen: "WELCOME"

    // ── Main stack ────────────────────────────────────────────────────────────
    // Fills above the persistent crisis bar.
    // CrisisResourcesScreen is the only item pushed on top (depth > 1);
    // all other screen transitions use replace(null, ...) to clear history.
    StackView {
        id: mainStack
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: crisisBar.top
        }
        initialItem: welcomeComponent

        replaceEnter: Transition {
            PropertyAnimation { property: "opacity"; from: 0; to: 1; duration: 120 }
        }
        replaceExit: Transition {
            PropertyAnimation { property: "opacity"; from: 1; to: 0; duration: 80 }
        }
    }

    // ── Persistent crisis resource link — RC-28, DC-003 §5.3 ─────────────────
    // Visible on all screens. Hidden while CrisisResourcesScreen is open
    // (depth > 1) to prevent recursive push.
    Rectangle {
        id: crisisBar
        anchors { left: parent.left; right: parent.right; bottom: parent.bottom }
        height: 44
        color: "#F0F4F8"
        visible: mainStack.depth === 1

        Rectangle {
            width: parent.width; height: 1
            color: "#C8D0D8"
        }

        Text {
            anchors.centerIn: parent
            text: "Support is available"
            color: "#2A6EA6"
            font.pixelSize: 14
            font.underline: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: mainStack.push(crisisResourcesComponent)
        }
    }

    // ── Screen components ─────────────────────────────────────────────────────
    Component { id: welcomeComponent;        WelcomeScreen {} }
    Component { id: introComponent;          InstrumentIntroScreen {} }
    Component { id: questionComponent;       QuestionScreen {} }
    Component { id: crisisScreenComponent;   CrisisScreen {} }
    Component { id: resultsComponent;        ResultsScreen {} }
    Component { id: crisisResourcesComponent; CrisisResourcesScreen {} }

    // ── AppState → StackView navigation driver ────────────────────────────────
    Connections {
        target: AppState
        function onCurrentScreenChanged() {
            const screen = AppState.currentScreen
            if (screen === root.shownScreen) return
            root.shownScreen = screen
            switch (screen) {
                case "INSTRUMENT_INTRO": mainStack.replace(null, introComponent);        break
                case "QUESTION":         mainStack.replace(null, questionComponent);     break
                case "CRISIS":           mainStack.replace(null, crisisScreenComponent); break
                case "RESULTS":          mainStack.replace(null, resultsComponent);      break
            }
        }
    }
}
