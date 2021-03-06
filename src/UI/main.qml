import QtQuick 2.15
import QtQuick.Window 2.15

import Styles.Colors 1.0
import "Core/Navigation"
import "Core/Toast"

Window {
    minimumWidth: 450
    width: 450
    minimumHeight: 768
    height: 768
    color: Colors.application.background

    visible: true
    title: qsTr("Example Authentication in QT / QML")

    Navigation {}

    ToastManager {}
}
