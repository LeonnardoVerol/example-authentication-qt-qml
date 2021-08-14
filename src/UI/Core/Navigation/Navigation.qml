import QtQuick 2.15
import QtQuick.Controls 2.12
import Store.Navigation 1.0

StackView {
    id: stackView
    anchors.fill: parent

    initialItem: Navigation.router(Navigation.initialPage)

    Connections {
        target: Navigation

        function onPushSignal(url)
        {
            stackView.push(url);
        }

        function onPopSignal()
        {
            if(depth !== 1)
            {
                stackView.pop();
            }
        }
    }
}
