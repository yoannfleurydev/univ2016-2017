# Chapitre 2 : Points de jonction et coupes

1. Qu'est ce qu'un point de jonction?
2. Catalogue des points de jonction repérables par AspectJ.
3. Qu'est ce que la signature d'un élément de code Java?
4. Qu'est-ce qu'une coupe?
5. Catalogue des coupes définissables à l'aide d'AspectJ et de signatures.

## 1 Qu'est ce qu'un point de jonction?

~~Un point particulier dans le code~~

Une portion de code dans le flot d'exécution.
Validation du diagramme de séquence UML.

## 2 Catalogue des points de jonction repérables par AspectJ.

Les deux premiers types sont les plus fréquents (voir copie). Permettent de 
tisser du code avant, après ou autour d'un appel ou d'une exécution de méthode.

Les deux types suivant concernent les constructeurs. **Attention :** un point de
jonction relatif à l'exécution d'un constructeur ne contient pas les appels à 
`this` ou à `super` (apparaissant éventuellement en première ligne). De même que
l'appel implicite à `super` si aucun appel explicite à `this` ou `super`.

Les types 5 et 6 concernent les accès aux champs. Ces champs peuvent être 
statiques. Exemple d'utilisation: 

* un champ peut être mis en cache et chaque lecture nécessite une vérification 
pour s'assurer que la valeur en cache est à jour. 
* on peut souhaiter marquer un objet chaque fois qu'un de ses champs est 
modifié. Un processus automatique mettra ensuite à jour une base de données avec
les objets modifiés. 

Le type 7 bloc catch est utilisable possiblement pour logger les exceptions d'un
certain type avant de les propager.

Les types 8, 9 et 10, initialisation. Le 8 recouvre le chargement du type et 
exécute les blocs statiques qui s'y trouvent. Le 9, le point de jonction démarre
après le retour de l'appel à `super` (direct, indirect et/ou explicite). Il se 
termine avec l'exécution du constructeur. Le 10 préinitialisation d'objet, code 
exécuter par un constructeur avant l'appel à `super` (essentiellement 
l'évaluation des paramètres à `super`). 

Le type 11 est l'auto-référence  à AspectJ. Il permet de récupérer l'exécution 
d'advice.

## 3 Qu'est ce que la signature d'un élément de code Java?

Tous les éléments de code Java significatifs ont une signature (classes, 
interfaces, méthodes, constructeurs, champs, expression, ...). Il est possible 
d'utiliser des **jockers** :

* `*` remplace un nombre quelconque de caractère (autre que le point). Par 
exemple tout ou partie du nom d'un paquetage, d'un type, ...
* `..` remplace un nombre quelconque de caractère. Par exemple hiérarchie des 
paquetages, liste de paramètre, ...
* `+` désigne n'importe quel sous-type d'un type donné.

* Signatures de types (classes ou interfaces)

```
<annotations><nom de type> '<' <paramètre de type> '>'
```

* Signatures de méthodes

```
<annotation><modificateur><type de retour><nom de type>'.'<nom de méthode>'('<paramètre>')'<classes de levé d'exceptions>
```

* Signatures de champs

```

```

## 4 Qu'est-ce qu'une coupe?

Une coupe est un élément de programmation AspectJ permettant de sélectionner un 
ensemble de point de jonction. Une coupe peut être anonyme ou nommée.

```
<type de coupe><signature>
```

## 5 Catalogue des coupes définissables à l'aide d'AspectJ et de signatures.

```
            coupes
            /    \
        simples   ------------composées
        /     \               /   |   \
    kinded  non-kinded      &&    ||   !
```

### Coupes non-kinded

**Coupes basées sur le flot d'exécution** `cflow(<coupe>), cflowbelow(<coupe>)`.
Un point de jonction est sélectionner s'il est inclus dans le flot d'exécution 
associé à un point de jonction repéré par la coupe.

```
cflow(call(AccountService.debit(..)))
cflowbelow : idem mais ne sélectionne pas les points de jonction repérés par la 
coupe fournie en paramètre.
``` 

Exemple : 

```
transacted() && !cflowbelow(transacted())
```
évite de sélectionner des points de jonction en cascade lors d'appels récursifs
repérés par transacted().

**Coupes basées sur la position géographique des points de jonction**. 
`within(<signature de type>), withincode(<signature de méthode ou cons>)`

Exemple : 

```
traced() && !within(TraceAspect)
```
permet d'éviter de tracer des points de jonction situés dans l'aspect de traçage
lui-même.

**Coupes basé sur le type des objets mis en jeu**.
`this(<type>), target(<type>), args(<type>, ...)`

```java
public class Amount {
    public void debit(double amount) throws InsufficientBalanceException { //within, this Account
        ...                                                                //within, this Account
    }                                                                      //within, this Account
                                                                           //within
    public static class Helper() {                                         //within
        ...                                                                //within
    }                                                                      //within
}

public class SavingAccount extends Account {
    ...                                                                    // this Account
}
```

Exemple : `this(Type) && !within(Type)` sélectionne les pts de jonction 
uniquement situés dans des sous-classesde Type. 

Pour args, les objets considérés comme arguments varient :

* call, execution, initialisation, preinit : arguments de la méthode ou du 
constructeur concerné(e)
* handler : l'exécution levée
* set : valeur à affecter au champ

