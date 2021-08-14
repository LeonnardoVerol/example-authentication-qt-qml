import QtQuick 2.15
import QtQuick.Controls 2.15

import Store.Authentication 1.0
import Store.Navigation 1.0

import "../../SharedComponents"

Rectangle {
    height: 60
    color: "#ff9000"

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top

    Text {
        height: parent.height

        text: Navigation.getActiveScreenName()
        font.pointSize: 12
        padding: 20
    }

    FormButton {
        id: dropdown
        height: parent.height
        anchors.right: parent.right

        text: Authentication.user.name
        textColor: "black"
        backgroundHoverColor: "#CC7300"
        font.pointSize: 12
        radius: 0
        onClicked: popup.open()

        Popup {
            id: popup

            x: 0
            y: dropdown.height

            width: 100
            height: dropdown.height
            margins: 0
            padding: 0

            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

            background: Rectangle {
                color: "#ff9000"
            }

            contentItem: FormButton {
                text: qsTr("Log Off")
                font.pointSize: 12
                textColor: "black"
                backgroundColor: "#ff9000"
                backgroundHoverColor: "#CC7300"
                anchors.centerIn: parent
                radius: 0

                onClicked: {
                    Authentication.logoff()
                    Navigation.goBack();
                    popup.close()
                }
            }
        }
    }
}
