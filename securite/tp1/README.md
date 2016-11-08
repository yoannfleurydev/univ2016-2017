# TP1 OpenSSL

## Exercice 1 (Suites chiffrantes de TLS)

### www.google.fr

#### Quel version de TLS est utilisée ?

* **Chrome** : Protocol QUIC
* **Firefox** : TLSv1.2
* **openssl** : TLSv1.2

#### Quels sont les algorithmes cryptographiques utilisés pour protéger la connexion ?

* **Chrome** : AES_128_GCM
* **Firefox** : TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
* **openssl** : ECDHE-RSA-AES128-GCM-SHA256

#### À quelles familles d'algorithmes appartiennent-ils ?

Famille AES et RSA, asymétrique.

#### Quels sont leur objectifs ?

Ce sont des algorithmes de chiffrement asymétrique. Ils permettent de
sécuriser la connexion.

#### Quel est le niveau de sécurité de ces algorithmes ?

Plutôt correct pour l'époque actuelle.

#### Openssl vous indique une erreur (code 20), que signifie-t-elle ?

Aucune erreur n'est apparue.

### cas.univ-rouen.fr

#### Quel version de TLS est utilisée ?

* **Chrome** : TLSv1.2
* **Firefox** : TLSv1.2
* **openssl** : TLSv1.2

#### Quels sont les algorithmes cryptographiques utilisés pour protéger la connexion ?

* **Chrome** : AES_256_GCM
* **Firefox** : TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
* **openssl** : ECDHE-RSA-AES256-GCM-SHA384

#### À quelles familles d'algorithmes appartiennent-ils ?

Famille AES et RSA, asymétrique.

#### Quels sont leur objectifs ?

Ce sont des algorithmes de chiffrement asymétrique. Ils permettent de
sécuriser la connexion.

#### Openssl vous indique une erreur (code 20), que signifie-t-elle ?

Aucune erreur n'est apparue.

### info.isl.ntt.co.jp

#### Quel version de TLS est utilisée ?

* **Chrome** : TLSv1.2
* **Firefox** : TLSv1.2
* **openssl** : TLSv1.2

#### Quels sont les algorithmes cryptographiques utilisés pour protéger la connexion ?

* **Chrome** : AES_256_CBC with HMAC-SHA1
* **Firefox** : TLS_RSA_WITH_AES_256_CBC_SHA
* **openssl** : AES256-SHA256

#### À quelles familles d'algorithmes appartiennent-ils ?

Famille AES et RSA, asymétrique.

#### Quels sont leur objectifs ?

Ce sont des algorithmes de chiffrement asymétrique. Ils permettent de
sécuriser la connexion.

#### Openssl vous indique une erreur (code 20), que signifie-t-elle ?

Aucune erreur n'est apparue.

## Exercice 2 : Vitesse

Trace obtenu :

