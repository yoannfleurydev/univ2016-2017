package fiche2.aspects;

public aspect Creation {

	
	pointcut callD(): call(fiche2.classes.D.new(..));
	pointcut outConstructorE(): !cflow(withincode(fiche2.classes.E.new(..)));
	
	pointcut ruleDinE(): callD() && outConstructorE();
	
	declare soft: IllegalAccessException : within(Creation) && adviceexecution();
	
	before(): ruleDinE() {
		throw new IllegalAccessException();
	}
	
}
