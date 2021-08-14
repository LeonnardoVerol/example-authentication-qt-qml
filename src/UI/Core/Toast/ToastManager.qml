//
// Inspired By:
// https://gist.github.com/jonmcclung/bae669101d17b103e94790341301c129
// https://stackoverflow.com/questions/26879266/make-toast-in-android-by-qml
//

import QtQuick 2.15
import QtQml.Models 2.15
import Store.Toast 1.0
import "Components"


ListView {
    anchors.fill: parent
    anchors.margins: 30
    spacing: 5

    z: Infinity
    interactive: false

    Connections {
        target: Toast

        function onCreateSignal(text, status)
        {
            model.insert(0, {text: text, status });
        }
    }

    function remove(index)
    {
        model.remove(index);
    }

    displaced: Transition {
        NumberAnimation {
            properties: "y"
            easing.type: Easing.InOutQuad
        }
    }

    delegate: ToastItem {
        Component.onCompleted: {
            show(text, status)
        }

        onSelfDestroy: {
            remove(index);
        }
    }

    model: ListModel {id: model}
}
