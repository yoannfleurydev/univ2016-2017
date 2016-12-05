package fiche5.mvc;

import fiche5.util.ControllerCreator;
import fiche5.util.ModelCreator;
import fiche5.util.Subject;
import fiche5.util.ViewConfigurator;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public privileged aspect MVCFramework {
    declare parents : @Observable * extends Subject;
    declare error : execution(@ChangeState * *(..)) && !within(@Observable *)
            : "ChangeState should be in @Observable annotated class !";

    pointcut mvcConstructorExecution() : execution(@MVC *.new(..));

    pointcut afterChange() : call(@ChangeState * *(..));

    after(Subject model) : afterChange() && target(model) {
        model.notifyObservers();
    }

    after(Subject s) : mvcConstructorExecution() && this(s) {
        Method[] methods = s.getClass().getMethods();

        // ModelCreator
        for (int i = 0; i < methods.length; i++) {
            if (methods[i].isAnnotationPresent(ModelCreator.class)) {
                try {
                    methods[i].invoke(s);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }

        // ControllerCreator
        for (int i = 0; i < methods.length; i++) {
            if (methods[i].isAnnotationPresent(ControllerCreator.class)) {
                try {
                    methods[i].invoke(s);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }

        // ViewConfigurator
        for (int i = 0; i < methods.length; i++) {
            if (methods[i].isAnnotationPresent(ViewConfigurator.class)) {
                try {
                    methods[i].invoke(s);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
