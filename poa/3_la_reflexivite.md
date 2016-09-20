# 3 La réfléxivité

> La réfléxivité en Java s'effectue grâce à l'API REFLECTION (reflexion en 
> français pour le reflet)

## Classes

    La classe Class est le point d'entrée de l'API. 

<!-- TODO Ecrire le cours qui est sur papier actuellement -->

## Constructeur

    On peut instancier une classe de 2 manière par introspection :

* avec la méthode `Class.newInstance()`
* avec la méthode `Constructor.newInstance(Object ...)`

    La deuxième est meilleure pour 3 raisons :

* la première ne permet d'invoquer que le le constructeur sans paramètre
* si ce constructeur est privé, impossible d'invoquer
* la première propage les éventuelles exceptions levées par le constructeur
sans les enrober dans une InvocationTargetException.

## Tableaux

`Class.isArray` permet de repérer les champs tableaux.

## Enumerations

`Class.isEnum` pour tester si un champs est de type énum.