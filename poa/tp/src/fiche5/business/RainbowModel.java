package fiche5.business;

import fiche5.util.ChangeState;
import fiche5.util.Observable;
import fiche5.util.Subject;

import java.awt.*;

/**
 * Ce modèle permet d'obtenir des couleurs.
 * On peut faire évoluer le modèle en lui commandant de changer de couleur,
 *  et consulter son état à tout moment.
 * @inv <pre>
 *     getColor() != null </pre>
 */
public interface RainbowModel {
    // REQUETES
    /**
     * La couleur courante du modèle.
     */
    Color getColor();

    // COMMANDES
    /**
     * Modification de l'�tat interne.
     * Un appel � cette m�thode oblige le mod�le a changer de couleur.
     * @post <pre>
     *     !getColor().equals(old getColor()) </pre>
     */
    void changeColor();
}
