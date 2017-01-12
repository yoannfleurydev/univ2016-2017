/*Main1.c*/
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

int main(){
    try{
        int *pb=new int[3];
        int *p=pb;
        for(int i=0; i<3; i++, p++) *p=i;
        throw(pb);
        delete pb;
    }
    catch(int *pb){
        int *p=pb;
        cout << "delete dans catch: " <<endl;
        for(int i=0; i<3; i++, p++) cout << *p;
        cout << endl;
        delete pb;
    }
    cout<<"--------------------------\n";


/*Dans le code qui suit,
on ne se preoccupe plus de delete*/
    try{
        Mem<int> pb(3);
        int *p=pb;
        for(int i=0; i<3; i++, p++) *p=i;
        throw(pb);

    }
/*Ce catch ne marche pas si le constructeur de recopie n'est pas redefini
car, sinon, la memoire dynamique allouee a obj.p est desallouee
deux fois, une fois a la fin du bloc try, une autre fois
lorsque l'objet global contenant l'exception, objet refere par ob,
disparait*/
    catch(Mem<int> pb){
        int *p=pb;
        cout << "delete dans catch: "<<endl;
        for(int i=0; i<3; i++, p++) cout<<*p;
        cout<<endl;
    }

    try{
        Memextend<int> pb(4);
        int *p=pb;
        for(int i=0; i<3; i++, p++) *p=i;
        throw(pb);
    } catch (Memextend<int> pb) {
        int *p=pb;
        cout << "delete dans catch (memextend): "<<endl;
        for(int i=0; i<3; i++, p++) cout<<*p;
        cout<<endl;
    }

    User user("Toto" , "Tata");
    //Anonymous anonymous(rand());

    return 0;
}