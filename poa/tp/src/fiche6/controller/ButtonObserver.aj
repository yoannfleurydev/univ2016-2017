package fiche6.controller;

import fiche6.domain.RainbowModel;
import fiche6.util.AbstractObserver;
import fiche6.util.SwingWrappers;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public aspect ButtonObserver extends AbstractObserver<RainbowModel, SwingWrappers.WJButton> {
    public pointcut subjectChange(RainbowModel s) :
            call(* fiche6.domain.StdRainbowModel.changeColor(..)) && target(s);

    @Override
    protected void updateObserver(RainbowModel subject, SwingWrappers.WJButton o) {

    }
}