```
aes-256-cbc rsa2048 rsa4096 dsa2048 ecdsa ecdh
Doing des cbc for 3s on 16 size blocks: 10556833 des cbc's in 3.00s
Doing des cbc for 3s on 64 size blocks: 2732910 des cbc's in 3.00s
Doing des cbc for 3s on 256 size blocks: 686364 des cbc's in 3.00s
Doing des cbc for 3s on 1024 size blocks: 171970 des cbc's in 3.00s
Doing des cbc for 3s on 8192 size blocks: 21475 des cbc's in 3.00s
Doing des ede3 for 3s on 16 size blocks: 4020123 des ede3's in 3.00s
Doing des ede3 for 3s on 64 size blocks: 1014664 des ede3's in 3.00s
Doing des ede3 for 3s on 256 size blocks: 254535 des ede3's in 3.00s
Doing des ede3 for 3s on 1024 size blocks: 63390 des ede3's in 3.00s
Doing des ede3 for 3s on 8192 size blocks: 7916 des ede3's in 3.00s
Doing aes-128 cbc for 3s on 16 size blocks: 19427781 aes-128 cbc's in 3.00s
Doing aes-128 cbc for 3s on 64 size blocks: 5324854 aes-128 cbc's in 3.00s
Doing aes-128 cbc for 3s on 256 size blocks: 1351458 aes-128 cbc's in 3.00s
Doing aes-128 cbc for 3s on 1024 size blocks: 339465 aes-128 cbc's in 3.00s
Doing aes-128 cbc for 3s on 8192 size blocks: 42910 aes-128 cbc's in 3.00s
Doing aes-192 cbc for 3s on 16 size blocks: 16355245 aes-192 cbc's in 3.00s
Doing aes-192 cbc for 3s on 64 size blocks: 4430801 aes-192 cbc's in 3.00s
Doing aes-192 cbc for 3s on 256 size blocks: 1129309 aes-192 cbc's in 3.00s
Doing aes-192 cbc for 3s on 1024 size blocks: 281796 aes-192 cbc's in 3.00s
Doing aes-192 cbc for 3s on 8192 size blocks: 35413 aes-192 cbc's in 3.00s
Doing aes-256 cbc for 3s on 16 size blocks: 14214816 aes-256 cbc's in 3.00s
Doing aes-256 cbc for 3s on 64 size blocks: 3770598 aes-256 cbc's in 3.00s
Doing aes-256 cbc for 3s on 256 size blocks: 963325 aes-256 cbc's in 3.00s
Doing aes-256 cbc for 3s on 1024 size blocks: 241001 aes-256 cbc's in 3.00s
Doing aes-256 cbc for 3s on 8192 size blocks: 30386 aes-256 cbc's in 3.00s
Doing 2048 bit private rsa's for 10s: 12553 2048 bit private RSA's in 10.00s
Doing 2048 bit public rsa's for 10s: 283721 2048 bit public RSA's in 9.99s
Doing 4096 bit private rsa's for 10s: 1169 4096 bit private RSA's in 10.00s
Doing 4096 bit public rsa's for 10s: 78046 4096 bit public RSA's in 10.00s
Doing 2048 bit sign dsa's for 10s: 24031 2048 bit DSA signs in 10.00s
Doing 2048 bit verify dsa's for 10s: 22682 2048 bit DSA verify in 10.00s
Doing 160 bit sign ecdsa's for 10s: 150807 160 bit ECDSA signs in 10.00s
Doing 160 bit verify ecdsa's for 10s: 40816 160 bit ECDSA verify in 10.00s
Doing 192 bit sign ecdsa's for 10s: 128229 192 bit ECDSA signs in 10.00s
Doing 192 bit verify ecdsa's for 10s: 33301 192 bit ECDSA verify in 10.00s
Doing 224 bit sign ecdsa's for 10s: 132476 224 bit ECDSA signs in 10.00s
Doing 224 bit verify ecdsa's for 10s: 62854 224 bit ECDSA verify in 10.00s
Doing 256 bit sign ecdsa's for 10s: 197100 256 bit ECDSA signs in 10.00s
Doing 256 bit verify ecdsa's for 10s: 79270 256 bit ECDSA verify in 10.00s
Doing 384 bit sign ecdsa's for 10s: 41771 384 bit ECDSA signs in 10.00s
Doing 384 bit verify ecdsa's for 10s: 10144 384 bit ECDSA verify in 10.00s
Doing 521 bit sign ecdsa's for 10s: 21860 521 bit ECDSA signs in 10.00s
Doing 521 bit verify ecdsa's for 10s: 11598 521 bit ECDSA verify in 10.00s
Doing 163 bit sign ecdsa's for 10s: 45394 163 bit ECDSA signs in 10.00s
Doing 163 bit verify ecdsa's for 10s: 20097 163 bit ECDSA verify in 10.00s
Doing 233 bit sign ecdsa's for 10s: 24192 233 bit ECDSA signs in 9.99s
Doing 233 bit verify ecdsa's for 10s: 15460 233 bit ECDSA verify in 9.99s
Doing 283 bit sign ecdsa's for 10s: 15641 283 bit ECDSA signs in 10.00s
Doing 283 bit verify ecdsa's for 10s: 8360 283 bit ECDSA verify in 10.00s
Doing 409 bit sign ecdsa's for 10s: 6817 409 bit ECDSA signs in 10.00s
Doing 409 bit verify ecdsa's for 10s: 5184 409 bit ECDSA verify in 10.00s
Doing 571 bit sign ecdsa's for 10s: 3054 571 bit ECDSA signs in 10.00s
Doing 571 bit verify ecdsa's for 10s: 2192 571 bit ECDSA verify in 9.99s
Doing 163 bit sign ecdsa's for 10s: 47833 163 bit ECDSA signs in 10.00s
Doing 163 bit verify ecdsa's for 10s: 18890 163 bit ECDSA verify in 10.00s
Doing 233 bit sign ecdsa's for 10s: 24420 233 bit ECDSA signs in 10.00s
Doing 233 bit verify ecdsa's for 10s: 14664 233 bit ECDSA verify in 9.99s
Doing 283 bit sign ecdsa's for 10s: 15410 283 bit ECDSA signs in 9.99s
Doing 283 bit verify ecdsa's for 10s: 7878 283 bit ECDSA verify in 10.00s
Doing 409 bit sign ecdsa's for 10s: 6777 409 bit ECDSA signs in 9.98s
Doing 409 bit verify ecdsa's for 10s: 4922 409 bit ECDSA verify in 10.00s
Doing 571 bit sign ecdsa's for 10s: 3111 571 bit ECDSA signs in 10.00s
Doing 571 bit verify ecdsa's for 10s: 2005 571 bit ECDSA verify in 10.00s
Doing 160 bit  ecdh's for 10s: 47721 160-bit ECDH ops in 10.00s
Doing 192 bit  ecdh's for 10s: 40234 192-bit ECDH ops in 10.00s
Doing 224 bit  ecdh's for 10s: 93870 224-bit ECDH ops in 10.00s
Doing 256 bit  ecdh's for 10s: 108512 256-bit ECDH ops in 10.00s
Doing 384 bit  ecdh's for 10s: 12188 384-bit ECDH ops in 10.00s
Doing 521 bit  ecdh's for 10s: 17048 521-bit ECDH ops in 10.00s
Doing 163 bit  ecdh's for 10s: 40461 163-bit ECDH ops in 10.00s
Doing 233 bit  ecdh's for 10s: 32114 233-bit ECDH ops in 10.00s
Doing 283 bit  ecdh's for 10s: 17332 283-bit ECDH ops in 10.00s
Doing 409 bit  ecdh's for 10s: 10632 409-bit ECDH ops in 10.00s
Doing 571 bit  ecdh's for 10s: 4318 571-bit ECDH ops in 10.01s
Doing 163 bit  ecdh's for 10s: 39203 163-bit ECDH ops in 10.00s
Doing 233 bit  ecdh's for 10s: 30185 233-bit ECDH ops in 10.00s
Doing 283 bit  ecdh's for 10s: 16249 283-bit ECDH ops in 10.00s
Doing 409 bit  ecdh's for 10s: 10175 409-bit ECDH ops in 10.00s
Doing 571 bit  ecdh's for 10s: 4134 571-bit ECDH ops in 10.00s
OpenSSL 1.0.2g  1 Mar 2016
built on: reproducible build, date unspecified
options:bn(64,64) rc4(16x,int) des(idx,cisc,16,int) aes(partial) blowfish(idx)
compiler: cc -I. -I.. -I../include  -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -m64 -DL_ENDIAN -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -Wl,-Bsymbolic-functions -Wl,-z,relro -Wa,--noexecstack -Wall -DMD32_REG_T=int -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM
The 'numbers' are in 1000s of bytes per second processed.
type             16 bytes     64 bytes    256 bytes   1024 bytes   8192 bytes
des cbc          56303.11k    58302.08k    58569.73k    58699.09k    58641.07k
des ede3         21440.66k    21646.17k    21720.32k    21637.12k    21615.96k
aes-128 cbc     103614.83k   113596.89k   115324.42k   115870.72k   117172.91k
aes-192 cbc      87227.97k    94523.75k    96367.70k    96186.37k    96701.10k
aes-256 cbc      75812.35k    80439.42k    82203.73k    82261.67k    82974.04k
                  sign    verify    sign/s verify/s
rsa 2048 bits 0.000797s 0.000035s   1255.3  28400.5
rsa 4096 bits 0.008554s 0.000128s    116.9   7804.6
                  sign    verify    sign/s verify/s
dsa 2048 bits 0.000416s 0.000441s   2403.1   2268.2
                              sign    verify    sign/s verify/s
 160 bit ecdsa (secp160r1)   0.0001s   0.0002s  15080.7   4081.6
 192 bit ecdsa (nistp192)   0.0001s   0.0003s  12822.9   3330.1
 224 bit ecdsa (nistp224)   0.0001s   0.0002s  13247.6   6285.4
 256 bit ecdsa (nistp256)   0.0001s   0.0001s  19710.0   7927.0
 384 bit ecdsa (nistp384)   0.0002s   0.0010s   4177.1   1014.4
 521 bit ecdsa (nistp521)   0.0005s   0.0009s   2186.0   1159.8
 163 bit ecdsa (nistk163)   0.0002s   0.0005s   4539.4   2009.7
 233 bit ecdsa (nistk233)   0.0004s   0.0006s   2421.6   1547.5
 283 bit ecdsa (nistk283)   0.0006s   0.0012s   1564.1    836.0
 409 bit ecdsa (nistk409)   0.0015s   0.0019s    681.7    518.4
 571 bit ecdsa (nistk571)   0.0033s   0.0046s    305.4    219.4
 163 bit ecdsa (nistb163)   0.0002s   0.0005s   4783.3   1889.0
 233 bit ecdsa (nistb233)   0.0004s   0.0007s   2442.0   1467.9
 283 bit ecdsa (nistb283)   0.0006s   0.0013s   1542.5    787.8
 409 bit ecdsa (nistb409)   0.0015s   0.0020s    679.1    492.2
 571 bit ecdsa (nistb571)   0.0032s   0.0050s    311.1    200.5
                              op      op/s
 160 bit ecdh (secp160r1)   0.0002s   4772.1
 192 bit ecdh (nistp192)   0.0002s   4023.4
 224 bit ecdh (nistp224)   0.0001s   9387.0
 256 bit ecdh (nistp256)   0.0001s  10851.2
 384 bit ecdh (nistp384)   0.0008s   1218.8
 521 bit ecdh (nistp521)   0.0006s   1704.8
 163 bit ecdh (nistk163)   0.0002s   4046.1
 233 bit ecdh (nistk233)   0.0003s   3211.4
 283 bit ecdh (nistk283)   0.0006s   1733.2
 409 bit ecdh (nistk409)   0.0009s   1063.2
 571 bit ecdh (nistk571)   0.0023s    431.4
 163 bit ecdh (nistb163)   0.0003s   3920.3
 233 bit ecdh (nistb233)   0.0003s   3018.5
 283 bit ecdh (nistb283)   0.0006s   1624.9
 409 bit ecdh (nistb409)   0.0010s   1017.5
 571 bit ecdh (nistb571)   0.0024s    413.4
```

