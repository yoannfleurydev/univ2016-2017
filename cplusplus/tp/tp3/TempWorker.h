#ifndef TP3_TEMPWORKER_H
#define TP3_TEMPWORKER_H


#include "Employee.h"

class TempWorker : public Employee {
public:
    inline TempWorker(const char* ch = "", const char* ch1 = "");
private:
    const char* society;
};


#endif //TP3_TEMPWORKER_H
