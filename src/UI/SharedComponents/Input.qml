import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    // Shortcuts
    property alias required: textField.required
    property alias isValid: textField.isValid
    property alias placeholderText: textField.placeholderText
    property alias echoMode: textField.echoMode

    // Direct Access
    property alias label: label
    property alias input: textField

    spacing: 10

    Label {
        id: label
        text: qsTr("Label")
        font.pointSize: 14
        color: "#CBCBCB"
    }

    TextField  {
        id: textField
        selectByMouse: true
        placeholderText: qsTr("Placeholder Text")
        Layout.fillWidth: true
        padding: 16
        font.pointSize: 16
        color: "#f4ede8"

        property bool isValid: true
        property bool required: true
        property color backgroundColor: "#181A1B"
        property color backgroundActiveBorderColor: "#ff9000"

        function validate()
        {
            if(focus)
            {
                isValid = true;
                return;
            }

            if(required === false)
            {
                isValid = true;
                return;
            }

            if (text.trim().length !== 0)
            {
                isValid = true;
                return;
            }

            isValid = false;
        }

        background: Rectangle {
            radius: 6
            color: textField.backgroundColor
            border.width: (textField.focus || textField.isValid === false ) ? 1 : 0
            border.color: textField.isValid === false ? "red" : textField.backgroundActiveBorderColor
        }

        onFocusChanged: {
            textField.validate()
        }
    }
}
