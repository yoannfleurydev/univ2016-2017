package fiche3.aspects;

import org.aspectj.lang.JoinPoint;

public aspect FiboTracing3 extends AbstractTracing {
    pointcut toBeTraced() : FiboConfig.fiboCall();

    @Override
    public String begin(JoinPoint jp) {
        return String.format("recCompute(%d)", (int)jp.getArgs()[0]);
    }

    @Override
    public String end(JoinPoint jp, Object res) {
        return String.format("f(%d) = %d", (int)jp.getArgs()[0], (long)res);
    }
}
