package fiche2.classes;

public class E {
    private D p;
    private int group;

    public E(int g) {
        group = g;
        p = new D(g);
        resetP();
    }

    public int getGroup() {
        return group;
    }
    @Override
    public String toString() {
        return "E(" + group + ";" + p + ")";
    }

    public void setP(D x) {
        p = x;
    }
    public void resetP() {
        internalResetP();
    }
    private void internalResetP() {
        p = new D(group);
    }
    public void equalize(E x) {
        x.group = group;
        x.internalResetP();
    }
}
