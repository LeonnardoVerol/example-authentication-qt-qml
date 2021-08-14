import QtQuick 2.15
import "Types.js" as Types

pragma Singleton
Item {
    signal pushSignal(string url)
    signal popSignal();

    property string initialPage: Types.LOGIN_SCREEN
    readonly property var routes: [
        {
            name: Types.LOGIN_SCREEN,
            path: "qrc:/UI/Views/Login/Login.qml"
        },
        {
            name: Types.REGISTER_SCREEN,
            path: "qrc:/UI/Views/Register/Register.qml"
        },
        {
            name: Types.HOME_SCREEN,
            path: "qrc:/UI/Views/Home/Home.qml"
        }
    ]

    function router(name)
    {
        return routes.find(element => element.name === name).path
    }

    function push(name)
    {
        pushSignal(router(name))
    }

    function goBack()
    {
        popSignal();
    }

    function pop()
    {
        goBack();
    }
}
