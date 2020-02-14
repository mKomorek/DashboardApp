#ifndef ARDUINOUART_H
#define ARDUINOUART_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "connectservice.h"

class DashboardApp : public QGuiApplication
{
    Q_OBJECT
public:
    DashboardApp(int &argc, char **argv);
    ~DashboardApp();

private:
    QQmlApplicationEngine m_engine;
};

#endif // ARDUINOUART_H
