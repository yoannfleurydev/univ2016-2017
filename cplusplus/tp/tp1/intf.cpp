#include <iostream>
#include "intf.h"

using namespace std;


void entry(int tab[]) {
    for (int i = 0; i < SIZE; i++) {
        cin >> tab[i];
    }
}

void view(int tab[]) {
    cout << "+-------+-------+" << endl;
    cout << "+  DEC  +  OCT  +" << endl;
    cout << "+-------+-------+" << endl;
    for (int i = 0; i < SIZE; i++) {
        cout << "+   " << dec << tab[i] << "   +  " << oct << tab[i] << "  +  " << endl;
    }
    cout << "+-------+-------+" << endl;
}