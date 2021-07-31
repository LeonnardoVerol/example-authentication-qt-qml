import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Page {
    background: Rectangle { anchors.fill: parent; color: "#2E2F30"}
    anchors.fill: parent

    Text {
        id: name
        text: qsTr("Home")
        anchors.centerIn: parent
    }

}
