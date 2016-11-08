#ifndef TP6_MEM_H
#define TP6_MEM_H


template <class T> class Mem {
private:

    T* pmem;

    int sz;

public:

    Mem(int nb = 1);
    Mem(const Mem<T> &mem);

    ~Mem();

    operator T*() {
        return this->pmem;
    }
};

template <class T>
Mem<T>::Mem(int nb) {
    this->pmem = new T[nb];
    this->sz = nb;
}

template <class T>
Mem<T>::Mem(const Mem<T> &mem) {
    this->pmem = new T[mem.sz];
    this->sz = mem.sz;
    for (int i=0; i < mem.sz; i++) {
        this->pmem[i] = mem.pmem[i];
    }
}

template <class T>
Mem<T>::~Mem() {
    delete []this->pmem;
}

#endif //TP6_MEM_H
