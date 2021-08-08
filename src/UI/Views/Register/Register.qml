import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Store.Navigation 1.0
import "../../SharedComponents"
import "Styles"

Page {
    background: Rectangle { color: "#2E2F30"}

    Container {
        Title { text: qsTr("Register") }

        Form {
            Input {
                label.text: qsTr("Name")
                placeholderText: qsTr("Name")
            }

            Input {
                label.text: qsTr("Username")
                placeholderText: qsTr("Username")
            }

            Input {
                label.text: qsTr("Password")
                placeholderText: qsTr("Password")
                echoMode: TextInput.Password
            }

            Input {
                label.text: qsTr("Confirm Password")
                placeholderText: qsTr("Password")
                echoMode: TextInput.Password
            }

            FormButton {
                text: qsTr("Register")
                backgroundColor: "#ff9000"
                backgroundHoverColor: "#FFA100"
                Layout.fillWidth: true
            }

            FormButton {
                text: qsTr("Cancel")
                textColor: "#ff9000"
                backgroundHoverBorderColor: "#ff9000"
                Layout.fillWidth: true

                onClicked: Navigation.goBack();
            }
        }
    }
}
