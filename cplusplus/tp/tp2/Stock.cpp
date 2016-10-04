#include <iostream>
#include "Stock.h"

using namespace std;

Stock::Stock(string id, int nb) : id(id), nb(nb) {}

void Stock::print() const {
    cout << "id : " << id << " nb : " << nb << endl;
}
