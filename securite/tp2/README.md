# TP2 Utilisation de GnuPG

* CROCHEMORE Valentin
* FLEURY Yoann

## Mes premières clefs avec GPG

GPG utilise de la cryptographie symétrique et asymétrique. Chaque utilisateur
dispose d'une bi-clef publique/privé pour l'authentification, et d'une bi-clef
pour le chiffrement.

### Pourquoi ?

La clef privé pour l'authentification permet à l'expéditeur de chiffrer le
haché du message, ensuite le destinataire va déchiffrer ce message grâce à la
clef publique de l'expéditeur et va comparer si les deux hachés correspondent
(les hachés du message clair et du message chiffré).

La clef publique pour le chiffrement permet à l'expéditeur de chiffrer le
message qu'il veut envoyer au destinataire. La clef privée, gardée par le
destinataire lui permettra de déchiffrer le message.

### Installation de GPG

Étant sous environnement GNU/Linux, pas besoin d'installer `gpg` car il est
déjà dessus.

### Exercice 1

#### Quelle taille de clef choisissez-vous ? Pour quelles raisons ?

On choisit une taille de 3072 afin de pouvoir avoir des clefs assez forte
pour les prochaines années, sachant que le niveau de sécurité (en bits) sera
autour de 128 en 2020. C'est donc parfait car 3072 en taille de clef pour
DSA-El-Gamal fait 128 bits.

#### À quoi servent les données qui vous sont demandées ?

Nous est demandé :

* **le nom** : afin de montrer réellement qui nous sommes
* **l'adresse email** : permet d'avoir un identifiant unique
* **un commentaire** : on peut préciser des détails ici, comme **pro**,
**perso** etc.

#### Pourquoi est-ce que le processus de génération est lent ?

Car le logiciel doit générer des aléas. Il faut donc favoriser les I/O de la
machine. Le processus sera donc plus rapide si la machine est en fonctionnement
depuis longtemps.

#### Lisez les informations affichées par `gpg2` lors de la génération.

Aucune information n'apparait lors de la génération.

### Exercice 2 (Édition d'une clef)

#### `showpref`, que signifie les données affichées ?

```gpg
[ultimate] (1). Yoann Fleury <yoann.fleury@etu.univ-rouen.fr>
     Cipher: AES256, AES192, AES, 3DES
     Digest: SHA256, SHA384, SHA512, SHA224, SHA1
     Compression: ZLIB, BZIP2, ZIP, Uncompressed
     Features: MDC, Keyserver no-modify
```

Nous avons les différents algorithmes, hachages et compressions disponibles.

#### `check`, que pouvez-vous en déduire sur la forme de diffusion des clefs ?

```gpg
uid  Yoann Fleury <yoann.fleury@etu.univ-rouen.fr>
sig!3        89B642F0 2016-11-14  [self-signature]
```

La clef est autosignée. Un système de confiance existe de façon à garantir
l'identité. D'autres personnes peuvent signer la clef.

### Exercice 3 (Révocation d'une clef)

#### Expliquez ce qu'est un certificat de révocation ?


Un certificat de révocation permet de révoquer une clef. Imaginons que la
machine prenne feu, il faut pouvoir dire que nous n'avons plus accès à la clef.

Il faut conserver le certificat dans un endroit sûr.

## Gestion de son trousseau de clefs

### Exercice 4 (Distribution de clefs)

#### Détailler `man in the middle`

Les clefs pourraient être des fausses clefs mise en place par quelqu'un au
centre du réseau.

#### Quel est le lien entre l'identifiant de la clef et le _fingerprint_ ?

L'identifiant de la clef est la fin du _fingerprint_. Cela permet de vérifier
l'intégrité de la clef.

## GPG et messagerie

### Exercice 7 (Messagerie)

#### Pouvez vous déchiffrer les documents que vous envoyez ?

Oui, fort heureusement, comme je dispose des clefs nécessaire, je peux
déchiffrer les messages que j'envoi.

#### Ceux que vous recevez ?

Cela dépend. Si je dispose de la clef publique de la personne qui m'envoie le
message, alors je peux déchiffrer ce message, sinon il m'est impossible de voir
le contenu du message.

#### De qui proviennent-ils ?

Ils proviennent des camarades de la promotion. Pour certains, j'en suis sûr
car j'ai leurs clefs. Pour d'autres, c'est à voir, il faudrait que je vérifie
et qu'ensuite je signe leurs clefs histoire d'être sûr pour la suite.

#### Quel est le chiffrement utilisé ? Quelle est la clef de signature ?

Le message est signé avec ma clef privée. Le destinataire se servira de ma clef
publique pour vérifier l'authenticité de l'expéditeur.
