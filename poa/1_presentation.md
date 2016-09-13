# Chapitre 1 : Présentation

## Historique :

* 1936 : Machine de Turing
* 1945 : Premier calculateurs en langages binaires
* Année 50 : Assembleur
* Années 60-70 : Langages de plus haut niveau (impératifs, fonctionnels)
* Année 80 : Langages orientés objets

## Progrès technologiques :

* Augmentation de la vitesse de calcul
* Augmentation de l'espace mémoire
* Diminution de la taille
* Les supports mémoire (cartes perforés -> supports magnétiques et optiques)

## Progrès conceptuels : 

Contrairement aux autres outils (marteau, ascenseur, lave-linge, ...) 
l'ordinateur n'a pas une fonction dédié. Il est programmable.

> L'informatique est la science qui étudie les programmes qu'un ordinateur peut 
> exécuter.

Evolution du logiciel :

* Programmation binaire
* Besoin d'abstraction 
    * langages assemblage

* Besoin de modélisation de concept de haut niveau 
    * langages de haut niveau
    * développement de bibliothèques de fonctions
    * applications de plus en plus complèxes (compilation, OS, applications 
    dédiés)
    * IHM
    * réseaux, système embarquées, multi-utilisateurs, ...

## Comment gérer la compléxité ?

La réponse générale est la modularité de l'application. Les langages de haut 
niveau, les langages orientés objets et la conception orientés aspect sont là 
pour répondre à ce besoin.

Découpage des grosses structures en structures plus fines. Regroupement au sein 
d'une même structure des éléments sémantiquement liés.

Objectif : permettre à l'esprit humain d'appréhender de gros logiciels.

Les langages objets favorisent la définition de modules structurels. En 
pratique, des éléments étrangers à la nature de la classe apparaissent souvent 
dans sa définition.

La POA s'efforce de lutter contre :

* l'enchevêtrement de code (**code tangling**)
* l'éparpillement de code (**code scattering**)

**Avantages** : 

* chaque préoccupation est traitée dans un module dédié
* suppression de la dépendance des modules métiers vis-à-vis des modules 
associés aux préoccupations transverses.

Le découpage lié à la modularisation est efficace si il vérifie : 

* Faible couplage : pas trop de référence inter-modules
* Forte cohésion : un module doit mettre en rapport des éléments sémantiquement 
liés.

---

La POA satisfait ces critères :

* l'aspect diminue le couplage (modules métiers indépendant de la sécurité)
* l'aspect est un module à forte cohésion

**DIP : Dependency Inversion Principle**

---

En gros :

* les préoccupation transversales : codées en Java
* comment les injecter ? 
    * tissage (weaving)
        * à l'aide d'un langage dédié
        * en s'appuyant sur le langage support (Java ici)

`AspectJ` offre les deux approches : 

* le langage dédié est plus puissant
* la version Java sera brièvement étudiée (@AspectJ)

---

Définition et expression

```
|---------------|
| FigureElement |
|---------------| *                 1 |---------------|
|---------------|<|-------------------|    Figure     |
| + setXY()     |                     |  <<factory>>  |
| + draw()      |                     |---------------|
|---------------|                     |---------------|
        ^                             | + makePoint() |
        |                             | + makeLine()  |
    -----------------------------     |---------------|
    |                           |
|-----------|            |--------------|
|   Point   |            |     Line     |
|-----------|            |--------------|
| + x : int |            | + p1 : Point |
| + y : int |            | + p2 : Point |
|-----------|            |--------------|

```

**Vocabulaire** : 

