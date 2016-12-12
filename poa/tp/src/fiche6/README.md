# Fiche 6

## Justifier les choix de WeakHashMap et LinkedList

**WeakHashMap** : la WeakHashMap contient des Weak Reference, si ces références
sont les seules à référencer un objet, alors celui-ci passe dans le garbage 
collector.

**LinkedList** : pour de choix de rapidité, comme on parcours tous le temps 
tout le contenu de la liste, autant prendre une liste avec un ajout en temps 
constant et ne pas prendre une liste tableau qui prendrait trop de temps.

