package fiche6.util;

import java.awt.GraphicsConfiguration;
import java.awt.event.ActionEvent;

import javax.swing.Action;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextField;

public aspect SwingWrappers {
    
    pointcut intoIHM() : within(fiche6.ihm..*);
    
    // fen�tres tissables
    
    pointcut frameCreation() : call(JFrame.new(..)) && intoIHM();
    
    JFrame around() : frameCreation() {
        JFrame f = proceed();
        return new WJFrame(f.getTitle(), f.getGraphicsConfiguration());
    }
    
    public static class WJFrame extends JFrame {
        public WJFrame(String t, GraphicsConfiguration gc) {
            super(t, gc);
        }
    }

    // champs tissables
    
    pointcut fieldCreation() : call(JTextField.new(..)) && intoIHM();
    
    JTextField around() : fieldCreation() {
        JTextField tf = proceed();
        WJTextField wjtf = new WJTextField();
        wjtf.setDocument(tf.getDocument());
        wjtf.setText(tf.getText());
        wjtf.setColumns(tf.getColumns());
        return wjtf;
    }
    
    public static class WJTextField extends JTextField {
        // rien
    }

    pointcut buttonCreation() : call(JButton.new(..)) && intoIHM();

    JButton around() : buttonCreation() {
        JButton b = proceed();
        return new WJButton();
    }

    public static class WJButton extends JButton {
        // rien
    }
}
