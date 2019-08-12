import QtQuick 2.12
import QtQuick.Controls 1.2
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
    color: "#DDD"
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
                id: indicator
                Layout.alignment: Qt.AlignHCenter
                Layout.margins: margins * 2
                Component.onCompleted: {
                    setColor("#A52A2A")
                }

                onColorChanged: {
                    console.log("color changed: ", color)
                }
            }

            TabView {
                Layout.fillWidth: true
                Tab {
                    title: "RGB"
                    Rectangle {
                        color: "gray"

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 10

                            RowLayout {
                                Text {
                                    text: qsTr("Red:")
                                    Layout.preferredWidth: 50
                                    //color: "red"
                                    font.bold: true
                                }

                                Slider {
                                    id: redSlider
                                    Layout.fillWidth: true
                                    minimumValue: 1
                                    value: 25
                                    maximumValue: 255
                                    stepSize: 1
                                }

                                Text {
                                    text: redSlider.value
                                    Layout.preferredWidth: 25
                                    //color: "red"
                                    font.bold: true
                                }
                            }

                            RowLayout {
                                Text {
                                    text: qsTr("Green:")
                                    Layout.preferredWidth: 50
                                    //color: "green"
                                    font.bold: true
                                }

                                Slider {
                                    id: greenSlider
                                    Layout.fillWidth: true
                                    minimumValue: 1
                                    value: 25
                                    maximumValue: 255
                                    stepSize: 1
                                }

                                Text {
                                    text: greenSlider.value
                                    Layout.preferredWidth: 25
                                    //color: "green"
                                    font.bold: true
                                }
                            }

                            RowLayout {
                                Text {
                                    text: qsTr("Blue:")
                                    Layout.preferredWidth: 50
                                    //color: "blue"
                                    font.bold: true
                                }

                                Slider {
                                    id: blueSlider
                                    Layout.fillWidth: true
                                    minimumValue: 1
                                    value: 25
                                    maximumValue: 255
                                    stepSize: 1
                                }

                                Text {
                                    text: blueSlider.value
                                    Layout.preferredWidth: 25
                                    //color: "blue"
                                    font.bold: true
                                }
                            }
                        }
                    }
                }
                Tab {
                    title: "Picker"
                    Rectangle { color: "white" }
                }
            }
        } // ColumnLayout
    } // Item
} // Window
