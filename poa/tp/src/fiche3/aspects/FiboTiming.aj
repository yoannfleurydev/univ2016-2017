package fiche3.aspects;

public aspect FiboTiming {
    long around() : FiboConfig.fiboCall() && !FiboConfig.insideFiboCall() {
        long start = System.nanoTime();
        long result = proceed();
        long end = System.nanoTime();
        System.out.println(String.format("Temps : %d ns", end - start));

        return result;
    }
}
