import QtQuick 2.15

pragma Singleton
Item {
    signal pushSignal(string url)
    signal popSignal();

    property string initialPage: "Login Screen"
    readonly property var routes: [
        {
            name: "Login Screen",
            path: "qrc:/UI/Views/Login/Login.qml"
        },
        {
            name: "Register Screen",
            path: "qrc:/UI/Views/Register/Register.qml"
        },
        {
            name: "Home Screen",
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
