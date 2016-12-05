package fiche5.mvc;

import fiche5.business.RainbowModel;
import fiche5.ihm.Rainbow;
import fiche5.util.*;
import fiche5.business.StdRainbowModel;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public privileged aspect RainbowConfigurator {
    /**
     * L'application qui bénéficie du framework MVC est Rainbow
     */
    declare @type : Rainbow : @MVC;

    /**
     * RainbowModel définit un modèle observable doté d'une seule commande pour
     * changer son état : changeColor()
     */
    declare @type : RainbowModel : @Observable;
    declare @method : void RainbowModel+.changeColor() : @ChangeState;

    /**
     * L'application Rainbow possède une instance de modèle correctement initialisée
     */
    private RainbowModel Rainbow.model;

    @ModelCreator
    private void Rainbow.createModel() {
        model = new StdRainbowModel();
    }

    /**
     * L'application Rainbow possède des contrôleurs correctement initialisés
     */
    @ControllerCreator
    private void Rainbow.createButtonListener() {
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                model.changeColor();
            }
        });
    }

    @ControllerCreator
    private void Rainbow.createModelObserver() {
        model.addObserver(new Observer() {
            public void update(Subject o) {
                Container contentPane = frame.getContentPane();
                contentPane.setBackground(model.getColor());
            }
        });
    }

    /**
     * Initialement, la vue est conforme à l'état initial du modèle.
     */
    @ViewConfigurator
    private void Rainbow.configView() {
        refresh(model.getColor());
    }
}
