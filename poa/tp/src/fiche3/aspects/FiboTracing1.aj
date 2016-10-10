package fiche3.aspects;

import fiche3.utils.Indenter;

public aspect FiboTracing1 {
    public pointcut recComputeCall(int i) : call(long fiche3.classes.Fibo.recCompute(int)) && args(i);

    private Indenter indenter = new Indenter();

    long around(int i) : recComputeCall(i) {
        indenter.write(String.format("recCompute(%d)", i));
        indenter.inc();
        long result = proceed(i);
        indenter.dec();
        indenter.write(String.format("f(%d) = %d", i, result));

        return result;
    }
}
