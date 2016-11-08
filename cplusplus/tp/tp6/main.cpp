#include <iostream>
#include "Ressources/Mem.h"

using namespace std;

int main() {
    try {
        Mem<int> pb(3);
        int *p = pb;
        for(int i=0; i<3; i++, p++) *p=i;
        throw(pb);
    } catch (Mem<int> pb) {
        int *p=pb;
        cout << "delete dans catch: " << endl;
        for(int i=0; i<3; i++, p++) cout << *p;
        cout << endl;
    }

    return 0;
}