### La vitesse des algorithmes symétriques entre eux.

```
type             16 bytes     64 bytes    256 bytes   1024 bytes   8192 bytes
des cbc          56303.11k    58302.08k    58569.73k    58699.09k    58641.07k
des ede3         21440.66k    21646.17k    21720.32k    21637.12k    21615.96k
aes-128 cbc     103614.83k   113596.89k   115324.42k   115870.72k   117172.91k
aes-192 cbc      87227.97k    94523.75k    96367.70k    96186.37k    96701.10k
aes-256 cbc      75812.35k    80439.42k    82203.73k    82261.67k    82974.04k
```

### La vitesse des algorithmes asymétriques entre eux.

```
sign    verify    sign/s verify/s
rsa 2048 bits 0.000797s 0.000035s   1255.3  28400.5
rsa 4096 bits 0.008554s 0.000128s    116.9   7804.6
sign    verify    sign/s verify/s
dsa 2048 bits 0.000416s 0.000441s   2403.1   2268.2
```

### La vitesse des algorithmes asymétriques en signature ou vérification de signature.


### La vitesse des algorithmes asymétriques en fonction de la taille de la clef et du niveau de sécurité.

Plus la taille de la clef est grande, plus le calcul va être long.

### Calculer le rapport entre la vitesse des algos symétriques et asymétriques.



