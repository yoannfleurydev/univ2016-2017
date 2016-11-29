package fiche5.orig;

import java.awt.Color;
import java.util.Observable;

/**
 * Notre mod?le est une s?quence de couleurs (toutes distinctes) que l'on peut
 *  parcourir cycliquement.
 * Les valeurs de getColor() apr?s chaque ex?cution de changeColor() sont
 *  celles obtenues en parcourant cycliquement le tableau COLORS.
 */
public class StdRainbowModel extends Observable implements RainbowModel {
    // ATTRIBUTS
    
    // La s?quence des diff?rentes couleurs g?r?es par le mod?le
    private static final Color[] COLORS = {
        Color.BLACK, Color.BLUE, Color.CYAN, Color.DARK_GRAY, Color.GRAY,
        Color.GREEN, Color.LIGHT_GRAY, Color.MAGENTA, Color.ORANGE,
        Color.PINK, Color.RED, Color.WHITE, Color.YELLOW
    };

    // L'index courant dans le tableau des couleurs
    private int colorIndex;

    // CONSTRUCTEURS
    /**
     * Un mod?le standard, dont la couleur courante est la premi?re couleur
     *  du tableau.
     */
    public StdRainbowModel() {
        super();
        colorIndex = 0;
    }

    // REQUETES
    public Color getColor() {
        return COLORS[colorIndex];
    }

    // COMMANDES
    public void changeColor() {
        colorIndex = (colorIndex + 1) % COLORS.length;
        setChanged();
        notifyObservers();
    }
}
