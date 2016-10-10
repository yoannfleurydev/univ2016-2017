package fiche3.aspects;

public aspect FiboConfig {
    pointcut fiboCall() : call(long fiche3.classes.Fibo.recCompute(int));
    pointcut insideFiboCall() : cflowbelow(fiboCall());
}
