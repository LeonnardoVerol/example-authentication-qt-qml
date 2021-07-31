import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property alias placeholderText: textField.placeholderText
    property alias text: label.text
    property alias labelColor: label.color
    property alias inputColor: textField.color
    property alias inputBackground: textFieldBackground.color
    property alias echoMode: textField.echoMode

    spacing: 10


    Label {
        id: label
        text: "Label"
        font.pointSize: 14
        color: "#CBCBCB"
    }

    TextField  {
        id: textField
        selectByMouse: true
        placeholderText: "Placeholder Text"
        Layout.fillWidth: true
        padding: 16
        font.pointSize: 16
        color: "#f4ede8"

        background: Rectangle {
            id: textFieldBackground
            radius: 6
            //color: "#222921"
            color: "#181A1B"
//                    border.color: "#144d0b"
            //border.width: 2
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
