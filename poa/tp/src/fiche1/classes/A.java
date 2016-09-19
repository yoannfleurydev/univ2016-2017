package fiche1.classes;

public class A {
    private int i;
    
    public A(int x) {
        setI(x);
    }

    @Override
    public String toString() {
        return "A(" + i + ")";
    }

    void setI(int x) {
        i = compute(x);
    }
    private int compute(int x) {
        if (x > 0) {
            return x * compute(x - 1);
        } else {
            return 1;
        }
    }
}
