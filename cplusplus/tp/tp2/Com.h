#ifndef TP2_COM_H
#define TP2_COM_H

#include <string>
#include "Stock.h"

using namespace std;

class Com {
private:
    string id;
    int rf;
    int qt;

public:
    Com();

    void saisierf();

    void print() const;

    Com commande(Stock &, int);
};


#endif //TP2_COM_H
