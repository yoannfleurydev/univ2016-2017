#include <iostream>
#include "Employee.h"
#include "Hiring.h"
#include "Society.h"
#include "TempWorker.h"

void vacatmem(Society arg1, Society arg2) {

}

int main() {
//    Employee employee("Yoann");
//    employee.print();

    Hiring hired(1, "Yoann");
    hired.put_ident(5);
    hired.print();

    Society spot1[5];
    spot1[0] = new TempWorker("Yoann", "SmartPanda");

    return EXIT_SUCCESS;
}