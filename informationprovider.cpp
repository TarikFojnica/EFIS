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
    cout << "Hello from qml" << endl;
    emit messageChanged(500);
}

void InformationProvider::doMilitaryJetStyle()
{

    cout << "Hello from qml" << endl;
    emit militaryJetStyleExecuted();
}

void InformationProvider::doLoosingControll()
{
    cout << "Hello from qml" << endl;
    emit loosingControllExecuted();
}

void InformationProvider::openConfig()
{
    cout << "Hello from qml" << endl;
    emit configOpened();
}

void InformationProvider::submitConfig()
{
    cout << "Hello from qml" << endl;
    emit configSubmitted();
}
