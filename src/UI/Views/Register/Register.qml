import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Store.Navigation 1.0
import Store.Authentication 1.0
import Store.Toast 1.0

import "../../SharedComponents"
import "Styles"

Page {
    background: Rectangle { color: "#2E2F30"}

    Container {
        Title { text: qsTr("Register") }

        Form {
            Input {
                id: name
                label.text: qsTr("Name")
                placeholderText: qsTr("Name")
            }

            Input {
                id: username
                label.text: qsTr("Username")
                placeholderText: qsTr("Username")
            }

            Input {
                id: password
                label.text: qsTr("Password")
                placeholderText: qsTr("Password")
                echoMode: TextInput.Password
            }

            InputError {
                id: inputError
            }

            FormButton {
                id: register
                text: qsTr("Register")
                backgroundColor: "#ff9000"
                backgroundHoverColor: "#FFA100"
                Layout.fillWidth: true

                onClicked: {
                    inputError.text = "";

                    if(parent.isValid() === false)
                    {
                        inputError.text = "All Fields are Required";
                        return;
                    }

                    try {
                        Authentication.register({
                                                    name: name.input.text,
                                                    username: username.input.text,
                                                    password: password.input.text
                                                })

                        Toast.success("Account Created!");
                        Navigation.goBack();
                    }
                    catch(error) {
                        inputError.text = error.errorMessage
                    }
                }
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
