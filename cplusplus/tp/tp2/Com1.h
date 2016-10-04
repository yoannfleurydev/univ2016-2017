#ifndef TP2_COM1_H
#define TP2_COM1_H

#include <string>
#include "Stock.h"

using namespace std;

class Com1 {
private:
    string id;
    int rf;
    int qt;

public:
    Com1();

    void saisierf();

    void print() const;

    Com1 commande(Stock &, int);
};


#endif //TP2_COM1_H
