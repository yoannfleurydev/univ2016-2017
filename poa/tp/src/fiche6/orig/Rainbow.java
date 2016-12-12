package fiche6.orig;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.Point;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;

public class Rainbow {
    
    // ATTRIBUTS
    
    private static final int FRAME_WIDTH = 400;
    private static final int FRAME_HEIGHT = 300;
    private static final int FRAMES_NB = 3;
    private static final double[][] POS =
            new double[][] { {-1, -1}, {0, -1}, {-0.5, 0}};

    private JFrame[] frames;
    private JButton[] buttons;
    private JButton[] dingButtons;
    private JTextField[] colors;
    private Map<JButton, RainbowModel> buttonModelRelation;
    private Map<RainbowModel, List<JFrame>> modelFrameRelation;
    private Map<RainbowModel, List<JTextField>> modelFieldRelation;
    private RainbowModel[] models;
//    private RainbowModel model1, model2;

    // CONSTRUCTEURS
    
    public Rainbow() {
        createModels();
        createViews();
        placeComponents();
        createRelations();
        createControllers();
    }

    // COMMANDES
    
    public void display() {
        for (int i = 0; i < FRAMES_NB; i++) {
            frames[i].pack();
            frames[i].setLocation(initLocation(i));
            frames[i].setVisible(true);
        }
        for (RainbowModel m : models) {
            refreshField(m);
            refreshFrame(m);
        }
    }

    // OUTILS
    
    private void createModels() {
    	models = new RainbowModel[2];
    	for (int i = 0; i < models.length; i++) {
            models[i] = new StdRainbowModel();
    	}
    }
    
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
    
    private void createRelations() {
        buttonModelRelation = new HashMap<JButton, RainbowModel>();
        buttonModelRelation.put(buttons[0], models[0]);
        buttonModelRelation.put(buttons[1], models[0]);
        buttonModelRelation.put(buttons[2], models[1]);
        modelFrameRelation = new HashMap<RainbowModel, List<JFrame>>();
        modelFrameRelation.put(
                models[0],
                Arrays.asList(new JFrame[] { frames[0], frames[1] }));
        modelFrameRelation.put(
                models[1],
                Arrays.asList(new JFrame[] { frames[2] }));
        modelFieldRelation = new HashMap<RainbowModel, List<JTextField>>();
        modelFieldRelation.put(
                models[0],
                Arrays.asList(new JTextField[] { colors[0], colors[1] }));
        modelFieldRelation.put(
                models[1],
                Arrays.asList(new JTextField[] { colors[2] }));
    }
    
    private void createControllers() {
        for (int i = 0; i < Rainbow.FRAMES_NB; i++) {
            frames[i].setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            buttons[i].addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    RainbowModel m = buttonModelRelation.get(e.getSource());
                    m.changeColor();
                }
            });
            dingButtons[i].addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    Toolkit.getDefaultToolkit().beep();
                }
            });
        }
        Observer obsFrame = new Observer() {
            public void update(Observable o, Object arg) {
                RainbowModel m = (RainbowModel) o;
                refreshFrame(m);
            }
        };
        for (RainbowModel m : modelFrameRelation.keySet()) {
            ((Observable) m).addObserver(obsFrame);
        }
        Observer obsField = new Observer() {
            public void update(Observable o, Object arg) {
                RainbowModel m = (RainbowModel) o;
                refreshField(m);
            }
        };
        for (RainbowModel m : modelFieldRelation.keySet()) {
            ((Observable) m).addObserver(obsField);
        }
    }
    
    private void refreshFrame(RainbowModel m) {
        Color c = m.getColor();
        for (JFrame f : modelFrameRelation.get(m)) {
            f.getContentPane().setBackground(c);
        }
    }
    
    private void refreshField(RainbowModel m) {
        Color c = m.getColor();
        String text = "[" + c.getRed() + "," + c.getGreen()
                + "," + c.getBlue() + "]";
        for (JTextField f : modelFieldRelation.get(m)) {
            f.setText(text);
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
