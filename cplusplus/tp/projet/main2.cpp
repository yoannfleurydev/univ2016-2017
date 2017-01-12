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
            Anonymous<int> anonymous("toto", "tata", login, 4);
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
        user.setLogin("totodu76");
        user.setPassword("taotao");
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