package fiche5.mvc;

import fiche5.util.ControllerCreator;
import fiche5.util.ModelCreator;
import fiche5.util.Subject;
import fiche5.util.ViewConfigurator;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public aspect MVCFramework {

    declare parents : @Observable * extends Subject;

    declare error : execution(@ChangeState * *.*(..)) && !within(@Observable *)
            : "ChangeState should be in @Observable annotated class !";

    pointcut afterChange(Subject s) : execution(@ChangeState * *.*(..)) && this(s);

    pointcut mvcConstructorExecution(Object s) : execution((@MVC *).new(..)) && this(s);

    after(Subject s) : afterChange(s) {
        s.notifyObservers();
    }

    after(Object s) : mvcConstructorExecution(s) {
        Method[] methods = s.getClass().getMethods();

        run(methods, s, ModelCreator.class);
        run(methods, s, ControllerCreator.class);
        run(methods, s, ViewConfigurator.class);
    }

    private void run(Method[] methods, Object o, Class c) {
        for (int i = 0; i < methods.length; i++) {
            if (methods[i].isAnnotationPresent(c)) {
                try {
                    methods[i].invoke(o);
                } catch (IllegalAccessException | InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
