//
// Created by yfleury on 9/27/16.
//

#include <iostream>
#include "Com.h"

Com::Com() : id(""), rf(0), qt(0) {

}

void Com::saisierf() {
    cout << "Veuillez entrer une valeur" << endl;
    cout << "> ";
    cin >> hex >> rf;
}

void Com::print() const {
    cout << "rf : " << dec << rf << ", qt : " << dec <<  qt << endl;
}

Com Com::commande(Stock &a, int b) {
    if (a.nb >= b) {
        saisierf();
        a.nb = a.nb - b;
        qt = b;
        id = a.id;
    } else {
        rf = 0;
        qt = 0;
        id = "";
    }

    return *this;
}
