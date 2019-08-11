import QtQuick 2.0

/*
 * Component: Switch
 * Author: Alexander Velilyaev
 */

Rectangle {
    id: control
    width: 100
    height: 40
    color: checked ? enabledColor : disabledColor
    border.color: "black"
    border.width: 1
    radius: isRound ? 50 : 0

    state: checked ? "checked" : "unchecked"

    property bool checked: false
    property color disabledColor: "gray"
    property color enabledColor: "green"
    property bool isRound: true
    property int margin: 5
    property int duration: 300

    states: [
        State {
            name: "checked"
            PropertyChanges { target: control; color: enabledColor}
        },
        State {
            name: "unchecked"
            PropertyChanges { target: control; color: disabledColor}
        }
    ]

    transitions: [
        Transition {
            from: "checked"
            to: "unchecked"
            ColorAnimation { target: control; duration: duration }
        },
        Transition {
            from: "unchecked"
            to: "checked"
            ColorAnimation { target: control; duration: duration }
        }
    ]

    Rectangle {
        id: handle
        width: control.height - control.margin * 2
        height: width
        radius: control.radius
        anchors.leftMargin: control.margin
        anchors.verticalCenter: parent.verticalCenter

        state: control.checked ? "checked" : "unchecked"

        states: [
            State {
                name: "checked"
                PropertyChanges { target: handle; x: chekedPosition }
            },
            State {
                name: "unchecked"
                PropertyChanges { target: handle; x: unChekedPosition }
            }
        ]

        transitions: [
            Transition {
                from: "checked"
                to: "unchecked"
                PropertyAnimation { target: handle; property: "x"; duration: control.duration }
            },
            Transition {
                from: "unchecked"
                to: "checked"
                PropertyAnimation { target: handle; property: "x"; duration: control.duration }
            }
        ]

        property int chekedPosition: control.margin
        property int unChekedPosition: control.width - width - control.margin
    }

    MouseArea {
        anchors.fill: parent
        onClicked: control.checked = !control.checked
    }
}
