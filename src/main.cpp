#include <QGuiApplication>
#include <QQmlApplicationEngine>

void registerSingletonType()
{
    qmlRegisterSingletonType(QUrl("qrc:/UI/Core/Navigation/Store/NavigationStore.qml"), "Store.Navigation", 1, 0, "Navigation");
    qmlRegisterSingletonType(QUrl("qrc:/UI/Core/Authentication/Store/AuthenticationStore.qml"), "Store.Authentication", 1, 0, "Authentication");
    qmlRegisterSingletonType(QUrl("qrc:/UI/Core/Toast/Store/ToastStore.qml"), "Store.Toast", 1, 0, "Toast");
    qmlRegisterSingletonType(QUrl("qrc:/UI/Styles/Colors.qml"), "Styles.Colors", 1, 0, "Colors");
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/UI/Main.qml"));


    registerSingletonType();


    QObject::connect(&engine,
                     &QQmlApplicationEngine::objectCreated,
                     &app,
                     [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


    engine.load(url);

    return app.exec();
}
