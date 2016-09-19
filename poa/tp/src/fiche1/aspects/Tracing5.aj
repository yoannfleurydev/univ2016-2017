package fiche1.aspects;

public aspect Tracing5 {
    private static int INDENTATION = 0;
    declare precedence : Tracing3,Tracing5;

    pointcut print() :
        call(* java.io.PrintStream.println(..))
        && within(fiche1.aspects.Tracing3);

    before() : Tracing3.print() {
        INDENTATION++;
    }

    after() : Tracing3.print() {
        INDENTATION--;
    }

    before() : print() {
        printIndentation();
    }

    private void printIndentation() {
        for (int i = 0; i < INDENTATION; i++) {
            System.out.print("|  ");
        }
    }
}
