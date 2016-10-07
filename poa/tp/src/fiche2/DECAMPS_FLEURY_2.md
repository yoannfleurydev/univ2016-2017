# Fiche 2 POA

#### Exercice 2

1. Portion de préinitialisation => Suite consécutive des appels à this et super de $E_i$ à $E_n$
2. Portion d'initialisation => Tout ce qui suit les appels à this et super de $E_i$ et avant le retour de $E_i$
3. Portion d'exécution => Corps du constructeur sans les appels à this et super

#### Exercice 3 q.4

Dans le cas d'un point de jonction avec un if, la coupe se fait avant l'appel à la fonction (on est plus précis au niveau de la coupe); alors qu'avec une coupe normale, la comparaison s'effectue dans l'advice (si désiré).

#### Exercice 4 q.2

On n'aurait pas pu utiliser cette technique dans le cas de l'exercice 3, car on ne connaît pas la valeur de l'attribut `group` à l'avance.