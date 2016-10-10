package fiche3.aspects;

import fiche2.aspects.utils.Indenter;
import org.aspectj.lang.JoinPoint;

public abstract aspect AbstractTracing {
    abstract pointcut toBeTraced();

    public abstract String begin(JoinPoint jp);
    public abstract String end(JoinPoint jp, Object res);


    private Indenter indenter = new Indenter();
    long around() : toBeTraced() {
        indenter.write(begin(thisJoinPoint));
        indenter.inc();
        long result = proceed();
        indenter.dec();
        indenter.write(end(thisJoinPoint, result));

        return result;
    }
}
