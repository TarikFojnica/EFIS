#ifndef INFORMATIONPROVIDER_H
#define INFORMATIONPROVIDER_H

#include <QObject>
#include <QString>

class InformationProvider : public QObject
{
    Q_OBJECT
public:
    explicit InformationProvider(QObject *parent = nullptr);

signals:
    void messageChanged(int m_counter);

public slots:
    void doMessageChange();

private:
    int m_counter;
    QString m_message;
};

#endif // INFORMATIONPROVIDER_H
