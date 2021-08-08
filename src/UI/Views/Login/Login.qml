import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../SharedComponents"
import "Styles"


Page {
    background: Rectangle { color: "#2E2F30"}

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

            FormButton {
                text: qsTr("Log In")
                backgroundColor: "#ff9000"
                backgroundHoverColor: "#FFA100"
                Layout.fillWidth: true
            }

            FormButton {
                text: qsTr("Register")
                textColor: "#ff9000"
                backgroundHoverBorderColor: "#ff9000"
                Layout.fillWidth: true

            }
        }
    }
}