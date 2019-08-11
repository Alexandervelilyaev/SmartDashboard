import QtQuick 2.0

/*
 * Component: Switch
 * Author: Alexander Velilyaev
 */

Rectangle {
    id: control
    width: 100
    height: 40
    border.color: "black"
    border.width: 1
    radius: isRound ? width / 2 : 0
    state: checked ? "checked" : "unchecked"

    property bool checked: false
    property int duration: 200
    property color checkedColor: "green"
    property color unCheckedColor: "gray"
    property bool isRound: true
    property int margin: 5

    states: [
        State {
            name: "checked"
            PropertyChanges { target: control; color: checkedColor}
            PropertyChanges { target: handle; x: chekedPosition }
        },
        State {
            name: "unchecked"
            PropertyChanges { target: control; color: unCheckedColor}
            PropertyChanges { target: handle; x: unChekedPosition }
        }
    ]

    transitions: [
        Transition {
            from: "checked"
            to: "unchecked"
            ColorAnimation { target: control; duration: control.duration }
            PropertyAnimation { target: handle; property: "x"; duration: control.duration }
        },
        Transition {
            from: "unchecked"
            to: "checked"
            ColorAnimation { target: control; duration: control.duration }
            PropertyAnimation { target: handle; property: "x"; duration: control.duration }
        }
    ]

    Rectangle {
        id: handle
        width: control.height - control.margin * 2
        height: width
        radius: width / 2
        anchors.verticalCenter: parent.verticalCenter

        property int chekedPosition: control.margin
        property int unChekedPosition: control.width - width - control.margin
    }

    MouseArea {
        anchors.fill: parent
        onClicked: control.checked = !control.checked
    }
}
