import QtQuick 2.15
import "Types.js" as ScreenTypes

pragma Singleton
Item {
    signal pushSignal(string url)
    signal popSignal();

    property var breadcrumbs: [initialPage]

    property string initialPage: ScreenTypes.LOGIN_SCREEN

    readonly property var routes: [
        {
            id: ScreenTypes.LOGIN_SCREEN,
            name: "Login",
            path: "qrc:/UI/Views/Login/Login.qml",
        },
        {
            id: ScreenTypes.REGISTER_SCREEN,
            name: "Register",
            path: "qrc:/UI/Views/Register/Register.qml",
        },
        {
            id: ScreenTypes.HOME_SCREEN,
            name: "Home",
            path: "qrc:/UI/Views/Home/Home.qml",
        }
    ]

    function getActiveScreenName()
    {
        return routes.find(element => element.id === breadcrumbs[breadcrumbs.length-1]).name
    }

    function router(id)
    {
        return routes.find(element => element.id === id).path
    }

    function push(id)
    {
        breadcrumbs.push(id)
        pushSignal(router(id))
    }

    function goBack()
    {
        breadcrumbs.pop()
        popSignal();
    }

    function pop()
    {
        goBack();
    }
}
