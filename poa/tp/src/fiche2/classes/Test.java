package fiche2.classes;

class A {
    private String s;
    private int i;
    public A(int x) { this(); i = x; }
    public A() { s = ""; }
}
class B extends A {
    private int j;
    public B() { this(C.m()); }
    public B(int x) { super(C.p(x)); j = x; }
}

class C {
    public static int m() { return 1; }
    public static int p(int i) { return i; }
}

public class Test {
    public static void main(String[] args) {
        new B();
        System.out.println("---------");
        new A();
        System.out.println("---------");
        new Object();
    }
}
