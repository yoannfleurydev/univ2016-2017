package fiche5.business;

import fiche5.util.*;

public aspect ModelConfigurator {
    declare parents : RainbowModel extends Subject;

    pointcut changes() : call(void fiche5.business.RainbowModel.changeColor());

    after(RainbowModel rm) : changes() && target(rm) {
        rm.notifyObservers();
    }
}
