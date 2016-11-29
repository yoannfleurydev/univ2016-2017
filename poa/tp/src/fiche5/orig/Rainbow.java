package fiche5.orig;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

public class Rainbow {
    // ATTRIBUTS
    private static final int FRAME_WIDTH = 300;
    private static final int FRAME_HEIGHT = 300;

    private JFrame frame;
    private JButton button;
    private RainbowModel model;

    // CONSTRUCTEURS
    public Rainbow() {
        createModel();
        createView();
        placeComponents();
        createController();
    }

    // COMMANDES
    public void display() {
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
        refresh(model.getColor());
    }

    // OUTILS
    private void createModel() {
        model = new StdRainbowModel();
    }
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
    private void createController() {
        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                model.changeColor();
            }
        });
        ((Observable) model).addObserver(new Observer() {
            public void update(Observable o, Object arg) {
            	refresh(model.getColor());
            }
        });
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
