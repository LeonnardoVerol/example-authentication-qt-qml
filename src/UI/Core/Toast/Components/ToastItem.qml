//
// Inspired By:
// https://gist.github.com/jonmcclung/bae669101d17b103e94790341301c129
// https://stackoverflow.com/questions/26879266/make-toast-in-android-by-qml
//

import QtQuick 2.15
import Styles.Colors 1.0
import "../Store/Types.js" as Types

Item {
    id: control

    readonly property real fadeTime: 300
    readonly property real aliveTime: 3000

    anchors.right: (parent != null) ? parent.right : undefined

    height: message.height
    width: message.width


    signal selfDestroy(int index);

    function show(text, status)
    {
        timer.start();
        animation.start();

        message.text = text
        control.state = status
    }

    states: [
        State {
            name: Types.TOAST_ERROR
            PropertyChanges {
                target: container
                color: Colors.toast.error.background

            }
            PropertyChanges {
                target: message
                color: Colors.toast.error.text

            }
        },
        State {
            name: Types.TOAST_SUCCESS
            PropertyChanges {
                target: container
                color: Colors.toast.success.background

            }
            PropertyChanges {
                target: message
                color: Colors.toast.success.text

            }
        }
    ]

    Timer {
        id: timer

        interval: control.aliveTime
        onTriggered: {
            selfDestroy(count -1)
            timer.stop();
        }
    }

    Rectangle {
        id: container
        radius: 8
        anchors.fill: parent
        opacity: 0

        Text {
            id: message
            font.pointSize: 14
            wrapMode: Text.Wrap
            text: control.text

            anchors.centerIn: parent
            padding: 25
        }

        SequentialAnimation on opacity {
            id: animation

            NumberAnimation {
                to: .9
                duration: fadeTime
            }

            PauseAnimation {
                duration: aliveTime - 2 * fadeTime
            }

            NumberAnimation {
                to: 0
                duration: fadeTime
            }
        }
    }
}
