#include "hmidata.h"
#include <QDebug>

HMIdata::HMIdata(QObject *parent) : QObject(parent)
{

}

HMIdata::~HMIdata()
{

}

qreal HMIdata::A0() const
{
    return m_A0;
}

qreal HMIdata::A1() const
{
    return m_A1;
}

qreal HMIdata::A2() const
{
    return m_A2;
}

qreal HMIdata::D7() const
{
    return m_D7;
}

qreal HMIdata::D6() const
{
    return m_D6;
}

qreal HMIdata::D5() const
{
    return m_D5;
}

void HMIdata::setData(const QStringList &values)
{
    if(values.size() == 6)
    {
        m_A0 = static_cast<int>(values[0].toDouble());
        m_A1 = static_cast<int>(values[1].toDouble());
        m_A2 = static_cast<int>(values[2].toDouble());
        m_D7 = static_cast<int>(values[3].toDouble());
        m_D6 = static_cast<int>(values[4].toDouble());
        m_D5 = static_cast<int>(values[5].toDouble());
        emit dataUpdated();
    }
}
