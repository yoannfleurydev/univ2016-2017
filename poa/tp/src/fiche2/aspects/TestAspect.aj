package fiche2.aspects;

public aspect TestAspect {

    private pointcut constructorPreinit() : preinitialization ( fiche2.classes..new(..) );
    private pointcut constructorInit()    : initialization    ( fiche2.classes..new(..) );
    private pointcut constructorExec()    : execution         ( fiche2.classes..new(..) );
    private pointcut constructorCall()    : call              ( fiche2.classes..new(..) );

    private pointcut all(): constructorPreinit() || constructorInit() || constructorExec() || constructorCall();

    // ====================================
    private int indent = 0;
    private String printTabs() {
        String str = "";
        for (int i = 0; i < indent; i++) {
            str += "|  ";
        }
        return str;
    }
    // ====================================

    before(): all() {
        System.out.println(printTabs() + "BEFORE -- " + thisJoinPointStaticPart);
        indent++;
    }

    after(): all() {
        indent--;
        System.out.println(printTabs() + "AFTER -- " + thisJoinPointStaticPart);
    }

}