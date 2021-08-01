import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../SharedComponents"
import "Styles"

Page {
    background: Rectangle { anchors.fill: parent; color: "#2E2F30"}
    anchors.fill: parent

    Container {
        Title { text: qsTr("Log In") }

        Form {
            Input {
                label.text: qsTr("Username")
                placeholderText: qsTr("Username")
            }

            Input {
                label.text: qsTr("Password")
                placeholderText: qsTr("Password")
                echoMode: TextInput.Password
            }

            Button {

                Layout.fillWidth: true
                padding: 16
                font.pointSize: 16
                text: qsTr("Log In")

                background: Rectangle {
                    radius: 6
                    color: "#ff9000"
                }

                MouseArea {
                    hoverEnabled: true
                    anchors.fill: parent
                    cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                }
            }
        }
    }
}
