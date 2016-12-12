package fiche6.controller;

import fiche6.domain.RainbowModel;
import fiche6.util.AbstractObserver;
import fiche6.util.SwingWrappers;

public aspect ColorObserver extends AbstractObserver<RainbowModel, SwingWrappers.WJFrame> {
    public pointcut subjectChange(RainbowModel s) :
            call(* fiche6.domain.StdRainbowModel.changeColor(..)) && target(s);

    @Override
    protected void updateObserver(RainbowModel subject, SwingWrappers.WJFrame o) {
        o.getContentPane().setBackground(subject.getColor());
    }
}
