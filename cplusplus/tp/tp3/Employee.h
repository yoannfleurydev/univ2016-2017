#ifndef TP3_EMPLOYEE_H
#define TP3_EMPLOYEE_H

#include <iostream>

using namespace std;

class Employee {

private:
    string name;
public:
    Employee(const char * ch = "");

    Employee();
    void print();
};


#endif //TP3_EMPLOYEE_H
