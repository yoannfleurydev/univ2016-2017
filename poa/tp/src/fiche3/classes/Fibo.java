package fiche3.classes;

public class Fibo {
    public long compute(int n) {
        if (n < 0) {
            throw new IllegalArgumentException();
        }
        return recCompute(n);
    }
    private long recCompute(int n) {
        if (n <= 1) {
            return n;
        } else {
            return methodeInutile(n);
        }
    }
    private long methodeInutile(int n) {
        return recCompute(n - 2) + recCompute(n - 1);
    }
}
