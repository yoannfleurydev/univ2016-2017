package fiche6.util;

import java.util.*;

public abstract class ObserverProtocol<S extends Subject, T extends Observer> {
    
    // ATTRIBUTS
    
    /**
     * Table associative contenant toutes les relations entre sujets et
     *  observateurs pour une m�me r�alisation du patron Observer.
     * Tous les sujets et tous les observateurs stock�s dans cette table sont
     *  distincts de null.
     */
    private Map<S, List<T>> perSubjectObservers = new WeakHashMap<S, List<T>>();

    // COMMANDES

    /**
     * Ajoute une association sujet-observateur.
     *
     * @pre s != null && o != null
     * @post Let obs ::= perSubjectObservers.get(s)
     * obs != null && obs.contains(o)
     */
    public void addObserver(S s, T o) {
        Contract.checkCondition(s != null, "Le sujet ne doit pas être null");
        Contract.checkCondition(o != null, "L'observer ne doit pas être null");

        if (!this.perSubjectObservers.containsKey(s)) {
            this.perSubjectObservers.put(s, new LinkedList<>());
        }

        this.perSubjectObservers.get(s).add(o);
    }
    
    /**
     * Supprime une association sujet-observateur.
     * @pre
     *     s != null && o != null
     * @post
     *     Let obs ::= perSubjectObservers.get(s)
     *         obs == null || !obs.contains(o)
     */
    public void removeObserver(S s, T o) {
        Contract.checkCondition(s != null, "Le sujet ne doit pas être null");
        Contract.checkCondition(o != null, "L'observer ne doit pas être null");

        this.perSubjectObservers.get(s).remove(o);
    }
    
    /**
     * Notifie tous les observateurs de tous les sujets de la table associative.
     */
    public void notifyObservers() {
        for (S s : this.perSubjectObservers.keySet()) {
            notifyObserversFor(s);
        }
    }
    
    /**
     * Notifie tous les observateurs de s pr�alablement enregistr�s.
     * @post
     *     updateObserver(s, o) a �t� ex�cut�e pour chaque observateur o de s
     */
    protected void notifyObserversFor(S s) {
        for (T t : this.perSubjectObservers.get(s)) {
            updateObserver(s, t);
        }
    }
    
    /**
     * D�finit le comportement d'observation de o sur s pour une r�alisation du
     *  patron Observer.
     */
    protected abstract void updateObserver(S s, T o);

    // OUTILS
    
    /**
     * Retourne l'ensemble des sujets r�f�renc�s par la table associative.
     * @post
     *     result != null
     */
    private Set<S> getSubjects() {
        return this.perSubjectObservers.keySet();
    }
}
