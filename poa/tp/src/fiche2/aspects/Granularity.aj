package fiche2.aspects;

public aspect Granularity {
	
	pointcut getMember(): get(private * fiche2.classes..*);
	pointcut setMember(): set(private * fiche2.classes..*);
	
	// Méthode 1
	pointcut members(): getMember() || setMember();
	
	// Méthode 2
	pointcut accessMember(Object objThis, Object objTarget): members() && this(objThis) && target(objTarget);
	
	// Méthode 3
	pointcut sameObject(Object objThis, Object objTarget): accessMember(objThis, objTarget) && if (!objThis.equals(objTarget));
	
	declare soft: IllegalAccessException : within(Granularity) && adviceexecution();
	
	// Méthode 1
	/*
	before(): accessMember() {
		if (!thisJoinPoint.getTarget().equals(thisJoinPoint.getThis())) throw new IllegalAccessException();
	}
	*/
	
	// Méthode 2
	/*
	before(Object obj1, Object obj2): accessMember(obj1, obj2) {
		if (!obj1.equals(obj2)) throw new IllegalAccessException();
	}
	*/
	
	// Méthode 3
	/*
	before(Object obj1, Object obj2): sameObject(obj1, obj2) {
		throw new IllegalAccessException();
	}
	*/
	
}
