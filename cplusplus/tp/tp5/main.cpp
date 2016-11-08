#include "Vector.h"

#include <iostream>

using namespace std;

int main() {
    int size(5);

    Vector<int, size> v;

    for (int i = 0; i < size; ++i) {
        cout << "Position " << i << " : " << v[i] << endl;
    }

    int value = 5;
    int *p = &value;
    v.put(2, p);

    for (int i = 0; i < size; ++i) {
        cout << "Position " << i << " : " << v[i] << endl;
    }

    return 0;
}