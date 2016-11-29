package fiche5.util;

import java.util.ArrayList;
import java.util.List;

public interface Subject {
    /**
     * Le nombre d'observateurs abonnés auprès de ce sujet.
     */
    int countObservers();
    /**
     * Abonne l'observateur o.
     */
    void addObserver(Observer o);
    /**
     * Désabonne l'observateur o.
     */
    void deleteObserver(Observer o);
    /**
     * Notifie tous les observateurs préalablement abonnés.
     */
    void notifyObservers();

    static aspect SubjectImpl {
        private List<Observer> Subject.observers = new ArrayList<>();

        public void Subject.addObserver(Observer o) {
            observers.add(o);
        }

        public int Subject.countObservers() {
            return observers.size();
        }

        public void Subject.deleteObserver(Observer o) {
            observers.remove(o);
        }

        public void Subject.notifyObservers() {
            for (Observer observer: observers) {
                observer.update(this);
            }
        }
    }
}
