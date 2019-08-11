import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11

/*
 * Component: CurrentColorIndicator
 * Author: Alexander Velilyaev
 */

RowLayout {
    id: control

    ColumnLayout {
        Text {
            text: qsTr("current color")
            font.pointSize: 12
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            Layout.preferredWidth: 100
            Layout.preferredHeight: 35
            Layout.alignment: Qt.AlignHCenter
            font.pointSize: 16

            text: qsTr("#FFFFFF")
        }
    }

    Rectangle {
        width: 60
        height: 60
        border.width: 1
        border.color: "black"
        color: "brown"
    }
}
