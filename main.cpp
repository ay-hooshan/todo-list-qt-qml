#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "todomodel.h"
#include "todolist.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<ToDoModel>("ToDo", 1, 0, "ToDoModel");
    qmlRegisterUncreatableType<ToDoList>("ToDo", 1, 0, "ToDoList",
        QStringLiteral("ToDoList should not created in QML!"));


    ToDoList toDoList;

    engine.rootContext()->setContextProperty(QStringLiteral("toDoList"), &toDoList);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("tut04", "Main");

    return app.exec();
}
