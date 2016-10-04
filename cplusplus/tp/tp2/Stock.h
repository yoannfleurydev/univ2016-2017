#ifndef TP2_STOCK_H
#define TP2_STOCK_H

#include <string>
#include "Com.h"
#include "Com1.h"

using namespace std;

class Stock {
    friend class Com;
    friend Com1 Com1::commande(Stock &, int);
private:
    const string id;
    int nb;

public:
    Stock(string, int = 100);

    void print() const;
};


#endif //TP2_STOCK_H
