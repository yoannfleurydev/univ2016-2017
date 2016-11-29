package fiche5.orig;

public aspect ObserverScattering {
    pointcut observerMethods() : call(* java.util.Observer.*(..));
    pointcut observableMethods() : call(* java.util.Observable.*(..));

    declare warning : observerMethods() || observableMethods()
            : "Appel";

    before() : observerMethods() || observableMethods() {
        System.out.print("Appel : " + thisJoinPoint );
    }
}
