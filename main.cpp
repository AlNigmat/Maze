#include "View/mainwindow.h"
#include "Controller/facade.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    al21::Interface inter;
    al21::Facade one(&inter);
    al21::MainWindow w(&one);
    w.show();
    return a.exec();
}
