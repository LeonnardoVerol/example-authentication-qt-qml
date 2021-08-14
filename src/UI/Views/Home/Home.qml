import QtQuick 2.15
import QtQuick.Controls 2.12

import "../../Core/NavBar"

Page {
    background: Rectangle { color: "#2E2F30"}

    NavBar {}


    Text {
        text: qsTr("Home Screen")
        anchors.centerIn: parent
        font.pointSize: 20
        color: "#CBCBCB"
    }

}
