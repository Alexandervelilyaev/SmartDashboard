import QtQuick 2.12
import QtQuick.Layouts 1.11
import QtQuick.Window 2.12

Window {
    id: root
    visible: true
    width: 300
    height: 480
    title: qsTr("Smart Dashboard")

    property int margins: 10

    Item {
        x: margins
        y: margins
        width: parent.width - margins * 2
        height: parent.height - margins * 2

        ColumnLayout {
            width: parent.width
            height: parent.height

            Text {
                text: qsTr("Smart Dashboard")
                font {
                    bold: true
                    family: "Verdana"
                    pointSize: 14
                }
                Layout.alignment: Qt.AlignHCenter
            }

            Item {
                Layout.fillHeight: true
            }

        } // ColumnLayout
    } // Item
} // Window
