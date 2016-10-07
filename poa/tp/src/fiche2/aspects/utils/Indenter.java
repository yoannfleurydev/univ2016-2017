package fiche2.aspects.utils;

public class Indenter {
    public static final String SEP = "|  ";
    private static int level;

    public String prefix() {
        String indent = "";
        for (int i = 0; i < level; i++) {
            indent += SEP;
        }
        return indent;
    }
    
    public int level() {
        return level;
    }
    
    public void dec() {
        level--;
    }
    
    public void inc() {
        level++;
    }
    
    public void write(String message) {
        System.out.println(prefix() + message);
    }
}
