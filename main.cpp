#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "dashboardapp.h"

int main(int argc, char *argv[])
{
    DashboardApp app(argc, argv);
    return app.exec();
}
