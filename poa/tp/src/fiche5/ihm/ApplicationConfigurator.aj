package fiche5.ihm;

import fiche5.business.RainbowModel;
import fiche5.business.StdRainbowModel;
import fiche5.util.Observer;
import fiche5.util.Subject;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public privileged aspect ApplicationConfigurator {

    private RainbowModel Rainbow.model;

    public void Rainbow.createModel() {
        model = new StdRainbowModel();
    }

    public void Rainbow.createController() {
        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                model.changeColor();
            }
        });
        model.addObserver(new Observer() {
            public void update(Subject o) {
                refresh(model.getColor());
            }
        });
    }

    pointcut init() : execution(fiche5.ihm.Rainbow.new(..));

    after(Rainbow ihm) : init() && target(ihm) {
        ihm.createModel();
        ihm.createController();
        ihm.refresh(ihm.model.getColor());
    }
}
