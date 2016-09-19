package fiche1.classes;

public class C {
    public static void main(String[] args) {
        B x = new B(3);
        System.out.println(x);
        x.setP(new A(5));
        System.out.println(x);
        x.resetP();
        System.out.println(x);
    }
}
