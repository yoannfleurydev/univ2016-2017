#include <iostream>
#include "Employee.h"

using namespace std;

Employee::Employee(const char * name) : name(name) {}

Employee::Employee() {}

void Employee::print() {
    cout << this->name << endl;
}
