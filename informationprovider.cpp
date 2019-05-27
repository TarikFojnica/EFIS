#include "informationprovider.h"
#include <iostream>
using std::cout;
using std::endl;

InformationProvider::InformationProvider(QObject *parent)
    : QObject(parent),
      m_counter(0),
      m_message("Hello world from CPP %1")
{

}

void InformationProvider::doMessageChange()
{
    cout << "Take off" << endl;
    emit messageChanged(500);
}

void InformationProvider::doMilitaryJetStyle()
{

    cout << "Military jet style" << endl;
    emit militaryJetStyleExecuted();
}

void InformationProvider::doLoosingControll()
{
    cout << "Loosing control" << endl;
    emit loosingControllExecuted();
}

void InformationProvider::doStop()
{
    cout << "Stop" << endl;
    emit stopExecuted();
}

void InformationProvider::openConfig()
{
    emit configOpened();
}

void InformationProvider::submitConfig()
{
    emit configSubmitted();
}
