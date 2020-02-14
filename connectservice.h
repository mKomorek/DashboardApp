#ifndef CONNECTSERVICE_H
#define CONNECTSERVICE_H

#include <QObject>
#include <QSerialPort>
#include <memory>
#include "Model/hmidata.h"

class ConnectService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QObject* HMI_data READ HMI_data CONSTANT)

public:
    static ConnectService& instance();

public slots:
    QObject *HMI_data();
    void searchDevices();
    void connect();
    void disconnect();

    void readFromPort();

signals:
    void objectChanged();

private:
    ConnectService(QObject *parent = nullptr);
    ~ConnectService();

    std::shared_ptr<QSerialPort> m_serialPort;
    QList<QSerialPortInfo> m_devicesInfo;
    QString m_devicePortName;
    std::shared_ptr<HMIdata> m_HMIData;
};

#endif // CONNECTSERVICE_H
