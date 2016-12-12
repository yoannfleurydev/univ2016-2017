package fiche6.util;

public abstract aspect AbstractObserver<S extends Subject, T extends Observer> extends ObserverProtocol<S, T> {
    public abstract pointcut subjectChange(S s);

    after(S s) : subjectChange(s) {
        notifyObserversFor(s);
    }
}
