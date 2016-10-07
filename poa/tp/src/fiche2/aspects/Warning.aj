package fiche2.aspects;

public aspect Warning {

	pointcut notInConstructorE(): !withincode(fiche2.classes.E.new(..));
	pointcut callDnew(): call(fiche2.classes.D.new(..)) && notInConstructorE();
	
	declare warning: callDnew(): "Pas bien";

}