### La vitesse de l’AES en fonction de la taille de clef.
### La vitesse de l’AES si vous utilisez l’EVP : openssl speed -evp aes-128-cbc

## Base 64

```sh
openssl enc -d -base64 -in img_base64.txt -out image.png
```

### Que récupérez vous dans image.png ?

L'image suivante :

![Image en sortie](./image.png)

### Pourquoi la commande ne demande-t-elle pas de mot de passe ?

Car c'est un encodage et pas du chiffrement.

### De quel type de caractères le fichier joint.txt est-il constitué ?

Tous les caractères de la table ASCII.

### Quelle est la taille du fichier décodé par rapport au fichier encodé ?

```
-rw-r--r-- 1 yfleury yfleury 148243 Nov  2 18:01 image.png
-rw-r--r-- 1 yfleury yfleury 200406 Nov  2 17:59 img_base64.txt
```

### Quelle est l’utilité de base64 ?



## Exercice 4 Chiffrement symétrique

### Expliquez chacune des options utilisées dans la commande.

```sh
openssl enc -p -aes128 -a -in clair1.txt -out chiffre1.txt
```

* **openssl** : Commande permettant de chiffrer.
* **enc** : Correspond à `encrypt`.
* **-p** : Permet d'afficher les clefs.
* **-aes128** : Algorithme de chiffrement.
* **-a** : Pour chiffrer en base64.
* **-in** : Pour indiquer le fichier d'entrée.
* **clair1.txt** : Le fichier d'entrée.
* **-out** : Pour indiquer le fichier de sortie.
* **chiffre1.txt** : Le fichier de sortie.

### Pourquoi devez-vous indiquer deux fois le mot de passe ?

Afin de vérifier que c'est bien grâce à ce mot de passe que l'on
souhaite chiffrer.

### Salt, key, iv (initialization vector) ?

* **salt** : grain de sel, permet d'ajouter de l'aléa.
* **key** : permet de chiffrer et déchiffrer le message
* **iv** : permet de démarrer avec quelque-chose

### Relancez la commande, que constatez vous ?

Toutes les variables sont différentes.

## Exercice 5 : Messages chiffrés

```
salt=053CBF1F872484CA
key=9D68254DF9CC40C67A42F99E79F3C596
iv =F0722A1907EA2F523C2390322ECB8666
```
