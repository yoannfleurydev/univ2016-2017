package fiche3.classes;

public class FiboTest {
    private static void testShortValues() {
        Fibo f = new Fibo();
        assert f.compute(0) == 0;
        assert f.compute(1) == 1;
        assert f.compute(2) == 1;
        assert f.compute(3) == 2;
        assert f.compute(5) == 5;
        assert f.compute(10) == 55;
//        assert f.compute(20) == 6765;
//        assert f.compute(30) == 832040;
    }
    public static void main(String[] args) {
        testShortValues();
    }
}
