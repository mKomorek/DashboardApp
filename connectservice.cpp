#include "connectservice.h"

#include <QQmlEngine>
#include <QSerialPortInfo>
#include <QDebug>

ConnectService::ConnectService(QObject *parent) : QObject(parent)
{
    m_serialPort = std::make_shared<QSerialPort>();
    this->searchDevices();
    this->connect();
    m_HMIData = std::make_shared<HMIdata>();
    this->readFromPort();
}

ConnectService::~ConnectService()
{
    this->disconnect();
}

ConnectService &ConnectService::instance()
{
    static ConnectService _instance;
    return _instance;
}

QObject *ConnectService::HMI_data()
{
    QObject* ptr = m_HMIData.get();
    QQmlEngine::setObjectOwnership(ptr, QQmlEngine::ObjectOwnership::CppOwnership);
    return ptr;
}

void ConnectService::searchDevices()
{
    m_devicesInfo = QSerialPortInfo::availablePorts();
    m_devicePortName = m_devicesInfo.at(0).portName();
    emit objectChanged();
}

void ConnectService::connect()
{
    m_serialPort->setPortName(m_devicePortName);

    if(!(m_serialPort->isOpen()))
    {
        if(m_serialPort->open(QSerialPort::ReadWrite))
        {
            m_serialPort->setBaudRate(QSerialPort::Baud9600);
            m_serialPort->setDataBits(QSerialPort::Data8);
            m_serialPort->setParity(QSerialPort::NoParity);
            m_serialPort->setStopBits(QSerialPort::OneStop);
            m_serialPort->setFlowControl(QSerialPort::NoFlowControl);
            QObject::connect(m_serialPort.get(), SIGNAL(readyRead()), this, SLOT(readFromPort()));
            qDebug() << "The port has been opened";
        }
        else
        {
            qDebug() << "Błąd przy otwarciu portu";
        }
    }
    else
    {
        qDebug() << "Port już otwarty";
    }
}

void ConnectService::disconnect()
{
    if(m_serialPort->isOpen())
    {
        m_serialPort->close();
        qDebug() << "zamknieto port";
    }
    else
    {
        qDebug() << "porty nie jest ptwarty";

    }
}

void ConnectService::readFromPort()
{
    while(m_serialPort->canReadLine())
    {
        QString line = m_serialPort->readLine();
        QStringList stringValues = line.split(',');
        qDebug() << stringValues;
        m_HMIData->setData(stringValues);
    }
}
