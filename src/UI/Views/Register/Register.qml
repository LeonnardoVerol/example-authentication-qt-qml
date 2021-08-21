import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import Styles.Colors 1.0
import Store.Navigation 1.0
import Store.Authentication 1.0
import Store.Toast 1.0

import "../../SharedComponents"
import "Styles"

Page {
    background: Rectangle { color: Colors.application.background }

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
                id: submit
                text: qsTr("Register")
                backgroundColor: Colors.button.primary.background
                backgroundHoverColor: Colors.button.primary.hovered
                Layout.fillWidth: true

                onClicked: {
                    inputError.text = "";

                    if(parent.isValid() === false)
                    {
                        const msg = "All Fields are Required"
                        inputError.text = msg;
                        Toast.error(msg);
                        return;
                    }

                    try {
                        Authentication.register({
                                                    name: name.input.text,
                                                    username: username.input.text,
                                                    password: password.input.text
                                                })

                        Toast.success("Account Created!");
                        parent.reset()
                        Navigation.goBack();
                    }
                    catch(error) {
                        inputError.text = error.errorMessage
                        Toast.error(error.errorMessage);
                    }
                }
            }

            FormButton {
                text: qsTr("Cancel")
                textColor: Colors.button.secondary.text
                backgroundHoverBorderColor: Colors.button.secondary.hoveredBorder
                Layout.fillWidth: true

                onClicked: Navigation.goBack();
            }
        }
    }
}
