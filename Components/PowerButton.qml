import QtQuick 2.12
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11

/*
 * Component: PowerButton
 * Author: Alexander Velilyaev
 * Comment: Used to switch between statuses: {disconnected, connecting, connected}.
 */

MouseArea {
    id: control
    width: 80
    height: 80

    hoverEnabled: true
    onHoveredChanged: {
        rect.color = containsMouse ? activeColor : normalColor
    }

    property int state: 0

    property color activeColor: "#ECF0F1"
    property color normalColor: "white"

    property color connectingColor: "#ED991A"
    property color connectedColor: "#00FF00"
    property color disconnectedColor: "#FF0000"

    property string redButtonImage: "../Images/power-button-red.svg"
    property string orangeButtonImage: "../Images/power-button-orange.svg"
    property string greenButtonImage: "../Images/power-button-green.svg"

    Rectangle {
        id: rect
        anchors.fill: parent
        border.color: disconnectedColor
        border.width: 3
        radius: 50

        Image {
            id: img
            anchors.centerIn: parent
            source: redButtonImage
        }
    }

    DropShadow {
        anchors.fill: rect
        radius: control.pressed ? 15.0 : 10.0
        color: "#80000000"
        source: rect
    }

    Layout.alignment: Qt.AlignHCenter

    function setState(newState) {
        state = newState

        switch(state) {
        case 0:
            rect.border.color = disconnectedColor
            img.source = redButtonImage
            break;

        case 1:
            rect.border.color = connectingColor
            img.source = orangeButtonImage
            break;

        case 2:
            rect.border.color = connectedColor
            img.source = greenButtonImage
            break;

        default: break;
        }
    }
}
