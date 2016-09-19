package fiche1.aspects;

public aspect LaboTracer {
    private static int INDENTATION;

    pointcut print() :
        call(fiche1.labo.*.new(..)) ||
        call(* fiche1.*.*(..));


    before() : print() {
        printIndentation();
        System.out.println("Entrée : " + thisJoinPointStaticPart);
        INDENTATION++;
    }

    after() : print() {
        INDENTATION--;
        printIndentation();
        System.out.println("Sortie : " + thisJoinPointStaticPart);
    }

    private void printIndentation() {
        for (int i = 0; i < INDENTATION; i++) {
            System.out.print("|  ");
        }
    }
}
