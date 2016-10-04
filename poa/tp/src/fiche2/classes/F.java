package fiche2.classes;

public class F {
    public static void main(String[] args) {
        E x = new E(3);
        System.out.println(x);
        x.setP(new D(5));
        System.out.println(x);
        x.resetP();
        System.out.println(x);
        E y = new E(7);
        E z = new E(7);
        y.equalize(z);
        y.equalize(x);
        System.out.println(x);
    }
}
