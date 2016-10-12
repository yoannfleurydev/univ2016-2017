#include <iostream>
#include "Hiring.h"

using namespace std;

void Hiring::put_ident(int i) {
    this->idNumber = i;
}

void Hiring::print() {
    Employee::print();
    cout << "Matricule : " << this->idNumber << endl;
}
