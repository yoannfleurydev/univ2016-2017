#include "tb.h"
#include "intf.h"

void tswap(int *tab1, int *tab2) {
    for (int i = 0; i < SIZE; i++) {
        swap(tab1[i], tab2[i]);
    }
}