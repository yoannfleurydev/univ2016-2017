package fiche6.domain;

import java.awt.Color;

/**
 * Notre modèle est une séquence de couleurs (toutes distinctes) que l'on peut
 *  parcourir cycliquement.
 * Les valeurs de getColor() après chaque exécution de changeColor() sont
 *  celles obtenues en parcourant cycliquement le tableau COLORS.
 */
public class StdRainbowModel implements RainbowModel {
    
    // ATTRIBUTS
    
    // La séquence des différentes couleurs gérées par le modèle
    private static final Color[] COLORS = {
        Color.BLACK, Color.BLUE, Color.CYAN, Color.DARK_GRAY, Color.GRAY,
        Color.GREEN, Color.LIGHT_GRAY, Color.MAGENTA, Color.ORANGE,
        Color.PINK, Color.RED, Color.WHITE, Color.YELLOW
    };

    // L'index courant dans le tableau des couleurs
    private int colorIndex;

    // CONSTRUCTEURS
    
    /**
     * Un modèle standard, dont la couleur courante est la première couleur
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
    }
}
