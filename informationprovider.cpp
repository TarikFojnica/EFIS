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
    cout << "Hellow from qml" << endl;
    emit messageChanged(500);
}
