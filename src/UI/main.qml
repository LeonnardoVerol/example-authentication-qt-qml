import QtQuick 2.15
import QtQuick.Window 2.15
import "Core/Navigation"
import "Core/Toast"

Window {
    minimumWidth: 1024
    width: 1024
    minimumHeight: 768
    height: 768
    color: "#2E2F30"

    visible: true
    title: qsTr("Example Authentication in QT / QML")

    Navigation {}

    ToastManager {}
}
