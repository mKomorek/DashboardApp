#ifndef HMIDATA_H
#define HMIDATA_H

#include <QObject>
#include <QVariant>
#include <QList>

class HMIdata : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal A0 READ A0 NOTIFY dataUpdated)
    Q_PROPERTY(qreal A1 READ A1 NOTIFY dataUpdated)
    Q_PROPERTY(qreal A2 READ A2 NOTIFY dataUpdated)
    Q_PROPERTY(qreal D7 READ D7 NOTIFY dataUpdated)
    Q_PROPERTY(qreal D6 READ D6 NOTIFY dataUpdated)
    Q_PROPERTY(qreal D5 READ D5 NOTIFY dataUpdated)

public:
    HMIdata(QObject *parent = nullptr);
    ~HMIdata();

    qreal A0() const;
    qreal A1() const;
    qreal A2() const;
    qreal D7() const;
    qreal D6() const;
    qreal D5() const;

    void setData(const QStringList &values);

signals:
    void dataUpdated();

private:
    qreal m_A0;
    qreal m_A1;
    qreal m_A2;
    int m_D7;
    int m_D6;
    int m_D5;
};

#endif // HMIDATA_H
