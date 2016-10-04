#include <iostream>
#include "Stock.h"
#include "visu.h"
#include "Com.h"
#include "Com1.h"

int main() {
    Stock stock("Wow", 5);
//    stock.print();
//
//    print(stock);
//    Com com;
//    com.saisierf();
//    com.print();
    Com1 com1;
    com1.commande(stock, 1);
    stock.print();

    return 0;
}