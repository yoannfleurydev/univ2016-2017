#ifndef TP3_HIRING_H
#define TP3_HIRING_H

#include "Employee.h"

class Hiring : public Employee {
public:
    inline Hiring(int idNumber = 0, const char * ch = "") : Employee(ch), idNumber(idNumber) {}

    void put_ident(int i);

    virtual void print() override;

private:
    int idNumber;
};

#endif //TP3_HIRING_H
