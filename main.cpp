/* Author: Remy van Elst, https://raymii.org
 * License: GNU AGPLv3
 */

#include "TrafficLightClass.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>
#include <QDateTime>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    std::cout << QDateTime::currentMSecsSinceEpoch() << std::endl;

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Singleton Example
    //TrafficLightClass trafficLightSingleton;
    qmlRegisterSingletonType<TrafficLightClass>("org.raymii.RoadObjects", 1, 0, "TrafficLightSingleton",
                                     [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
        Q_UNUSED(engine)
        Q_UNUSED(scriptEngine)

        TrafficLightClass *trafficLightSingleton = new TrafficLightClass();
        return trafficLightSingleton;
    });


    // QML Type example
    qmlRegisterType<TrafficLightClass>("org.raymii.RoadObjectType", 1, 0, "TrafficLightType");


    // rootContext->setContextProperty example
    TrafficLightClass trafficLightContext;
    engine.rootContext()->setContextProperty("trafficLightContextProperty", &trafficLightContext);
    qmlRegisterUncreatableType<TrafficLightClass>("org.raymii.RoadObjectUncreatableType", 1, 0, "TrafficLightUncreatableType", "Only for enum access");


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
