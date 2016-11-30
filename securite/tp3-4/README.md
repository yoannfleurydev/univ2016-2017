# TP3 - TP4 Sécurité des clients et serveurs web

## 1 Côté client

### Exercice 1 (Cookies)

Le navigateur fait 57 requêtes à [wikipedia](https://fr.wikipedia.org), sur 3
sous domaines différents. Sur TOR, je n'ai aucun cookie de stockés, en revanche
sur Firefox j'ai 4 cookies du domaine `fr.wikipedia.org` et 1 du domaine 
`wikipedia.org` :

* `fr.wikipedia.org`
    * **CP** : Contient la valeur `H2` mais aucune idée de ce que cela peut être.
    * **WMF-Last-Access** : Contient la date de dernier accès au site.
    * **frwikiGeoFeaturesUser2** : Contient une valeur hexadécimale
    * **frwikimwuser-sessionId** : Contient une valeur hexadécimale (avec le nom on 
      devine que c'est l'identifiant de session).
* `wikipedia.org`
    * **GeoIP** : Contient l'endroit depuis lequel on accède au site.

D'autres cookies sont disponibles pour le domaine `wikimedia.org`, 5 en tout.
    * **WMF-Last-Access** : Contient le dernier accès à la WMF (WikiMediaFoundation)
    * **GeoIP** : Contient l'endroit depuis lequel on accède au site.
    * **CP** : Contient la valeur `H2` mais aucune idée de ce que cela peut être.

Description des attributs des cookies :

* **secure** : Définie si le cookie ne doit être envoyé que sur du HTTPs car
  il contient des données confidentielles. 
* **httpOnly** : Définie si le cookie est accessible à d'autre protocole que 
  HTTP. Par exemple si le cookie est disponible via JavaScript.
* **expires** : Date de fin de validité du cookie.

Pour complètement charger le site de la [fnac](http://www.fnac.com/), le 
navigateur effectue 153 requêtes.

### Exercice 2 (Requêtes HTTP)

**Entête de la requête :**

```
GET / HTTP/1.1
Host: www.univ-rouen.fr
Connection: keep-alive
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
DNT: 1
Accept-Encoding: gzip, deflate, sdch
Accept-Language: en-US,en;q=0.8,fr;q=0.6
Cookie: JSESSIONID=76BDF3BF3ABB6DC328837BEDCD3BC2AA; _pk_id.4.7430=1e74b8bce55573f2.1480523784.1.1480523784.1480523784.; _pk_ses.4.7430=*
```

On fait une requête `GET` (donc sans corps) sur la ressource racine `/` avec le 
protocole `HTTP/1.1` sur le domaine `www.univ-rouen.fr`. La connexion 
`keep-alive` permet de spécifier qu'avec cette seule requête la réponse peut 
être éparpillée sur plusieurs *chunk*. La requête indique également que l'on ne 
souhaite pas de `Cache-Control`, mais qu'on autorise la création avec un 
`max-age=0`. On aurait pu dire qu'on ne voulait absolument pas de cache avec 
la valeur `no-cache`. La requête envoie également le type de client sur lequel 
on se trouve `User-Agent`. Vient ensuite les types de données que l'on accepte, 
l'encodage et le langage préféré. La requête transmet également les cookies.


**Entête de la réponse :**
```
HTTP/1.1 200 OK
Date: Wed, 30 Nov 2016 16:36:29 GMT
Server: Apache
Connection: close
Transfer-Encoding: chunked
Content-Type: text/html
```

La requête vers [www.univ-rouen.fr](http://www.univ-rouen.fr) nous indique que 
la ressource demandée existe bien et que le protocole est en HTTP/1.1

> `HTTP/1.1 200 OK`

La ressource demandée nous indique la date de transmission de la réponse :

> `Date: Wed, 30 Nov 2016 16:36:29 GMT`

La ressource demandée nous indique le serveur qui envoie la réponse :
> `Server: Apache`

La ressource demandée nous indique si la réponse nécessite un flux de 
connexion :

> `Connection: close`

La ressource demandée nous indique si la réponse est transmise en plusieurs 
morceaux :

> `Transfer-Encoding: chunked`

La ressource demandée nous indique le type de contenu de la réponse :

> `Content-Type: text/html`

#### Que signifie l'en-tête `Location` ?

L'en-tête `Location` permet d'indiquer au navigateur depuis quelle URL nous 
avons été redirigé.

#### Connectez vous sur l'ENT, réessayer le site précédent, que se passe-t-il ?

On est directement redirigé vers l'ENT de Rouen.

#### Pourquoi allez vous directement sur le site fr.wikipedia.org en https ?

Une redirection est mise en place côté serveur pour que les connexions sur le 
port 80 (i.e. http) soient redirigées sur le port 443 (i.e. https).

#### Connexion sur GreenWeez. Que se passe-t-il ?

Le mot de passe est chiffré côté client pour être envoyé sur le serveur par la 
suite. C'est utile pour les sites qui ne sont pas en HTTPS pour que, au cas où 
le MITM intercepte le données de formulaire ne puisse pas voir le mot de passe 
en clair. C'est une stratégie risquée qui n'empêche pas d'avoir accès au site 
GreenWeez si on se trouve au milieu et que l'on intercepte le mot de passe.

#### Connexion sur DragonBleu. Que se passe-t-il ?

Le mot de passe apparait en clair dans la requête. Aucun chiffrement n'est 
effectué côté client et la connexion étant en http, le mot de passe apparait en 
clair.

#### Décrire les champs suivant :

* Referer :  <!-- TODO -->
* Accept-Language :  <!-- TODO -->
* User-Agent :  <!-- TODO -->
* Server :  <!-- TODO -->
* Set-Cookie : <!-- TODO -->
* Cookie : <!-- TODO -->
* Strict-Transport-Security :  <!-- TODO -->
* Access-Control-Allow-Origin : <!-- TODO -->
* Access-Control-Expose-Headers : <!-- TODO -->
* X-Analytics : <!-- TODO -->
* public-key-pins-report-only : <!-- TODO -->

### Exercice 3 (Vérification côté client)

La demonstration effectuée montre qu'il faut toujours respecter le principe 
NTUI (Never Trust User Input) côté serveur. Il faut toujours filtrer les données
que l'on reçoit d'une requête utilisateur, même si on fait des ajout de filtrage
au niveau du client. Les ajouts de filtrage côté client sont utiles pour l'UX
Design.

## 2 Côté serveur 

### Exercice 4 (TLS)

#### Sur quel protocole de sécurité est-il fondé ?

HTTPS est fondé sur le protocole TLS, autrement appelé SSL ou encode HTTP 
Secure.

#### Quel type de certificat est utilisé ?

Un certificat d'**authentification** émis pas une autorité tierce est mis en 
place. Cela garantit théoriquement la confidentialité des données échangées.