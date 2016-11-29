package fiche5.ihm;

import fiche5.business.*;

import javax.swing.*;
import java.awt.*;

public class Rainbow {
    // ATTRIBUTS
    private static final int FRAME_WIDTH = 300;
    private static final int FRAME_HEIGHT = 300;

    private JFrame frame;
    private JButton button;
    private RainbowModel model;

    // CONSTRUCTEURS
    public Rainbow() {
        createView();
        placeComponents();
    }

    // COMMANDES
    public void display() {
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }

    // OUTILS
    private void createView() {
        frame = new JFrame("Arc-en-ciel");
        frame.setPreferredSize(
                new Dimension(FRAME_WIDTH, FRAME_HEIGHT)
        );
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        button = new JButton("Modifier");
    }
    private void placeComponents() {
        JPanel p = new JPanel(); {
            p.add(button);
        }
        frame.add(p, BorderLayout.NORTH);
    }
    private void refresh(Color c) {
        Container contentPane = frame.getContentPane();
        contentPane.setBackground(c);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new Rainbow().display();
            }
        });
    }
}
