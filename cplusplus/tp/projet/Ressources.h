#ifndef PROJET_RESSOURCES_H
#define PROJET_RESSOURCES_H

#include <fstream>
#include <iostream>

using namespace std;

class Flot {
    fstream f;
    public:
        Flot(){}
        Flot(const char *,_Ios_Openmode) throw(ios_base::iostate);
        ~Flot();
        operator   fstream &     (){return f;}
};

template<class T> class Mem {
    T *p;
    int sz;
    void init(const Mem&);

public:
    Mem(size_t s=1);
    Mem(const Mem&);
    Mem &operator=(const Mem&);
    ~Mem(){ cout << "Supp dyn pmem\n"; delete [] p; }
    operator T* ()const { return p; }
};

template<class T>
Mem<T>::Mem(size_t s): sz(s) {
    p=new T[s];
    T *pp=p; for(int i=0;i< sz; i++,pp++) *pp=0;
}

template<>
Mem<string>::Mem(size_t );

template<class T>
class Rep2{
    Mem<T> info;
    void base()const;

public:
    Rep2(int);
};

template <class T>
void Rep2<T>::base() const{ throw 3; }
template<class T>
Rep2<T>::Rep2(int a):info(a){
    base();
}

template <class T>
void Mem<T>::init(const Mem<T> &m){
    T *p1,*p2;
    sz=m.sz;
    p=new T[sz];
    p1=p;
    p2=m.p;
    for(int i=0;i<sz;i++,p1++,p2++)*p1=*p2;
}

template <class T>
Mem<T>::Mem(const Mem<T> &a){
    init(a);
}

template <class T>
Mem<T> & Mem<T>::operator=(const Mem<T> &m){
    if(&m!=this){
        delete []p;
        init(m);
    }
    return *this;
}

//------------------------ MEMEXTEND

template<class T> class Memextend: public Mem<T> {

public:
    string firstname;
    string lastname;

    Memextend(size_t s = 1);
    Memextend(const Memextend&);
    Memextend(string firstname, string lastname, size_t s = 1);
};

template<class T>
Memextend<T>::Memextend(const Memextend &a) : Mem<T>(a) { }

template<class T>
Memextend<T>::Memextend(size_t s) : Mem<T>(s) {}

template<class T>
Memextend<T>::Memextend(string firstname, string lastname, size_t s) : firstname(firstname), lastname(lastname), Mem<T>(s) {
}

template<class T> class User : public Memextend<T> {
private:
    string password;
    string login;

public:
    User(const string first, const string last, size_t s = 1);

    void setPassword(string password);
    void setLogin(string login);
};

template<class T>
User<T>::User(const string first, const string last, size_t s) : Memextend<T>(first, last, s) {
}

template<class T>
void User<T>::setPassword(string password) {
    this->password = password;
}

template<class T>
void User<T>::setLogin(string login) {
    this->login = login;
}

template<class T>
class Anonymous : public Memextend<T> {
private:
    string login;

public:
    Anonymous(const string login, size_t s = 1);
};


template<class T>
Anonymous<T>::Anonymous(const string login, size_t s) : login(login), Memextend<T>(s) {

}


#endif //PROJET_RESSOURCES_H
