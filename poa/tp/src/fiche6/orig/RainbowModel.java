package fiche6.orig;

import java.awt.Color;

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
     * Modification de l'état interne.
     * Un appel à cette méthode oblige le modèle a changer de couleur.
     * @post <pre>
     *     !getColor().equals(old getColor()) </pre>
     */
    void changeColor();
}
