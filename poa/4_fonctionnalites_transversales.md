# 4 Fonctionnalités transversales

Fonctionnalités dynamiques : modification du comportement des applications.
Pour tisser, il faut deux choses :

* un advice (quoi faire)
* une coupe (où le faire)

**Syntaxe d'un advice :**

```
<type>'('<parametres>')'[déclaration de levée d'exception]':'<déclaration de coupe>'{'
    <corps de l'advice>
'}'
```

* Similitudes :
    * une méthode à un nom, un advice non, mais on peut en donner un grâce à 
    org.aspectj.lang.annotation.AdviceName.
    * les 2 peuvent prendre des paramètres. Ceux d'une méthode sont fournis lors d'un 
    appel à cette méthode. Ceux d'un advice sont fournis par une coupe.
    * les 2 peuvent lever des exceptions.
    * les 2 peuvent utiliser `this` (méthode c'est l'object courant, advice c'est 
    l'aspect courant).
    * les advices around doivent retourner une valeur et disposent donc d'un type 
    de retour.

* Différences :
    * un advice n'a pas de nom
    * on ne peut pas appeler un advice
    * aucun modificateur n'est autorisé pour les advices (pas appelables)
    * pas de type de retour pour les advices before et after
    * les advices disposent de 3 variables spéciales:
        * thisJoinPoint
        * thisJoinPointStaticPart
        * thisEnclosingJoinPointStaticPart
    * les advices around disposent d'un mot clé spécial : proceed pour lancer le code 
    associé aux points de jonction.

**Before :**

Exécuté avant le code associé aux points de jonction. Si l'advice lève une exception, 
le code n'est pas exécuté. Le code ne reprend jamais la main.

```java
before() : execution(@Secured * *(..)) {
    // Vérification des droits de l'utilisateur
}
```

**After :**

Exécuté après le code associé aux points de jonction. Il existe 3 sous-types :

* after(finally)

```java
after() : call(* Account.*(..)) {
    // Log d'une fin d'opération (avec ou sans levée d'exception)
}
```

* after returning : ne s'exécute que si le code associé aux points de jonction ne 
lève pas d'exception

```java
after() returning : call(* Account.*(..)) {
    // Log d'une fin d'opération (sans levée d'exception)
}

after() returning (Connection connection) : 
    call(Connection DriverManager.getConnection()) {
        System.out.println("Connexion à la base de données : " + connection);
}
```

* after throwing : ne s'exécute que si une exception est levé par le point 
de jonction.

```java
after() throwing : execution(* *(..)) {
    // Log d'une levé d'exception
}

after() throwing(Throwable e) : execution(* *(..)) {
    System.out.println("Levé d'une exception " + e);
}
```

A moins que l'advice ne lève à son tour une exception, l'exception levée au 
niveau du point de jonction est ensuite propagée normalement dans la pile des
appels de méthode.

**Around :**

* toujours un type de retour. Celui-ci doit être compatible avec de tous les 
points de jonction.
    * au pire on utilise Object
    * AspectJ utilise l'auto-boxing
* l'advice peut appeler proceed, zéro, une ou plusieurs fois. La valeur des 
paramètres de proceed peut changer, mais ni leur nombre, ni leur type, 
ni le type de retour qui doivent tous rester identique à ceux de l'advice.

**Contexte des points de jonction :**

Certaines coupes permettent de filtrer les points de jonction en fonction
du type de certains éléments de code :
this, target, args, @this, @target, @args, @within, @withincode, @annotation.
Ces mêmes coupes permettent d'accéder à des éléments de contexte : changement 
de syntaxe.

```
<type de coupe>'('<type>')' devient
<type de coupe>'('<ident>')'
```

Un advice s'appuyant sur une telle coupe peut récupérer de tels éléments et 
les utiliser dans son corps.

AspectJ fournit une API Reflection qui permet d'obtenir toutes les 
informations relatives aux points de jonction. On accède par l'intermédiaire
des 3 variables :

* thisJoinPoint : org.aspectj.JoinPoint fournit des informations dynamiques 
(objet, source, cible, annotation, ...)
* thisJoinPointStaticPart : JoinPointStaticPart fournit des informations 
statiques
* thisEnclosingJoinPointStaticPart : JoinPointStaticPart

## Fonctionnalités statiques : modification de la structure de l'application

Exemple avec le patron de conception Observateur. L'objet observé doit 
permettre l'enregistrement et le désenregistrement d'observateurs sur lui-
même et doit les prévenir quand il change d'état.
