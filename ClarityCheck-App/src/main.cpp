#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "AppState.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    AppState appState;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(QStringLiteral("AppState"), &appState);
    engine.loadFromModule("ClarityCheck", "Main");

    if (engine.rootObjects().isEmpty())
        return 1;

    return app.exec();
}
