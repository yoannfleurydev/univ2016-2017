package fiche1.classes;

public class B {
    private A p;
    private int group;

    public B(int g) {
        group = g;
        p = new A(g);
    }

    @Override
    public String toString() {
        return "B(" + group + ";" + p + ")";
    }

    public void setP(A x) {
        p = x;
    }
    public void resetP() {
        internalResetP();
    }
    private void internalResetP() {
        p = new A(group);
        //throw new RuntimeException();
    }
}
