import QtQuick 2.15
import QtQuick.Controls 2.3

Button {
    id: control

    padding: 16
    font.pointSize: 16

    property color textColor: "black"
    property color backgroundColor: "transparent"
    property color backgroundHoverColor: "transparent"
    property color backgroundHoverBorderColor: "transparent"

    contentItem: Text {
        text: control.text
        color: control.textColor
        font: control.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        radius: 6
        color: control.hovered ? control.backgroundHoverColor : control.backgroundColor
        border.width: control.hovered ? 1 : 0
        border.color: control.backgroundHoverBorderColor
    }
}
