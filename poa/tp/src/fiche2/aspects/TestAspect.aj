package fiche2.aspects;

import fiche2.aspects.utils.Indenter;

public aspect TestAspect {
	
	private pointcut constructorPreinit() : preinitialization ( fiche2.classes..new(..) );
	private pointcut constructorInit()    : initialization    ( fiche2.classes..new(..) );
	private pointcut constructorExec()    : execution         ( fiche2.classes..new(..) );
	private pointcut constructorCall()    : call              ( fiche2.classes..new(..) );
	
	private pointcut methodCalls() : call (* fiche2.classes..*(..));
	private pointcut mainExec() : execution (void fiche2.classes.Test.main(..));
	
	private pointcut attrAssigned(): set (* fiche2.classes..*);
	
	private pointcut all(): constructorPreinit() 
		|| constructorInit() 
		|| constructorExec() 
		|| constructorCall() 
		|| methodCalls()
		|| mainExec()
		|| attrAssigned();

	private static Indenter indenter = new Indenter();
	
	before(): all() {
		indenter.write("BEFORE -- " + thisJoinPointStaticPart);
		indenter.inc();
	}

	after(): all() {
		indenter.dec();
		indenter.write("AFTER -- " + thisJoinPointStaticPart);
	}
	
}