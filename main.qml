import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11
import QtQuick.Window 2.12

import './Components/' as C
import './Components/Generic/' as CG

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

            CG.Title {
                text: qsTr("Smart Dashboard")
            }

            C.PowerButton {
                Layout.margins: margins * 2
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    setState(1);
                }
            }

            C.OnOffSwitch {
                Layout.alignment: Qt.AlignHCenter

                onCheckedChanged: {
                    console.log(checked ? "ON" : "OFF");
                }
            }

            C.CurrentColorIndicator {
                Layout.alignment: Qt.AlignHCenter
                Layout.margins: margins * 2
            }

            Item {
                Layout.fillHeight: true
            }

        } // ColumnLayout
    } // Item
} // Window