* Point de jonction (join point) : emplacement dans le cde exécuté où un aspect
peut intervenir. Tous les emplacements ne sont pas de points de jonction. 
AspectJ permet de sélectionner les plus importants (appels ou exécution de 
méthodes, lectures ou écritures d'attribut, ...)
* Coupe (point cut) : expression permettant de sélectionner des points de 
jonction
* Greffon (advice) : code décrivant le comportement additionnel que l'on 
souhaite injecter. 
* Aspect (aspect) : l'unité modulaire regroupant coupes et greffons relatifs à 
une préoccupation partulière

Exemple de poitns de jonction liés à des appels de méthodes. Un tel point de 
jonction délimite la portion de code exécuté qui démarre avec l'appel de la 
méthode (donc après l'évaluation des arguments), comprend l'exécution de la 
méthode et se termine jsute après le retour (normal ou dû à une levée 
d'exception)

Une première coupe : `call(void Point.setX(int))`

Les expressions de coupe peuvent être combinées avec des opérateurs booléens :
`!, &&, ||`

`call(void Point.setX(int)) || call(void Point.setY(int))`

Coupe nommée :

```java
pointcut move() :
    call(void FigureElement.setXY(int, int)) ||
    call(void Point.setX(int)) ||
    call(void Point.setY(int)) ||
    ...
```

Réutilisation du nom:
`move() && !call(void FigureElement.setXY(int, int)`

Jokers:
`call(void Figure.make*(..)` nom de méthode commençant par `make` avec un nombre
et des types d'arguments quelconques.
`call(public * Figure.*(..))` sélectionne tout les appels de méthodes publiques 
de la classe Figure.

--- 

3 sortes d'advice : `before`, `after` et `around`. Un *advice* ressemble à une 
méthode Java. Il y a notamment la mention d'une coupe.

```java
before() : move() {
    System.out.println("On entre dans une méthode qui fait bouger");
}
```
Code injecté juste avant les points de jonctions repérés par la coupe.

```java
after() : move() {
    System.out.println("On sort dans une méthode qui fait bouger");
}
```
Code injecté juste après les points de jonctions repérés par la coupe.

`around` : code injecté **avant et après**.

---

En plus de sélectionner des points de jonctions, les coupes peuvent donner accès
à des éléments de contexte associés aux points de jonction. Les advices peuvent 
ensuite les utiliser.

```java
pointcut setXY(FigureElement fe, int x, int y) :
    call(void FigureElement.setXY(int, int))
    && target(fe)
    && args(x, y);
```

```java
after(FigureElement fe, int x, int y) : setXY(fe, x, y) {
    System.out.println(fe + " subit une transition de (" + x + ", " + y + ").");
}
```

---

```java
aspect Loggin {
    private OutStream logStream = System.err;

    pointcut move() : ...

    before() : move() {
        logStream.println("Ca va bouger");
    }
}
```

## Comment le code des advices est-il tissé dans le code métier ?

Automatiquement par un tisseur (weaver).

Initialement les tisseurs tissaient le code source.

```
|-------|
| .java |\
|-------| \
           \|-------|
            | .java |
           /|-------|
          /  
         /  
|-----| /
| .aj |/   Difficile de remonter les erreurs
|-----|
```

Maintenant, 3 types de tissage :

* le tissage du code source

```
|-------|
| .java |----|
|-------|    |
             | ajc  |--------|
             |----->| .class |
             |      |--------|
|-----|      |
| .aj |------|
|-----|
```

* le tissage du code binaire

```
|-------| javac  |--------|
| .java |------->| .class |-------|
|-------|  ajc   |--------|       | ajc   |--------|
                                  |------>| .class |
|-----|  ajc     |--------|       |       |--------|
| .aj |--------->| .class |-------|
|-----|          |--------|       |
                                  |
                 |--------|       |
                 | .class |-------|
                 |--------|       |
                                  |
                 |--------|       |
                 | .jar   |-------|
                 |--------|
```

* le tissage au chargement des classes (bad-time weaving)

Du fait appel à un agent JVM qui réalise les options de tissage lors du 
chargement des types.

* léger surcoût à l'exécution
* possibilité de tisser à chaud sans recompiler

La configuration du tisseur est décrite dans un fichier XML de nom `aop.xml`, 
dans le répertoire `META-INF`, accessible depuis le classpath.

## Coûts et apports de la POA

### Coûts 

* Temps d'exécution légèrement supérieur (peu perceptible).
* Temps d'apprentissage *diminué psychologiquement par `@AspectJ`*.

### Apports

* moins d'enchevêtrement des préoccupations, moins de dispersion de code.
* plus de modularité.
* code plus facile à débugger, maintenir, reutiliser.