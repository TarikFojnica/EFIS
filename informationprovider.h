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
    void militaryJetStyleExecuted();
    void loosingControllExecuted();
    void configOpened();
    void configSubmitted();
    void stopExecuted();

public slots:
    void doMessageChange();
    void doMilitaryJetStyle();
    void doLoosingControll();
    void openConfig();
    void submitConfig();
    void doStop();

private:
    int m_counter;
    QString m_message;
};

#endif // INFORMATIONPROVIDER_H
