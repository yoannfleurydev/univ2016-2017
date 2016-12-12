package fiche6.controller;

import fiche6.domain.RainbowModel;
import fiche6.util.AbstractObserver;
import fiche6.util.SwingWrappers;

public aspect TextColorObserver extends AbstractObserver<RainbowModel, SwingWrappers.WJTextField> {

    public pointcut subjectChange(RainbowModel s) :
            call(* fiche6.domain.StdRainbowModel.changeColor(..)) && this(s);

    @Override
    protected void updateObserver(RainbowModel subject, SwingWrappers.WJTextField o) {
        o.setText(subject.getColor().toString());
    }
}
