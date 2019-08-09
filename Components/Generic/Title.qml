import QtQuick 2.12
import QtQuick.Layouts 1.11

/*
 * Component: Title
 * Author: Alexander Velilyaev
 * Comment: Please use this componnent only inside the Layout.
 */

Text {
    text: qsTr("text")

    font {
        bold: true
        family: "Verdana"
        pointSize: 14
    }

    Layout.alignment: Qt.AlignHCenter
}
