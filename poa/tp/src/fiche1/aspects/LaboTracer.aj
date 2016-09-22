package fiche1.aspects;

public aspect LaboTracer {
    private static int INDENTATION;

    pointcut print() :
        cflowbelow(execution(* fiche1.labo.C.main(..)))
           && !initialization(*.new(..))
           && !staticinitialization(*)
           && !preinitialization(*.new(..))
           && !execution(*.new(..))
           && !execution(* *.*(..))
           && !set(* *)
           && !get(* *)
           && !within(LaboTracer);
//            call(fiche1.classes.*.new(..)) ||
//            call(* fiche1.classes.*.*(..))) &&


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
