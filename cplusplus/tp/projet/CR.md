# Rapport C++ - Projet 10
## Code Source

#### Main2.cpp : 

````C++
/*Main2.cpp*/
/*
Trace
Un utilisateur anonyme se connecte
Le login : ZcT5Zbw2LN2dCV$m!S2&N, lui est assigné
création de l'utilisateur
Supp dyn pmem
delete dans catch (anonymous): 
012
Supp dyn pmem
Supp dyn pmem
Un utilisateur anonyme se connecte
Le login : Kd92W#$n5BYiypTZmh2Lj, lui est assigné
création de l'utilisateur
Supp dyn pmem
delete dans catch (anonymous): 
012
Supp dyn pmem
Supp dyn pmem
Un utilisateur anonyme se connecte
Le login : rfQ*eavg3IDgSFOqSNvl4, lui est assigné
création de l'utilisateur
Supp dyn pmem
delete dans catch (anonymous): 
012
Supp dyn pmem
Supp dyn pmem
Un utilisateur anonyme se connecte
Le login : dw5IV37kb2bGT4%F07UIK, lui est assigné
création de l'utilisateur
Supp dyn pmem
delete dans catch (anonymous): 
012
Supp dyn pmem
Supp dyn pmem
Un utilisateur anonyme se connecte
Le login : A4thuL#qIKfEc64fH0GKn, lui est assigné
création de l'utilisateur
Supp dyn pmem
delete dans catch (anonymous): 
012
Supp dyn pmem
Supp dyn pmem
Un utilisateur connu du système se connecte
création de l'utilisateur avec pour login : Toto et pour password Tata
Supp dyn pmem
delete dans catch (anonymous): 
012
Supp dyn pmem
Supp dyn pmem
*/

using namespace std;
#include<iostream>
#include <math.h>
#include"Ressources.h"

static const char alphanum[] =
        "0123456789"
                "!@#$%^&*"
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                "abcdefghijklmnopqrstuvwxyz";

int stringLength = sizeof(alphanum) - 1;

char genRandom()  // Random string generator function.
{

    return alphanum[rand() % stringLength];
}

int main(){
    int nbAnonymous = 5;

    for (int cpt = 0; cpt < nbAnonymous; cpt++) {
        cout << "Un utilisateur anonyme se connecte" << endl;

        string login;

        for(unsigned int i = 0; i < 21; ++i)
        {
            login += genRandom();
        }

        cout << "Le login : " << login << ", lui est assigné" << endl;

        try{
            cout << "création de l'utilisateur" << endl;
            Anonymous<int> anonymous(login, 4);
            int *p=anonymous;
            for(int i=0; i<3; i++, p++) *p=i;
            throw(anonymous);
        } catch (Anonymous<int> anonymous) {
            int *p=anonymous;
            cout << "delete dans catch (anonymous): "<<endl;
            for(int i=0; i<3; i++, p++) cout<<*p;
            cout<<endl;
        }
    }

    cout << "Un utilisateur connu du système se connecte" << endl;

    try{
        cout << "création de l'utilisateur avec pour login : Toto et pour password Tata" << endl;
        User<int> user("Toto" , "Tata", 8);
        int *p=user;
        for(int i=0; i<3; i++, p++) *p=i;
        throw(user);
    } catch (User<int> anonymous) {
        int *p=anonymous;
        cout << "delete dans catch (anonymous): "<<endl;
        for(int i=0; i<3; i++, p++) cout<<*p;
        cout<<endl;
    }


    return 0;
}
````

#### Ressources.h

````C++
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
````

#### Ressources.cpp

````C++
#include "Ressources.h"
#include <stddef.h>

/*
Code Possible:
Flot::Flot(const char *ch, _Ios_Openmode a): f(ch,a){
		if(!f) throw f.rdstate();
}
*/
Flot::Flot(const char *ch, _Ios_Openmode a) throw(ios_base::iostate){
    f.open(ch,a);
    if(!f) throw f.rdstate();
}

Flot::~Flot(){cout<<"Ferm.\n"; f.close();}

template<>
Mem<string>::
Mem(size_t s):sz(s){
    p=new string[s];
}

````

## Commentaire

Pour le projet 10 nous voulions améliorer le classe Mem en rajoutant
des fonctionnalité à la classe de base. Cependant les attributs étant
inaccessible depuis la classe fille (attributs privés) on ne pouvait pas 
l'améliorer. Nous avions eu comme idée de recréer la classe List en gérant 
la taille du tableau selon l'ajout ou la suppression d'élément du tableau.

Ne pouvant pas le faire nous avons donc décidé de simplement rajouter quelques 
attributs. Nous avons donc fais un système d'utilisateur (connu du système ou pas), l'intérêt
d'hérité de Mem réside dans le faite que l'on peut stocker une liste de donnée sur l'utilisateur
l'enregistrer en base de données par exemple et supprimer proprement l'utilisateur du système.

Memextend dérive de Mem et est dérivé par user et anonymous. Memextend rajoute le prénom et le 
nom de famille. User est un utilisateur connecté avec un login et un mot de passe ce dernier pourra
être stocker dans la base de données. Anonymous lui est un utilisateur qui a renseigné sont nom et prénom 
mais ne souhaitant pas créer un compte, ses données ne seront pas stocké et sont utilisable temporairement
par exemple.