package fiche5.orig;

import java.awt.Color;

/**
 * Ce mod�le permet d'obtenir des couleurs.
 * On peut faire �voluer le mod�le en lui commandant de changer de couleur,
 *  et consulter son �tat � tout moment.
 * @inv <pre>
 *     getColor() != null </pre>
 */
public interface RainbowModel {
    // REQUETES
    /**
     * La couleur courante du mod�le.
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
