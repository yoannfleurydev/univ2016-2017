package fiche3.aspects;

public aspect FiboCounting {
    pointcut print() : execution(* FiboTracing3.end(..));

    private int calls = 0;
    String around() : print() && FiboConfig.insideFiboCall() {
        calls++;
        return proceed() + " *";
    }

    String around() : print() && !FiboConfig.insideFiboCall() {
        String result = String.format("%s [%d appels]", proceed(), ++calls);
        calls = 0;
        return result;
    }
}
