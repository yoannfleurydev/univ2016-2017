package fiche6.controller;

import fiche6.domain.RainbowModel;
import fiche6.domain.StdRainbowModel;
import fiche6.ihm.Rainbow;
import fiche6.util.SwingWrappers;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public aspect RainbowConfigurator {
    declare parents: fiche6.domain.RainbowModel             implements fiche6.util.Subject;
    declare parents: fiche6.util.SwingWrappers.WJFrame      implements fiche6.util.Observer;
    declare parents: fiche6.util.SwingWrappers.WJTextField  implements fiche6.util.Observer;
    declare parents: fiche6.util.SwingWrappers.WJButton     implements fiche6.util.Observer;

    private RainbowModel models[];

    pointcut afterConstructor(Rainbow r) : execution(fiche6.ihm.Rainbow.new(..)) && this(r);

    after(Rainbow r) : afterConstructor(r) {
        createModels();
        createControllers(r);
    }

    private void createModels() {
        models = new RainbowModel[2];
        for (int i = 0; i < models.length; i++) {
            models[i] = new StdRainbowModel();
        }
    }

    private void createControllers(Rainbow r) {
        RainbowModel rainbowModel[] = {
            models[0],
            models[0],
            models[1]
        };

        for (int i = 0; i < Rainbow.FRAMES_NB; i++) {
            ColorObserver.aspectOf().addObserver(rainbowModel[i], (SwingWrappers.WJFrame) r.getFrame(i));
            TextColorObserver.aspectOf().addObserver(rainbowModel[i], (SwingWrappers.WJTextField) r.getColor(i));
        }

        r.getCmd(0).addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                rainbowModel[0].changeColor();
            }
        });
        r.getCmd(1).addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                rainbowModel[1].changeColor();
            }
        });
        r.getCmd(2).addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                rainbowModel[2].changeColor();
            }
        });

        ColorObserver.aspectOf().notifyObservers();
        TextColorObserver.aspectOf().notifyObservers();
    }
}
