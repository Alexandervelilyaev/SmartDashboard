import QtQuick 2.0
import QtQuick.Layouts 1.11

import './Generic/' as G

/*
 * Component: OnOffSwitch
 * Author: Alexander Velilyaev
 * Description: Switch with customizable on/off text labels
 */

RowLayout {
    id: control
    property bool checked: false
    property string onText: qsTr("ON")
    property string offText: qsTr("OFF")

    Text {
        text: onText
        font {
            family: "Verdana"
            pointSize: 14
        }
    }

    G.Switch {
        width: 80
        height: 30
        Layout.margins: 10

        onCheckedChanged: {
            control.checked = checked
        }
    }

    Text {
        text: offText
        font {
            family: "Verdana"
            pointSize: 14
        }
    }
}
