import QtQuick 2.0

Text {
    id: control
    color: "red"
    font.pointSize: 12
    font.letterSpacing: 1.3

    states: [
        State {
            name: "DEFAULT"
            when: control.text === ""
            PropertyChanges { target: control; visible: false }
        },
        State {
            name: "HAS_ERROR"
            when: control.text !== ""
            PropertyChanges { target: control; visible: true }
        }
    ]
}
