import QtQuick 2.15
import QtQuick.Window 2.15
import "Navigation"

Window {
    minimumWidth: 1024
    width: 1024
    minimumHeight: 960
    height: 960
    color: "#2E2F30"

    visible: true
    title: qsTr("Example Authentication in QT / QML")

    Navigation {}
}
