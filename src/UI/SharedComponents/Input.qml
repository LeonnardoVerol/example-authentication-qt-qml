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
    property alias background: background

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

        background: Rectangle {
            id: background
            radius: 6
            color: "#181A1B"
        }
    }
}
