#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "informationprovider.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    InformationProvider informationProvider;
    auto root_context = engine.rootContext();
    root_context->setContextProperty("informationProviderClass", &informationProvider);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
