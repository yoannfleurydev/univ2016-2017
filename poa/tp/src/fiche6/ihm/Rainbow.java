package fiche6.ihm;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.Point;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;

public class Rainbow {
    
    // ATTRIBUTS
    
    public static final int FRAMES_NB = 3;

    private static final int FRAME_WIDTH = 400;
    private static final int FRAME_HEIGHT = 300;
    private static final double[][] POS =
            new double[][] { {-1, -1}, {0, -1}, {-0.5, 0}};

    private JFrame[] frames;
    private JButton[] buttons;
    private JButton[] dingButtons;
    private JTextField[] colors;

    // CONSTRUCTEURS
    
    public Rainbow() {
        createViews();
        placeComponents();
        createControllers();
    }
    
    // REQUETES
    
    public JFrame getFrame(int i) {
        return frames[i];
    }
    
    public JButton getCmd(int i) {
        return buttons[i];
    }
    
    public JButton getDing(int i) {
        return dingButtons[i];
    }
    
    public JTextField getColor(int i) {
        return colors[i];
    }

    // COMMANDES
    
    public void display() {
        for (int i = 0; i < FRAMES_NB; i++) {
            frames[i].pack();
            frames[i].setLocation(initLocation(i));
            frames[i].setVisible(true);
        }
    }

    // OUTILS
    
    private void createViews() {
        frames = new JFrame[FRAMES_NB];
        buttons = new JButton[FRAMES_NB];
        dingButtons = new JButton[FRAMES_NB];
        colors = new JTextField[FRAMES_NB];
        for (int i = 0; i < FRAMES_NB; i++) {
            frames[i] = new JFrame("Arc-en-ciel " + i);
            frames[i].setPreferredSize(
                    new Dimension(FRAME_WIDTH, FRAME_HEIGHT)
            );
            buttons[i] = new JButton("Modifier");
            dingButtons[i] = new JButton("Ding !");
            colors[i] = new JTextField("");
        }
    }
    
    private void placeComponents() {
        for (int i = 0; i < FRAMES_NB; i++) {
            JPanel p = new JPanel(); {
                p.add(buttons[i]);
                p.add(dingButtons[i]);
            }
            frames[i].add(p, BorderLayout.NORTH);
            p = new JPanel(new GridLayout(1, 0)); {
                p.add(colors[i]);
            }
            frames[i].add(p, BorderLayout.SOUTH);
        }
    }
    
    private void createControllers() {
        for (int i = 0; i < FRAMES_NB; i++) {
            frames[i].setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            dingButtons[i].addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    Toolkit.getDefaultToolkit().beep();
                }
            });
        }
    }
    
    private Point initLocation(int i) {
        Dimension frameDim = frames[i].getPreferredSize();
        Dimension screenDim = Toolkit.getDefaultToolkit().getScreenSize();
        Point p = new Point();
        p.x = (int) ((screenDim.width / 2.0) + (POS[i][0] * frameDim.width));
        p.y = (int) ((screenDim.height / 2.0) + (POS[i][1] * frameDim.height));
        return p;
    }
    
    // POINT D'ENTREE

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new Rainbow().display();
            }
        });
    }
}
