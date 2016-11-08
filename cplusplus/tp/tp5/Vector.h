#ifndef TP5_VECTOR_H
#define TP5_VECTOR_H

#include <iostream>

using namespace std;

template<class T = int, int size = 6> class Vector {
private:
    T* vc[size];
public:
    const T* operator [] (const int indice) const throw(int);
    void put(int i, const T* p);
};

template<class T, int size = 6>
const T *Vector::operator[](const int indice) const throw(int){
    if (indice < 0 || indice >= size) {
        throw 1;
    }
    return vc[indice];
}

template<class T, int size = 6>
void Vector::put(int i, const T* p) {
    vc[i] = *p;
}


#endif //TP5_VECTOR_H
