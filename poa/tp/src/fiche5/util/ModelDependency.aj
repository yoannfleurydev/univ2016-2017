package fiche5.util;

import fiche5.util.*;

public aspect ModelDependency {
    declare parents : @Observable * extends Subject;
    declare error : execution(@ChangeState * *(..)) && !within(@Observable *)
            : "ChangeState should be in @Observable annotated class !";


    pointcut afterChange() : call(@ChangeState * *(..));

    after(Subject model) : afterChange() && target(model) {
        model.notifyObservers();
    }
}
