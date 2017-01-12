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
