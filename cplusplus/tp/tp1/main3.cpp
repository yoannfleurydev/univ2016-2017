#include "intf.h"
#include "tb.h"
#include <iostream>

using namespace std;

void printTab(int tab1[], int tab2[]);

int main(void) {
    int tab1[SIZE] = {1, 2, 3, 4, 5};
    int tab2[SIZE] = {6, 7, 8, 9, 0};

    printTab(tab1, tab2);
    tswap(tab1, tab2);
    printTab(tab1, tab2);

    return 0;
}

void printTab(int tab1[], int tab2[]) {
    for (int i = 0; i < SIZE; i++) {
        cout << i << " >> tab1 : " << tab1[i] << ", tab2 : " << tab2[i] << endl;
    }
}