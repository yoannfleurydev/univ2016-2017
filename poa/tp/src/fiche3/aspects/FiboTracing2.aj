package fiche3.aspects;

public aspect FiboTracing2 {
    after() : FiboConfig.fiboCall() && !FiboConfig.insideFiboCall() {
        System.out.println();
    }
}
