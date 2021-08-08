import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    // Shortcuts
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

        property color backgroundColor: "#181A1B"
        property color backgroundActiveBorderColor: "#ff9000"

        background: Rectangle {
            radius: 6
            color: textField.backgroundColor
            border.width: textField.focus ? 1 : 0
            border.color: textField.backgroundActiveBorderColor
        }
    }
}
