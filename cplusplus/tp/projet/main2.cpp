/*Main2.cpp*/
/*
Trace
delete dans catch:
012
--------------------------
Supp dyn pmem
delete dans catch:
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