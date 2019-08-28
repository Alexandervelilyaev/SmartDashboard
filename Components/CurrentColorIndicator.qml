import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11

/*
 * Component: CurrentColorIndicator
 * Author: Alexander Velilyaev
 */

RowLayout {
    id: control

    signal colorChanged(string color)
    signal clicked()

    ColumnLayout {
        Text {
            text: qsTr("current color")
            font.pointSize: 12
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: hexColor
            Layout.preferredWidth: 100
            Layout.preferredHeight: 35
            Layout.alignment: Qt.AlignHCenter
            font.pointSize: 16
            text: "#000000"
            font.capitalization: Font.AllUppercase

            onTextChanged: control.colorChanged(text)
        }
    }

    Rectangle {
        width: 60
        height: 60
        border.width: 1
        border.color: "black"
        color: hexColor.text

        MouseArea {
            anchors.fill: parent
            onClicked: control.clicked()
        }
    }

    function setColor(color) {
        hexColor.text = color
    }

    function getColor() {
        return hexColor.text
    }
}
