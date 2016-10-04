#include <iostream>
#include "Com1.h"

Com1::Com1() : id(""), rf(0), qt(0) {}

void Com1::saisierf() {
    cout << "Veuillez entrer une valeur" << endl;
    cout << "> ";
    cin >> hex >> rf;
}

void Com1::print() const {
    cout << "rf : " << dec << rf << ", qt : " << dec <<  qt << endl;
}

Com1 Com1::commande(Stock &a, int b) {
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
