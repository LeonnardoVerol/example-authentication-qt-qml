import QtQuick 2.15

pragma Singleton
QtObject {

    readonly property QtObject application: QtObject {
        readonly property color background: "#2E2F30"
    }

    readonly property QtObject toast: QtObject {

        readonly property QtObject success: QtObject {
            readonly property color background: "#D1E7DD"
            readonly property color text: "#0f5132"
        }

        readonly property QtObject error: QtObject {
            readonly property color background: "#F8D7DA"
            readonly property color text: "#842029"
        }
    }

    readonly property QtObject navBar: QtObject {
        readonly property color background: "#ff9000"

        readonly property QtObject button: QtObject {
            readonly property color background: "transparent"
            readonly property color hovered: "#CC7300"
            readonly property color hoveredBorder: "transparent"
            readonly property color text: "black"
        }
        readonly property QtObject menu: QtObject {
            readonly property color background: "#ff9000"
            readonly property color hovered: "#CC7300"
            readonly property color hoveredBorder: "transparent"
            readonly property color text: "black"
        }
    }

    readonly property QtObject button: QtObject {

        readonly property QtObject primary: QtObject {
            readonly property color background: "#ff9000"
            readonly property color hovered: "#FFA100"
            readonly property color hoveredBorder: "transparent"
            readonly property color text: "black"
        }
        readonly property QtObject secondary: QtObject {
            readonly property color background: "transparent"
            readonly property color hovered: "transparent"
            readonly property color hoveredBorder: "#ff9000"
            readonly property color text: "#ff9000"
        }
    }
}
