# Python

## CHAPITRE 1: Introduction
Language de programmation cree en 1989 par Guiod Van Rossum, aux Pays-Bas.
La 1ere version publique a ete publiee en 1991.

Caractéristiques intéressantes :
— Il est multiplateforme. C’est-à-dire qu’il fonctionne sur de nombreux systèmes d’exploitation : Windows, Mac OS X,
Linux, Android, iOS.
— Il est gratuit. Vous pouvez l’installer sur autant d’ordinateurs que vous voulez (même sur votre téléphone !).
— C’est un langage de haut niveau. Il demande relativement peu de connaissance sur le fonctionnement d’un ordinateur
pour être utilisé.
— Il est orienté objet. C’est-à-dire qu’il est possible de concevoir en Python des entités qui miment celles du monde réel (une cellule, une protéine, un atome, etc.) avec un certain nombre de règles de fonctionnement et d’interactions.
— Il est relativement simple à prendre en main.
— Enfin, il est très utilisé en bioinformatique et plus généralement en analyse de données.

Lien de telechargement python: https://www.python.org/downloads/
Lien de telechargement vscode: https://code.visualstudio.com/

Tester python sous le shell: `python`

## Commentaires
Dans un script, tout ce qui suit le caractère # est ignoré par Python jusqu’à la fin de la ligne et est considéré comme un commentaire.
Les commentaires doivent expliquer votre code dans un langage humain.

```
	# Votre premier commentaire en Python .
	print (" Hello world !")
	# D ' autres commandes plus utiles pourraient suivre .
```

## Notion de bloc d’instructions et d’indentation
En programmation, il est courant de répéter un certain nombre de choses ou d’exécuter plusieurs instructions si une condition est vraie, il peut s'agir des boucles, conditions, fonctions,... ce sont les blocs d'instructions.
*Difference entre les blocs d'instruction et les instrcutions:*

- une instruction sert donner un ordre specifique a l'ordinateur, afin de realiser une tache tres simple. Les instructions sont le plus souvent, representees sur une seule ligne dans le code.
- bloc d'instruction: cest un groupe d'instructions, et comme enonce un peu plus tot, ils servent a eviter la repetition du code, executer des iterations ainsi que des conditions

> Les blocs d'instrcutions peuvent etre reutilisees, ou appellees, comme une seule instruction, cest ce que lon appelle fonction en programmtion.


Une identation est un decalage (ou espace laisse expressement vide), suivit d'instruction. Pour indiquer cela, on décalera vers la droite ces deux instructions par rapport à la ligne précédente
(pour chaque base [...]). Ce décalage est appelé indentation, et l’ensemble des lignes indentées constitue un bloc d’instructions.
> Pratiquement, l’indentation en Python doit être homogène (soit des espaces, soit des tabulations, mais pas un mélange des deux). Une indentation avec 4 espaces est le style d’indentation recommande.

---

## CHAPITRE 2: Variables

Une variable est une zone de la mémoire de l’ordinateur dans laquelle une valeur est stockée. Aux yeux du programmeur,
cette variable est définie par un nom, alors que pour l’ordinateur, il s’agit en fait d’une adresse, c’est-à-dire d’une zone particulière de la mémoire.
Pour resumer, une variable est composee de : `valeur`, `nom`, `adresse en memoire`.
`Declarer une variable`: C'est creer une variable, afin que lors de son appel, l'ordinateur puisse savoir de quoi, il s'agit.
`Initialiser une variable`:c'est donner une valeur a une variable, pour la premiere fois.
`Affecter une valeur a une variable`: Il s'agit de donner une valeur a une variable. Si c'est la premiere fois, alors on parle d'initialisation.
En Python, la déclaration d’une variable et son initialisation (c’est-à-dire la première valeur que l’on va stocker dedans) se font en même temps.

Exemple:
```py
x = 2 # la variable x prend la valeur 2 : il s'agit ici d'une opertation d'initialisation et d'affectation.
x = 3 # la variable x prend la valeur 3: il s'agit d'une affectation
```

**Nommage**
Le nom des variables en Python peut être constitué de lettres minuscules (a à z), de lettres majuscules (A à Z), de nombres
(0 à 9) ou du caractère souligné (_). Vous ne pouvez pas utiliser d’espace dans un nom de variable.
Par ailleurs, un nom de variable ne doit pas débuter par un chiffre et il n’est pas recommandé de le faire débuter par le caractère _ (sauf cas très particuliers).
De plus, il faut absolument éviter d’utiliser un mot « réservé » par Python comme nom de variable (par exemple : print, range, for, from, etc.).
Enfin, Python est sensible à la casse, ce qui signifie que les variables TesT, test et TEST sont différentes.
Il faut aussi songer a utiliser de bons noms de variables, cest a dire, utiliser des noms qui sont parlants et significatifs dans le context dans lequel notre programme se trouve.

**Types de variables**
Le type d’une variable correspond à la nature de celle-ci. Les trois principaux types dont nous aurons besoin dans un
premier temps sont les `entiers (integer ou int)`, les `nombres décimaux que nous appellerons floats` et les `chaînes de caractères (string ou str)`. Bien sûr, il existe de nombreux autres types (par exemple, les `booléens`, les `nombres complexes`, etc.)

> Python reconnaît certains types de variable automatiquement (entier, float). Par contre, pour une chaîne de caractères, il faut l’entourer de guillemets (doubles, simples, voire trois guillemets successifs doubles ou simples) afin d’indiquer à Python le début et la fin de la chaîne de caractères. Dans l’interpréteur, l’affichage direct du contenu d’une chaîne de caractères se fait avec des guillemets simples, quel que soit le type de guillemets utilisé pour définir la chaîne de caractères. En Python, comme dans la plupart des langages de programmation, c’est le point qui est utilisé comme séparateur décimal. Ainsi, 3.14 est un nombre reconnu comme un float en Python alors que ce n’est pas le cas de 3,14.

**Opérations**

- Opérations sur les types numériques
Les quatre opérations arithmétiques de base se font de manière simple sur les types numériques (nombres entiers et floats) :
```py
x = 45
print(x + 2) # affiche 47
print(x - 2) # affiche 43
print(x * 3) # affiche 135
y = 2.5
print(x - y) # affiche 42.5
print ( ( x * 10) + y) # affiche 452.5
```

> Remarquez toutefois que si vous mélangez les types entiers et floats, le résultat est renvoyé comme un float (car ce type est plus général). Par ailleurs, l’utilisation de parenthèses permet de gérer les priorités.

L’opérateur / effectue une division. Contrairement aux opérateurs +, - et *, celui-ci renvoie systématiquement un float :
```py
print (3 / 4) # affiche 0.75
print ( 2.5 / 2 ) # affiche 1.25
```

L’opérateur puissance utilise les symboles ** :
```py
print( 2**3 ) # affiche 8
print ( 2**4 )# affiche 16
```

Pour obtenir le quotient et le reste d’une division entière, on utilise respectivement les symboles // et modulo % :
```py
print ( 5 // 4 ) # affiche 1
print ( 5 % 4 ) # affiche 1
print ( 8 // 4 ) # affiche 2
print ( 8 % 4 ) # affiche 0
```

Les symboles `+`, `-`, `*`, `/`, `**`, `//` et `%` sont appelés opérateurs, car ils réalisent des opérations sur les variables.
Enfin, il existe des opérateurs « combinés » qui effectue une opération et une affectation en une seule étape :
```py
i = 0
i = i + 1
print (i) # affiche 1
i += 1
print (i) # affiche 2
i += 2
print (i) # affiche 4
```

L’opérateur `+=` effectue une addition puis affecte le résultat à la même variable. Cette opération s’appelle une «`incrémentation` ».
Les opérateurs `-=`, `*=` et `/=` se comportent de manière similaire pour la soustraction, la multiplication et la division.

- Opérations sur les chaînes de caractères
Pour les chaînes de caractères, deux opérations sont possibles, l’addition et la multiplication :
```py
chaine = " Salut "
print( chaine ) # affiche ' Salut '
print (chaine + " Python ") # affiche' Salut Python '
print(chaine * 3) # affiche ' SalutSalutSalut '
```

L’opérateur d’addition + concatène (assemble) deux chaînes de caractères.
L’opérateur de multiplication * entre un nombre entier et une chaîne de caractères duplique (répète) plusieurs fois une chaîne de caractères.

**Attention**

> Vous observez que les opérateurs + et * se comportent différemment s’il s’agit d’entiers ou de chaînes de caractères : 2+ 2 est une addition alors que "2" + "2" est une concaténation. On appelle ce comportement redéfinition des opérateurs.

**Opérations illicites**

Attention à ne pas faire d’opération illicite car vous obtiendriez un message d’erreur :
```py
print( " toto " * 1.3 ) 

"""
interromp et affiche: Traceback ( most recent call last ): File " < stdin >" , line 1 , in < module >
TypeError : can ' t multiply sequence by non - int of type ' float ' " toto " + 2
#Traceback ( most recent call last ):
File " < stdin >" , line 1 , in < module >
TypeError : can only concatenate str ( not " int ") to str
"""
```

Notez que Python vous donne des informations dans son message d’erreur. Dans le second exemple, il indique que vous devez utiliser une variable de type str c’est-à-dire une chaîne de caractères et pas un int, c’est-à-dire un entier.

**La fonction type()**
Si vous ne vous souvenez plus du type d’une variable, utilisez la fonction type() qui vous le rappellera.
```py
x = 2
type ( x ) # affiche < class 'int ' >
y = 2.0
type ( y ) # affiche < class ' float ' >
z = '2 ' 
type ( z ) # affiche< class 'str ' >
```

> Nous verrons plus tard ce que signifie le mot class.

*Attention*

Pour Python, la valeur 2 (nombre entier) est différente de 2.0 (float) et est aussi différente de '2' (chaîne de caractères).


**Conversion de types**

En programmation, on est souvent amené à convertir les types, c’est-à-dire passer d’un type numérique à une chaîne
de caractères ou vice-versa. En Python, rien de plus simple avec les fonctions int(), float() et str(). Pour vous en
convaincre, regardez ces exemples :

```py
i = 3 # i est du type int
i = str ( i ) # i est maintenant du type string
#autre cas
i = '456 ' # i est du type string
i = int ( i ) # i devient maintenant int
#autre cas
i = float ( i ) # i est maintenant un nombre decimal
#autre cas
i = '3.1416 ' # i est du type string
i = float ( i ) # est maintenant un decimal
```

**Exercices**

*Nombres de Friedman*
Les nombres de Friedman sont des nombres qui peuvent s’exprimer avec tous leurs chiffres dans une expression mathématique.
Par exemple, 347 est un nombre de Friedman car il peut s’écrire sous la forme 4 + 7^3 . De même pour 127 qui peut s’écire sous la forme 2^7 − 1.
Déterminez si les expressions suivantes correspondent à des nombres de Friedman. Pour cela, vous les écrirez en Python
puis exécuterez le code correspondant.
— 7 + 3^6
— (3 + 4)^3
— 3^6 − 5
— (1 + 2^8 ) × 5
— (2 + 1^8 ) 7

*Prédire le résultat : opérations*
Essayez de prédire le résultat de chacune des instructions suivantes, puis vérifiez-le dans l’interpréteur Python :
— (1+2)**3
— "Da" * 4
— "Da" + 3
— ("Pa"+"La") * 2
— ("Da"*4) / 2
— 5 / 2
— 5 // 2
— 5 % 2

*Prédire le résultat : opérations et conversions de types*
Essayez de prédire le résultat de chacune des instructions suivantes, puis vérifiez-le dans l’interpréteur Python :
— str(4) * int("3")
— int("3") + float("3.2")
— str(3) * float("3.2")
— str(3/4) * 2

---

## Chapitre 3: Affichage

**La fonction print()**
C'est la fonction a utiliser quand on souhaite afficher un message dans la console.
Exemple:
```py
print("Hello World")

print("I am glad to learn python")

print(2*3)

x = 3.14
print(x)
```

**Écriture formatée**

L’écriture formatée est un mécanisme permettant d’afficher des variables avec un certain format, par exemple justifiées
à gauche ou à droite, ou encore avec un certain nombre de décimales pour les floats.

Prise en main des f-strings
Les f-strings permettent une meilleure organisation de l’affichage des variables. Reprenons l’exemple ci-dessus à propos
de notre ami John :
```py
x = 32
nom = " John "
print ( f "{ nom } a { x } ans ")
John a 32 ans
```

Il suffit de passer un nom de variable au sein de chaque couple d’accolades et Python les remplace par leur contenu !
Première remarque, la syntaxe apparait plus lisible que l’équivalent vu ci-avant print(nom, "a", x, "ans"). Bien sûr, il
ne faut pas omettre le f avant le premier guillemet, sinon Python prendra cela pour une chaîne de caractères normale et ne
mettra pas en place ce mécanisme de remplacement :
```
print ("{ nom } a { x } ans ")
{ nom } a { x } ans
```

Remarque
Une variable est utilisable plus d’une fois pour une f-string donnée :
```py
var = " to "
print ( f "{ var } et { var } font { var }{ var }")
#to et to font toto
```

Enfin, il est possible de mettre entre les accolades des valeurs numériques ou des chaînes de caractères :
```py
print ( f "J ' affiche l ' entier {10} et le float {3.14}")
#J ' affiche l ' entier 10 et le float 3.14
print ( f "J ' affiche la chaine { ' Python '}")
#J ' affiche la chaine Python
```

**La methode format**
La méthode .format() a apporté une nette amélioration pour mettre en place l’écriture formatée. Celle-ci fonctionne de la manière suivante :
```py
x = 32
nom = " John "
print ("{} a {} ans ". format ( nom , x ))
```

---
Chapitre 4: List

Une liste est une structure de données qui contient une série de valeurs. Python autorise la construction de liste contenant des valeurs de types différents (par exemple entier et chaîne de caractères), ce qui leur confère une grande flexibilité. Une liste est déclarée par une série de valeurs (n’oubliez pas les guillemets, simples ou doubles, s’il s’agit de chaînes de caractères)
séparées par des virgules, et le tout encadré par des crochets. En voici quelques exemples :
```
animaux = [" girafe " , " tigre " , " singe " , " souris "]
tailles = [5 , 2.5 , 1.75 , 0.15]
mixte = [" girafe " , 5 , " souris " , 0.15]
print (animaux)
#[ ' girafe ' , ' tigre ' , ' singe ' , ' souris ']
print(tailles)
#[5 , 2.5 , 1.75 , 0.15]
print(mixte)
#[ ' girafe ' , 5 , ' souris ' , 0.15]
```
Lorsque l’on affiche une liste, Python la restitue telle qu’elle a été saisie.

**Utilisation**

Un des gros avantages d’une liste est que vous pouvez appeler ses éléments par leur position. Ce numéro est appelé indice (ou index) de la liste.

liste : [" girafe " , " tigre " , " singe " , " souris "]
indice :[	0				1			2				3 ]

Soyez très attentif au fait que les indices d’une liste de n éléments commencent à 0 et se terminent à n-1. Voyez l’exemple
suivant :
```
animaux = [" girafe " , " tigre " , " singe " , " souris "]
animaux [0]
' girafe '
print(animaux [1]) # affiche' tigre '
print(animaux [3]) # affiche ' souris '
"""
```

Par conséquent, si on appelle l’élément d’indice 4 de notre liste, Python renverra un message d’erreur :
```
animaux [4]
"""
Traceback ( innermost last ):
File " < stdin >" , line 1 , in ?
IndexError : list index out of range
"""
```
N’oubliez pas ceci ou vous risquez d’obtenir des bugs inattendus !

**Opération sur les listes**
Tout comme les chaînes de caractères, les listes supportent l’opérateur + de concaténation, ainsi que l’opérateur * pour la duplication :
```
ani1 = [" girafe " , " tigre "]
ani2 = [" singe " , " souris "]
print(ani1 + ani2)
#[" girafe " , " tigre ", " singe " , " souris "]
print(ani1 * 3)
[" girafe " , " tigre ", " girafe " , " tigre ", " girafe " , " tigre "]
```

L’opérateur + est très pratique pour concaténer deux listes.
Vous pouvez aussi utiliser la méthode .append() lorsque vous souhaitez ajouter un seul élément à la fin d’une liste.
Dans l’exemple suivant nous allons créer une liste vide :
```
a = []
print(a)
#[]
```
puis lui ajouter deux éléments, l’un après l’autre, d’abord avec la concaténation :
```
a = a + [15]
print(a)
#[15]
a = a + [ -5]
print(a)
#[15 , -5]
```

puis avec la méthode .append() :
```
a.append(13)
print(a)
#[15 , -5 , 13]
a.append ( -3)
print(a)
#[15 , -5 , 13 , -3]
```

Dans l’exemple ci-dessus, nous ajoutons des éléments à une liste en utilisant l’opérateur de concaténation + ou la méthode `.append()`. Nous vous conseillons dans ce cas précis d’utiliser la méthode .append() dont la syntaxe est plus élégante.
Nous reverrons en détail la méthode .append() dans le chapitre 11 Plus sur les listes.

**Indiçage négatif**
La liste peut également être indexée avec des nombres négatifs selon le modèle suivant :

liste: 		[" girafe " , " tigre " , " singe " , " souris "]
indice positif : [0, 		1,			2,				3]
indice négatif : [-4,		-3, 		-2, 			-1] 

ou encore :

liste : [" A " , " B " , " C " , " D " , " E " , " F "]
indice positif : [0, 1, 2, 3, 4, 5]
indice n é gatif : -6,-5,-4,-3,-2,-1]

Les indices négatifs reviennent à compter à partir de la fin. Leur principal avantage est que vous pouvez accéder au dernier élément d’une liste à l’aide de l’indice -1 sans pour autant connaître la longueur de cette liste. L’avant-dernier élément a lui l’indice -2, l’avant-avant dernier l’indice -3, etc.
```py
animaux = [" girafe " , " tigre " , " singe " , " souris "]
print(animaux[ -1]) # affiche ' souris '
print(animaux[ -2]) # affiche' singe '
```

Pour accéder au premier élément de la liste avec un indice négatif, il faut par contre connaître le bon indice :
```py
print(animaux [ -4]) # affiche' girafe '
```
Dans ce cas, on utilise plutôt animaux[0].

**Tranches**
Un autre avantage des listes est la possibilité de sélectionner une partie d’une liste en utilisant un indiçage construit sur le
modèle [m:n+1] pour récupérer tous les éléments, du émième au énième (de l’élément m inclus à l’élément n+1 exclu). On
dit alors qu’on récupère une tranche de la liste, par exemple :
```py
animaux = [" girafe " , " tigre " , " singe " , " souris "]
print(animaux [0:2]) # affiche [ ' girafe ' , ' tigre ']
print(animaux [0:3]) # affiche [ ' girafe ' , ' tigre ' , ' singe ']
print(animaux [0:]) # affiche [ ' girafe ' , ' tigre ' , ' singe ' , ' souris ']
print(animaux [:]) # affiche [ ' girafe ' , ' tigre ' , ' singe ' , ' souris ']
print(animaux [1:]) # [ ' tigre ' , ' singe ' , ' souris ']
print(animaux [1: -1]) # affiche [ ' tigre ' , ' singe ']
```

Notez que lorsqu’aucun indice n’est indiqué à gauche ou à droite du symbole deux-points, Python prend par défaut tous
les éléments depuis le début ou tous les éléments jusqu’à la fin respectivement.
On peut aussi préciser le pas en ajoutant un symbole deux-points supplémentaire et en indiquant le pas par un entier.
```py
animaux = [" girafe " , " tigre " , " singe " , " souris "]
print(animaux [0:3:2]) # [ ' girafe ' , ' singe ']
x = [0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9]
print(x) # [0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9]
print(x) [::1] # [0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9]
print(x) [::2] # [0 , 2 , 4 , 6 , 8]
print(x) [::3] # [0 , 3 , 6 , 9]
print(x [1:6:3]) # [1 , 4]
```
Finalement, on se rend compte que l’accès au contenu d’une liste fonctionne sur le modèle liste[début:fin:pas].

4.6
Fonction len()
L’instruction len() vous permet de connaître la longueur d’une liste, c’est-à-dire le nombre d’éléments que contient la
liste. Voici un exemple d’utilisation :
```py
animaux = [" girafe " , " tigre " , " singe " , " souris "]
len ( animaux ) # 4
len ([1 , 2 , 3 , 4 , 5 , 6 , 7 , 8]) # 8
```

**Les fonctions range() et list()**
L’instruction range() est une fonction spéciale en Python qui génère des nombres entiers compris dans un intervalle.
Lorsqu’elle est utilisée en combinaison avec la fonction list(), on obtient une liste d’entiers. Par exemple :
```py
list ( range (10)) # [0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9]
```

La commande list(range(10)) a généré une liste contenant tous les nombres entiers de 0 inclus à 10 exclu. Nous
verrons l’utilisation de la fonction range() toute seule dans le chapitre 5 Boucles et comparaisons.
Dans l’exemple ci-dessus, la fonction range() a pris un argument, mais elle peut également prendre deux ou trois arguments, voyez plutôt :
```py
list ( range (0 , 5)) # [0 , 1 , 2 , 3 , 4]
list ( range (15 , 20)) # [15 , 16 , 17 , 18 , 19]
list ( range (0 , 1000 , 200)) # [0 , 200 , 400 , 600 , 800]
list ( range (2 , -2 , -1)) # [2 , 1 , 0 , -1]
```

L’instruction range() fonctionne sur le modèle range([début,] fin[, pas]). Les arguments entre crochets sont optionnels. Pour obtenir une liste de nombres entiers, il faut l’utiliser systématiquement avec la fonction list().
Enfin, prenez garde aux arguments optionnels par défaut (0 pour début et 1 pour pas) :
```py
list ( range (10 ,0)) # []
```

Ici la liste est vide car Python a pris la valeur du pas par défaut qui est de 1. Ainsi, si on commence à 10 et qu’on avance par pas de 1, on ne pourra jamais atteindre 0. Python génère ainsi une liste vide. Pour éviter ça, il faudrait, par exemple, préciser
un pas de -1 pour obtenir une liste d’entiers décroissants :
```py
list ( range (10 ,0 , -1)) # [10 , 9 , 8 , 7 , 6 , 5 , 4 , 3 , 2 , 1]
```
Listes de listes
Pour finir, sachez qu’il est tout à fait possible de construire des listes de listes. Cette fonctionnalité peut parfois être très pratique. Par exemple :
```py
enclos1 = [" girafe " , 4]
enclos2 = [" tigre " , 2]
enclos3 = [" singe " , 5]
zoo = [ enclos1 , enclos2 , enclos3 ]
print(zoo) # [[ ' girafe ' , 4] , [ ' tigre ' , 2] , [ ' singe ' , 5]]
```

Dans cet exemple, chaque sous-liste contient une catégorie d’animal et le nombre d’animaux pour chaque catégorie.
Pour accéder à un élément de la liste, on utilise l’indiçage habituel :
```py
print(zoo [1]) # [ ' tigre ' , 2]
```

Pour accéder à un élément de la sous-liste, on utilise un double indiçage :
```py
print (zoo [1][0] )# ' tigre '
print( zoo [1][1] )# 2
```

On verra un peu plus loin qu’il existe en Python des dictionnaires qui sont également très pratiques pour stocker de l’information structurée. On verra aussi qu’il existe un module nommé NumPy qui permet de créer des listes ou des tableaux de nombres (vecteurs et matrices) et de les manipuler.

**Minimum, maximum et somme d’une liste**

Les fonctions min(), max() et sum() renvoient respectivement le minimum, le maximum et la somme d’une liste passée
en argument.
```py
liste = [0 ,1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9]
liste = list ( range (10))
sum ( liste ) # 45
min ( liste ) # 0
max ( liste ) # 9
```

Même si en théorie ces fonctions peuvent prendre en argument une liste de strings, on les utilisera la plupart du temps avec des types numériques (liste d’entiers et / ou de floats).
Nous avions déjà croisé min(), max() dans le chapitre 2 Variables. On avait vu que ces deux fonctions pouvaient prendre
plusieurs arguments entiers et / ou floats, par exemple :
```py
print(min (3 , 4)) # 3
```

Attention toutefois à ne pas mélanger entiers et floats d’une part avec une liste d’autre part, car cela renvoie une erreur :
```py
min ( liste , 3 , 4)
"""Traceback ( most recent call last ):
File " < stdin >" , line 1 , in < module >
TypeError : '<' not supported between instances of 'int ' and ' list '
"""
```

Soit on passe plusieurs entiers et / ou floats en argument, soit on passe une liste unique.

**Exercices**

*Jours de la semaine*
Constituez une liste semaine contenant les 7 jours de la semaine.
		1. À partir de cette liste, comment récupérez-vous seulement les 5 premiers jours de la semaine d’une part, et ceux du
week-end d’autre part ? Utilisez pour cela l’indiçage.
		2. Cherchez un autre moyen pour arriver au même résultat (en utilisant un autre indiçage).
		3. Trouvez deux manières pour accéder au dernier jour de la semaine.
		4. Inversez les jours de la semaine en une commande.


*Saisons*
Créez 4 listes hiver, printemps, ete et automne contenant les mois correspondants à ces saisons. Créez ensuite une
liste saisons contenant les listes hiver, printemps, ete et automne. Prévoyez ce que renvoient les instructions suivantes,
puis vérifiez-le dans l’interpréteur :
		1. saisons[2]
		2. saisons[1][0]
		3. saisons[1:2]
		4. saisons[:][1]. 
Comment expliquez-vous ce dernier résultat ?

*Table de multiplication par 9*

Affichez la table de multiplication par 9 en une seule commande avec les instructions range() et list().

*Nombres pairs*
Répondez à la question suivante en une seule commande. Combien y a-t-il de nombres pairs dans l’intervalle [2, 10000] inclus.

---
## Chapitre 5: Boucles et comparaisons

**Boucles for**
Principe
En programmation, on est souvent amené à répéter plusieurs fois une instruction. Incontournables à tout langage de pro-
grammation, les boucles vont nous aider à réaliser cette tâche répétitive de manière compacte et efficace.
Imaginez par exemple que vous souhaitiez afficher les éléments d’une liste les uns après les autres. Dans l’état actuel de
vos connaissances, il faudrait taper quelque chose du style :

```py
animaux = [" girafe " , " tigre " , " singe " , " souris "]
print ( animaux [0])
print ( animaux [1])
print ( animaux [2])
print ( animaux [3])
```

Si votre liste ne contient que 4 éléments, ceci est encore faisable mais imaginez qu’elle en contienne 100 voire 1000 ! Pour remédier à cela, il faut utiliser les boucles. Regardez l’exemple suivant :
```py
animaux = [" girafe " , " tigre " , " singe " , " souris "]
for animal in animaux :
	print ( animal )
"""
girafe
tigre
singe
souris
...
"""
```

> Remarque: 
Outre une meilleure lisibilité, les deux-points et l’indentation sont formellement requis en Python. Même si on peut indenter comme on veut (plusieurs espaces ou plusieurs tabulations, mais pas une combinaison des deux).

**Fonction range()**
Python possède la fonction range() que nous avons rencontrée précédemment dans le chapitre 4 sur les Listes et qui est
aussi bien commode pour faire une boucle sur une liste d’entiers de manière automatique :
```py
for i in range (4):
	print ( i )
"""
0
1
2
3
"""
```

Dans cet exemple, nous pouvons faire plusieurs remarques importantes :
Contrairement à la création de liste avec list(range(4)), la fonction range() peut être utilisée telle quelle dans une
boucle. Il n’est pas nécessaire de taper for i in list(range(4)): même si cela fonctionnerait également.
Comment cela est-ce possible ? Et bien range() est une fonction qui a été spécialement conçue pour cela 1 , c’est-à-dire que l’on peut itérer directement dessus. Pour Python, il s’agit d’un nouveau type, par exemple dans l’instruction x =
range(3) la variable x est de type range (tout comme on avait les types int, float, str ou list) à utiliser spécialement avec les
boucles.
L’instruction `list(range(4))` se contente de transformer un objet de type range en un objet de type list. Si vous vous
souvenez bien, il s’agit d’une fonction de casting, qui convertit un type en un autre (voir chapitre 2 Variables). Il n’y aucun intérêt à utiliser dans une boucle la construction for i in list(range(4)):. C’est même contre-productif. En effet, range() se contente de stocker l’entier actuel, le pas pour passer à l’entier suivant, et le dernier entier à parcourir, ce qui revient à stocker seulement 3 nombres entiers et ce quelle que soit la longueur de la séquence, même avec un range(1000000).
Si on utilisait list(range(1000000)), Python construirait d’abord une liste de 1 million d’éléments dans la mémoire puis itérerait dessus, d’où une énorme perte de temps !

**Nommage de la variable d’itération**
Dans l’exemple précédent, nous avons choisi le nom i pour la variable d’itération. Ceci est une habitude en informatique et indique en général qu’il s’agit d’un entier (le nom i vient sans doute du mot indice ou index en anglais). Nous vous conseillons de suivre cette convention afin d’éviter les confusions, si vous itérez sur les indices vous pouvez appeler la variable d’itérationi (par exemple dans for i in range(4):).
Si, par contre, vous itérez sur une liste comportant des chaînes de caractères, utilisez un nom explicite pour la variable d’itération. Par exemple :
for prenom in ["Joe", "Bill", "John"]:
ou
for proportion in [0.12, 0.53, 0.07, 0.28]:

**Itération sur les indices ou les éléments**
Revenons à notre liste animaux. Nous allons maintenant parcourir cette liste, mais cette fois par une itération sur ses
indices :
```py
animaux = [" girafe " , " tigre " , " singe " , " souris "]
for i in range (4):
	print ( animaux [ i ])
"""
girafe
tigre
singe
souris
"""
```
La variable i prendra les valeurs successives 0, 1, 2 et 3 et on accèdera à chaque élément de la liste animaux par son
indice (i.e. animaux[i]). Notez à nouveau le nom i de la variable d’itération car on itère sur les indices.
Quand utiliser l’une ou l’autre des 2 méthodes ? La plus efficace est celle qui réalise les itérations directement sur les éléments :

```py
animaux = [" girafe " , " tigre " , " singe " , " souris "]
for animal in animaux :
	print ( animal )
"""
girafe
tigre
singe
souris
"""
```

Toutefois, il se peut qu’au cours d’une boucle vous ayez besoin des indices, auquel cas vous devrez itérer sur les indices :
```py
animaux = [" girafe " , " tigre " , " singe " , " souris "]
for i in range ( len ( animaux )):
	print ( f "L ' animal { i } est un ( e ){ animaux[ i ]}")
"""
L ' animal 0 est un ( e ) girafe
L ' animal 1 est un ( e ) tigre
L ' animal 2 est un ( e ) singe
L ' animal 3 est un ( e ) souris
"""
```

Python possède toutefois la fonction enumerate() qui vous permet d’itérer sur les indices et les éléments eux-mêmes.
```py
animaux = [" girafe " , " tigre " , " singe " , " souris "]
for i , animal in enumerate ( animaux ):
	print ( f "L ' animal { i } est un ( e ) { animal }")

"""
L' animal 0 est un(e) girafe
L' animal 1 est un(e) tigre
L' animal 2 est un(e) singe
L' animal 3 est un(e) souris
"""
```

**Comparaisons**
Avant de passer à une autre sorte de boucles (les boucles while), nous abordons tout de suite les comparaisons. Celles-ci
seront reprises dans le chapitre 6 sur les Tests.
Python est capable d’effectuer toute une série de comparaisons entre le contenu de deux variables, telles que :
|Syntaxe Python|Signification|
|-------------:|------------:|
|==|égal à|
|!=|différent de|
|>|strictement supérieur à|
|>=|supérieur ou égal à|
|<|strictement inférieur à|
|<=|inférieur ou égal à|

Observez les exemples suivants avec des nombres entiers.
```py
x = 5
print( x == 5 ) # True
print( x > 10 ) # False
print( x < 10 ) # True
```

> Faites bien attention à ne pas confondre l’opérateur d’affectation = qui affecte une valeur à une variable et l’opérateur de comparaison == qui compare les valeurs de deux variables.

**Boucles while**
Une alternative à l’instruction for couramment utilisée en informatique est la boucle while. Avec ce type de boucle, une série d’instructions est exécutée tant qu’une condition est vraie. Par exemple :
```py
i = 1
while i <= 4:
	print ( i )
	i = i + 1
"""
1
2
3
4
"""
```

Remarquez qu’il est encore une fois nécessaire d’indenter le bloc d’instructions correspondant au corps de la boucle (ici,
les instructions lignes 3 et 4).
Une boucle while nécessite généralement trois éléments pour fonctionner correctement :
1. Initialisation de la variable d’itération avant la boucle (ligne 1).
2. Test de la variable d’itération associée à l’instruction while (ligne 2).
3. Mise à jour de la variable d’itération dans le corps de la boucle (ligne 4).
Faites bien attention aux tests et à l’incrémentation que vous utilisez car une erreur mène souvent à des « boucles infinies
» qui ne s’arrêtent jamais. Vous pouvez néanmoins toujours stopper l’exécution d’un script Python à l’aide de la combinaison
de touches Ctrl-C (c’est-à-dire en pressant simultanément les touches Ctrl et C). Par exemple :
```py
i = 0
while i < 10:
	print (" Le python c ' est cool !")
```

Ici, nous avons omis de mettre à jour la variable i dans le corps de la boucle. Par conséquent, la boucle ne s’arrêtera jamais (sauf en pressant Ctrl-C) puisque la condition i < 10 sera toujours vraie.
La boucle while combinée à la fonction input() peut s’avérer commode lorsqu’on souhaite demander à l’utilisateur une
valeur numérique. Par exemple :
```py
i = 0
while i < 10:
	reponse = input (" Entrez un entier sup é rieur à 10 : ")
	i = int ( reponse )
"""
Entrez un entier supérieur à 10
Entrez un entier supérieur à 10
Entrez un entier supérieur à 10
"""
```
La fonction `input()` prend en argument un message (sous la forme d’une chaîne de caractères), demande à l’utilisateur
d’entrer une valeur et renvoie celle-ci sous forme d’une chaîne de caractères. Il faut ensuite convertir cette dernière en entier (avec la fonction int() ligne 4).

**Exercices**

_Boucles de base_
Soit la liste ["vache", "souris", "levure", "bacterie"]. Affichez l’ensemble des éléments de cette liste (un
élément par ligne) de trois façons différentes (deux méthodes avec for et une avec while).

_Boucle et jours de la semaine_
Constituez une liste semaine contenant les 7 jours de la semaine.
Écrivez une série d’instructions affichant les jours de la semaine (en utilisant une boucle for), ainsi qu’une autre série d’instructions affichant les jours du week-end (en utilisant une boucle while).

_Nombres de 1 à 10 sur une ligne_
Avec une boucle, affichez les nombres de 1 à 10 sur une seule ligne.
Conseil : n’hésitez pas à relire le début du chapitre 3 Affichage qui discute de la fonction print().

_Nombres pairs et impairs_
Soit impairs la liste de nombres [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21]. Écrivez un programme qui, à partir
de la liste impairs, construit une liste pairs dans laquelle tous les éléments de impairs sont incrémentés de 1.

_Calcul de la moyenne_
Voici les notes d’un étudiant [14, 9, 6, 8, 12]. Calculez la moyenne de ces notes. Utilisez l’écriture formatée pour
afficher la valeur de la moyenne avec deux décimales.

_Produit de nombres consécutifs_
Avez les fonctions list() et range(), créez la liste entiers contenant les nombres entiers pairs de 2 à 20 inclus.
Calculez ensuite le produit des nombres consécutifs deux à deux de entiers en utilisant une boucle. Exemple pour les
premières itérations :

```py
8
24
48
[...]
```

_Triangle_
Créez un script qui dessine un triangle comme celui-ci :
```
*
**
***
****
*****
******
*******
********
*********
**********
```

Triangle inversé
Créez un script qui dessine un triangle comme celui-ci :
```
**********
*********
********
*******
******
*****
****
***
**
*
```

_Triangle gauche_
Créez un script qui dessine un triangle comme celui-ci :
```
         *
	    **
       ***
      ****
     *****
    ******
   *******
  ********
 *********
**********
```

_Pyramide_
Créez un script pyra.py qui dessine une pyramide comme celle-ci :
```
         *
        ***
       *****
      *******
     *********
    ***********
   *************
  ***************
 *****************
*******************
```
Essayez de faire évoluer votre script pour dessiner la pyramide à partir d’un nombre arbitraire de lignes N. Vous pourrez
demander à l’utilisateur le nombre de lignes de la pyramide avec les instructions suivantes qui utilisent la fonction input() :
```py
reponse = input (" Entrez un nombre de lignes ( entier positif ): ")
N = int ( reponse )
```

_Parcours de matrice_
Imaginons que l’on souhaite parcourir tous les éléments d’une matrice carrée, c’est-à-dire d’une matrice qui est constituée
d’autant de lignes que de colonnes.
Créez un script qui parcourt chaque élément de la matrice et qui affiche le numéro de ligne et de colonne uniquement avec
des boucles for.
Pour une matrice de dimensions 2 × 2, le schéma de la figure vous indique comment parcourir une telle matrice.
L’affichage attendu est :

```
ligne colonne
1		1
1		2
2		1
2		2
```
Attention à bien respecter l’alignement des chiffres qui doit être justifié à droite sur 4 caractères. Testez avec une matrice de dimensions 3 × 3, puis 5 × 5, et enfin 10 × 10.
Créez une seconde version de votre script, cette fois-ci avec deux boucles while.

**Parcours de demi-matrice sans la diagonale (exercice ++)**
En se basant sur le script précédent, on souhaite réaliser le parcours d’une demi-matrice carrée sans la diagonale. On peut
noter que cela produit tous les couples possibles une seule fois (1 et 2 est équivalent à 2 et 1), en excluant par ailleurs chaque
élément avec lui même (1 et 1, 2 et 2, etc). Pour mieux comprendre ce qui est demandé, la figure 5.2 indique les cases à parcourir en gris :
Créez un script qui affiche le numéro de ligne et de colonne, puis la taille de la matrice N × N et le nombre total de cases parcourues. Par exemple pour une matrice 4 × 4 (N=4) :
```
ligne colonne
1		2
1		3
1		4
2		3
2		4
3		4
Pour une matrice 4 x4 , on a parcouru 6 cases
```

Testez votre script avec N=3, puis N=4 et enfin N=5.
Concevez une seconde version à partir du script précédent, où cette fois on n’affiche plus tous les couples possibles mais simplement la valeur de N, et le nombre de cases parcourues. Affichez cela pour des valeurs de N allant de 2 à 10.
Pouvez-vous trouver une formule générale reliant le nombre de cases parcourues à N ?

*Sauts de puce*

On imagine une puce qui se déplace aléatoirement sur une ligne, en avant ou en arrière, par pas de 1 ou -1. Par exemple, si elle est à l’emplacement 0, elle peut sauter à l’emplacement 1 ou -1 ; si elle est à l’emplacement 2, elle peut sauter à l’emplacement 3 ou 1, etc.
Avec une boucle while, simuler le mouvement de cette puce de l’emplacement initial 0 à l’emplacement final 5 (voir le
schéma de la figure 5.3). Combien de sauts sont nécessaires pour réaliser ce parcours ? Relancez plusieurs fois le programme.
Trouvez-vous le même nombre de sauts à chaque exécution ?
Conseil : vous utiliserez l’instruction random.choice([-1,1]) qui renvoie au hasard les valeurs -1 ou 1 avec la même
probabilité. Avant d’utiliser cette instruction vous mettrez au tout début de votre script la ligne `import random`.

_Suite de Fibonacci (exercice +++)_

La suite de Fibonacci 3 est une suite mathématique qui porte le nom de Leonardo Fibonacci, un mathématicien italien
du XIII e siècle. Initialement, cette suite a été conçue pour décrire la croissance d’une population de lapins, mais elle peut également être utilisée pour décrire certains motifs géométriques retrouvés dans la nature (coquillages, fleurs de tournesol. . . ).
Pour la suite de Fibonacci (x n ), le terme au rang n (avec n > 1) est la somme des nombres aux rangs n − 1 et n − 2 :
x~n~ = x~n−1~ + x~n−2~
Par définition, les deux premiers termes sont x 0 = 0 et x 1 = 1.
À titre d’exemple, les 10 premiers termes de la suite de Fibonacci sont donc 0, 1, 1, 2, 3, 5, 8, 13, 21 et 34.
Créez un script qui construit une liste fibo avec les 15 premiers termes de la suite de Fibonacci puis l’affiche.
Améliorez ce script en affichant, pour chaque élément de la liste fibo avec n > 1, le rapport entre l’élément de rang n et l’élément de rang n − 1. Ce rapport tend-il vers une constante ? Si oui, laquelle ?

---

## Chapite 6: Conditions ou Tests
Les tests sont un élément essentiel à tout langage informatique si on veut lui donner un peu de complexité car ils permettent à l’ordinateur de prendre des décisions. Pour cela, Python utilise l’instruction if ainsi qu’une comparaison que nous avons abordée au chapitre précédent. Voici un premier exemple :
```py
x = 2
if x == 2:
	print (" Le test est vrai !")
```

Le test est vrai !
et un second :
```py
x = " souris "
if x == " tigre ":
	print (" Le test est vrai !")
```

Il y a plusieurs remarques à faire concernant ces deux exemples :
— Dans le premier exemple, le test étant vrai, l’instruction print("Le test est vrai !") est exécutée. Dans le
second exemple, le test est faux et rien n’est affiché.
— Les blocs d’instructions dans les tests doivent forcément être indentés comme pour les boucles for et while. L’inden-
tation indique la portée des instructions à exécuter si le test est vrai.
— Comme avec les boucles for et while, la ligne qui contient l’instruction if se termine par le caractère deux-points «
: »

**Tests à plusieurs cas**

Parfois, il est pratique de tester si la condition est vraie ou si elle est fausse dans une même instruction if. Plutôt que d’utiliser deux instructions if, on peut se servir des instructions if et else :
```py
x = 2
if x == 2:
	print (" Le test est vrai !")
else :
	print (" Le test est faux !")
#Le test est vrai !
x = 3
if x == 2:
	print (" Le test est vrai !")
else :
	print (" Le test est faux !")
#Le test est faux !
```

On peut utiliser une série de tests dans la même instruction `if`, notamment pour tester plusieurs valeurs d’une même
variable.
Par exemple, on se propose de tirer au sort une base d’ADN puis d’afficher le nom de cette dernière. Dans le code suivant,
nous utilisons l’instruction random.choice(liste) qui renvoie un élément choisi au hasard dans une liste. L’instruction
import random sera vue plus tard dans le chapitre 8 Modules, admettez pour le moment qu’elle est nécessaire.

```py
import random
base = random . choice ([" a " , " t " , " c " , " g "])
if base == " a ":
	print (" choix d ' une adénine ")
elif base == " t ":
	print (" choix d ' une thymine ")
elif base == " c ":
	print (" choix d ' une cytosine ")
elif base == " g ":
	print (" choix d ' une guanine ")

#choix d ' une cytosine
```

Dans cet exemple, Python teste la première condition, puis, si et seulement si elle est fausse, teste la deuxième et ainsi de suite... Le code correspondant à la première condition vérifiée est exécuté puis Python sort du bloc d’instructions du `if`.

**Importance de l’indentation**

De nouveau, faites bien attention à l’indentation ! Vous devez être très rigoureux sur ce point. Pour vous en convaincre,
exécutez ces deux exemples de code :
*Code 1*
```py
nombres = [4 , 5 , 6]
for nb in nombres :
	if nb == 5:
		print (" Le test est vrai ")
		print ( f " car la variable nb vaut { nb }")
```
Résultat : 
```Le test est vrai car la variable nb vaut 5```

*Code 2*
```py
nombres = [4 , 5 , 6]
for nb in nombres :
	if nb == 5:
		print (" Le test est vrai ")
	print ( f " car la variable nb vaut { nb }")
```
Résultat :
```
car la variable nb vaut 4
Le test est vrai
car la variable nb vaut 5
car la variable nb vaut 6
```
Les deux codes pourtant très similaires produisent des résultats très différents. Si vous observez avec attention l’indentation des instructions sur la ligne 5, vous remarquerez que dans le code 1, l’instruction est indentée deux fois, ce qui signifie qu’elle appartient au bloc d’instructions du test if. Dans le code 2, l’instruction de la ligne 5 n’est indentée qu’une seule fois, ce qui fait qu’elle n’appartient plus au bloc d’instructions du test if, d’où l’affichage de car la variable nb vaut xx pour
toutes les valeurs de nb.

**Tests multiples**

Les tests multiples permettent de tester plusieurs conditions en même temps en utilisant des opérateurs booléens. Les deux opérateurs les plus couramment utilisés sont le OU et le ET. Voici un petit rappel sur le fonctionnement de l’opérateur OU :

|Condition 1|Operateur|Condition 2|Resultat|
|----------:|----------:|----------:|----------:|
|Vrai|Ou|Vrai|Vrai|
|Vrai|Ou|Faux|Vrai|
|Faux|Ou|Vrai|Vrai|
|Faux|Ou|Faux|Faux|

et de l’opérateur ET :

|Condition 1|Operateur|Condition 2|Resultat|
|----------:|----------:|----------:|----------:|
|Vrai|Et|Vrai|Vrai|
|Vrai|Et|Faux|Faux|
|Faux|Et|Vrai|Faux|
|Faux|Et|Faux|Faux|

En Python, on utilise le mot réservé and pour l’opérateur `ET` et le mot réservé or pour l’opérateur `OU`. Respectez bien la casse des opérateurs `and` et `or` qui, en Python, s’écrivent en minuscule. En voici un exemple d’utilisation :
```py
x = 2
y = 2
if x == 2 and y == 2:
	print (" le test est vrai ")

#le test est vrai
```

On peut utiliser l’opérateur logique de négation not qui inverse le résultat d’une condition :
```py
not True
False
not False
#True
not ( True and True )
#False
```

Instructions break et continue
Ces deux instructions permettent de modifier le comportement d’une boucle (for ou while) avec un test.
L’instruction break stoppe la boucle.
```py
for i in range (5):
	if i > 2:
		break
	print ( i )
"""
0
1
2
"""
```

L’instruction continue saute à l’itération suivante, sans exécuter la suite du bloc d’instructions de la boucle.
```py
for i in range (5):
	if i == 2:
		continue
	print ( i )

"""
0
1
3
4
"""
```

**Exercices**

*Jours de la semaine*

Constituez une liste semaine contenant le nom des sept jours de la semaine.
En utilisant une boucle, écrivez chaque jour de la semaine ainsi que les messages suivants :
— `Au travail` s’il s’agit du lundi au vendredi ;
— `Chouette` c'est vendredi s’il s’agit du vendredi ;
— `Repos` ce week-end s’il s’agit du samedi ou du dimanche.
Ces messages ne sont que des suggestions, vous pouvez laisser libre cours à votre imagination.

*Séquence complémentaire d’un brin d’ADN*

La liste ci-dessous représente la séquence d’un brin d’ADN :
["A", "C", "G", "T", "T", "A", "G", "C", "T", "A", "A", "C", "G"]
Créez un script qui transforme cette séquence en sa séquence complémentaire.
Rappel : la séquence complémentaire s’obtient en remplaçant A par T, T par A, C par G et G par C.

*Minimum d’une liste*

La fonction min() de Python renvoie l’élément le plus petit d’une liste constituée de valeurs numériques ou de chaînes de
caractères. Sans utiliser cette fonction, créez un script qui détermine le plus petit élément de la liste [8, 4, 6, 1, 5].

*Fréquence des acides aminés*

La liste ci-dessous représente une séquence d’acides aminés :
["A", "R", "A", "W", "W", "A", "W", "A", "R", "W", "W", "R", "A", "G"]
Calculez la fréquence des acides aminés alanine (A), arginine (R), tryptophane (W) et glycine (G) dans cette séquence.

*Notes et mention d’un étudiant*

Voici les notes d’un étudiant : 14, 9, 13, 15 et 12. Créez un script qui affiche la note maximum (utilisez la fonction max()),la note minimum (utilisez la fonction min()) et qui calcule la moyenne.
Affichez la valeur de la moyenne avec deux décimales. Affichez aussi la mention obtenue sachant que la mention est `passable` si la moyenne est entre 10 inclus et 12 exclus, `assez bien` entre 12 inclus et 14 exclus et `bien` au-delà de 14.

*Nombres pairs*

Construisez une boucle qui parcourt les nombres de 0 à 20 et qui affiche les nombres pairs inférieurs ou égaux à 10 d’une
part, et les nombres impairs strictement supérieurs à 10 d’autre part.
Pour cet exercice, vous pourrez utiliser l’opérateur modulo % qui renvoie le reste de la division entière entre deux nombres et dont voici quelques exemples d’utilisation :
```py
print( 4 % 3 ) # 1
print( 5 % 3 ) # 2
print( 4 % 2 ) # 0
print( 5 % 2 ) # 3
print( 6 % 2 ) # 0
print( 7 % 2 ) # 2
```

Vous remarquerez qu’un nombre est pair lorsque le reste de sa division entière par 2 est nul.

**Conjecture de Syracuse (exercice +++)**

La conjecture de Syracuse 2 est une conjecture mathématique qui reste improuvée à ce jour et qui est définie de la manière suivante.
Soit un entier positif n. Si n est pair, alors le diviser par 2. Si il est impair, alors le multiplier par 3 et lui ajouter 1. En répétant cette procédure, la suite de nombres atteint la valeur 1 puis se prolonge indéfiniment par une suite de trois valeurs triviales appelée cycle trivial.
Jusqu’à présent, la conjecture de Syracuse, selon laquelle depuis n’importe quel entier positif la suite de Syracuse atteint 1, n’a pas été mise en défaut.
Par exemple, les premiers éléments de la suite de Syracuse si on prend comme point de départ 10 sont : 10, 5, 16, 8, 4, 2, 1...
Créez un script qui, partant d’un entier positif n (par exemple 10 ou 20), crée une liste des nombres de la suite de Syracuse.
Avec différents points de départ (c’est-à-dire avec différentes valeurs de n), la conjecture de Syracuse est-elle toujours vérifiée ?
Quels sont les nombres qui constituent le cycle trivial ?

> Remarque: 
Pour cet exercice, vous avez besoin de faire un nombre d’itérations inconnu pour que la suite de Syracuse atteigne
le chiffre 1 puis entame son cycle trivial. Vous pourrez tester votre algorithme avec un nombre arbitraire d’itérations,
typiquement 20 ou 100, suivant votre nombre n de départ.
Un nombre est pair lorsque le reste de sa division entière (opérateur modulo %) par 2 est nul.

**Détermination des nombres premiers inférieurs à 100 (exercice +++)**
Voici un extrait de l’article sur les nombres premiers tiré de l’encyclopédie en ligne wikipédia.
Un nombre premier est un entier naturel qui admet exactement deux diviseurs distincts entiers et positifs (qui sont alors 1 et lui-même). Cette définition exclut 1, qui n’a qu’un seul diviseur entier positif. Par opposition, un nombre non nul produit de deux nombres entiers différents de 1 est dit composé. Par exemple 6 = 2 × 3 est composé, tout comme 21 = 3 × 7, mais 11 est premier car 1 et 11 sont les seuls diviseurs de 11. Les nombres 0 et 1 ne sont ni premiers ni composés.
Déterminez les nombres premiers inférieurs à 100. Combien y a-t-il de nombres premiers entre 0 et 100 ? 
Pour vous aider, nous vous proposons plusieurs méthodes.

- Méthode 1 (peu optimale mais assez intuitive)
Pour chaque nombre de 2 à 100, calculez le reste de la division entière (avec l’opérateur modulo %) depuis 1 jusqu’à lui-même. Si c’est un nombre premier, il aura exactement deux nombres pour lesquels le reste de la division entière est égal à
0 (1 et lui-même). Si ce n’est pas un nombre premier, il aura plus de deux nombres pour lesquels le reste de la division entière
est égal à 0.
- Méthode 2 (plus optimale et plus rapide, mais un peu plus compliquée)
Parcourez tous les nombres de 2 à 100 et vérifiez si ceux-ci sont composés, c’est-à-dire qu’ils sont le produit de deux
nombres premiers. Pratiquement, cela consiste à vérifier que le reste de la division entière (opérateur modulo %) entre le nombre considéré et chaque nombre premier déterminé jusqu’à maintenant est nul. Le cas échéant, ce nombre n’est pas premier. Attention, pour cette méthode, il faudra initialiser la liste de nombres premiers avec le premier nombre premier (donc  2 !).

**Recherche d’un nombre par dichotomie (exercice +++)**
La recherche par dichotomie 6 est une méthode qui consiste à diviser (en général en parties égales) un problème pour en
trouver la solution. À titre d’exemple, voici une discussion entre Pierre et Patrick dans laquelle Pierre essaie de deviner le
nombre (compris entre 1 et 100 inclus) auquel Patrick a pensé.
— [Patrick] « C’est bon, j’ai pensé à un nombre entre 1 et 100. »
— [Pierre] « OK, je vais essayer de le deviner. Est-ce que ton nombre est plus petit ou plus grand que 50 ? »
— [Patrick] « Plus grand. »
— [Pierre] « Est-ce que ton nombre est plus petit, plus grand ou égal à 75 ? »
— [Patrick] « Plus grand. »
— [Pierre] « Est-ce que ton nombre est plus petit, plus grand ou égal à 87 ? »
— [Patrick] « Plus petit. »
— [Pierre] « Est-ce que ton nombre est plus petit, plus grand ou égal à 81 ? »
— [Patrick] « Plus petit. »
— [Pierre] « Est-ce que ton nombre est plus petit, plus grand ou égal à 78 ? »
— [Patrick] « Plus grand. »
— [Pierre] « Est-ce que ton nombre est plus petit, plus grand ou égal à 79 ? »
— [Patrick] « Égal. C’est le nombre auquel j’avais pensé. Bravo ! »
Pour arriver rapidement à deviner le nombre, l’astuce consiste à prendre à chaque fois la moitié de l’intervalle dans lequel
se trouve le nombre. Voici le détail des différentes étapes :
1. le nombre se trouve entre 1 et 100, on propose 50 (100 / 2).
2. le nombre se trouve entre 50 et 100, on propose 75 ( 50 + (100-50)/2 ).
3. le nombre se trouve entre 75 et 100, on propose 87 ( 75 + (100-75)/2 ).
4. le nombre se trouve entre 75 et 87, on propose 81 ( 75 + (87-75)/2 ).
5. le nombre se trouve entre 75 et 81, on propose 78 ( 75 + (81-75)/2 ).
6. le nombre se trouve entre 78 et 81, on propose 79 ( 78 + (81-78)/2 ).
Créez un script qui reproduit ce jeu de devinettes. Vous pensez à un nombre entre 1 et 100 et l’ordinateur essaie de le deviner par dichotomie en vous posant des questions.
Votre programme utilisera la fonction input() pour interagir avec l’utilisateur. Voici un exemple de son fonctionnement :

```py
lettre = input (" Entrez une lettre : ")
print ( lettre )
```

Pour vous guider, voici ce que donnerait le programme avec la conversation précédente :
```py
Pensez à un nombre entre 1 et 100.
Est-ce votre nombre est plus grand , plus petit ou égal à 50 ? [+/ -/=] +
Est-ce votre nombre est plus grand , plus petit ou égal à 75 ? [+/ -/=] +
Est-ce votre nombre est plus grand , plus petit ou égal à 87 ? [+/ -/=] -
Est-ce votre nombre est plus grand , plus petit ou égal à 81 ? [+/ -/=] -
Est-ce votre nombre est plus grand , plus petit ou égal à 78 ? [+/ -/=] +
Est-ce votre nombre est plus grand , plus petit ou égal à 79 ? [+/ -/=] -
```

Les caractères [+/-/=] indiquent à l’utilisateur comment il doit interagir avec l’ordinateur, c’est-à-dire entrer soit le caractère + si le nombre choisi est plus grand que le nombre proposé par l’ordinateur, soit le caractère - si le nombre choisi
est plus petit que le nombre proposé par l’ordinateur, soit le caractère = si le nombre choisi est celui proposé par l’ordinateur
(en appuyant ensuite sur la touche Entrée).

---


## Chapitre 7: Fichiers

Dans cette partie nous allons explorer comment ou ouvrire, lire, ecrire et fermer les fichiers. Les fichiers sont les entites qui permettent de garder des informations dans l'ordinateur. Un dossier parcontre est une entite qui permet de regrouper les fichiers. Une difference notable est que le fichier comporte une extension (nom du fichier + . + extension). Une extension est une suite de lettres (la plupart du temps trois), qui permet de definir le type du fichier.
Exemple: test.docx, test.xlsx, pyton.txt, exercice.py

Avant de commencer a explorer les differentes methodes, nous allons d'abord creer un fichier `test.txt`:
```txt
Bonjour ! Bienvenue dans le fichier test.txt
Ce fichier est destiné à être testé.
Bonne chance !
```

**Ouverture d'un fichier**

La fonction clé pour travailler avec des fichiers en Python est la fonction `open()`.
La fonction open() prend deux paramètres : le nom du fichier et le mode.
Il existe quatre méthodes différentes (modes) pour ouvrir un fichier :

|Mode|Definition|
|:------:|:---------|
|r|Lecture - Valeur par défaut. Ouvre un fichier en lecture, erreur si le fichier n'existe pas.|
|a|Append - Ouvre un fichier pour l'ajouter, crée le fichier s'il n'existe pas.|
|w|Write - Ouvre un fichier pour l'écriture, crée le fichier s'il n'existe pas.|
|x|Create - Crée le fichier spécifié, renvoie une erreur si le fichier existe.|

Syntaxe:
`fichier = open("nom_du_fichier", "mode_douverture")`

Exemple
```py
f = open("test.txt", "r")
```

### Lecture du contenu d'un fichier
*La methode `read()`*
La methode `read()` permet de lire tout le contenu d'un fichier.
Exemple:
```py
f = open("test.txt", "r")
print(f.read()) 
```

Exemple:
```py
f = open("test.txt", "r")
print(f.read(10)) # affiche uniquement les 10 premiers caracters
```
Elle peut etre aussi utilisee pour retourner un certain nombre de caracteres


*La methode `readline`*
Cette methode permet de lire uniquement une seule ligne.
```py
f = open("test.txt", "r")
print(f.readline()) # affichera la premiere ligne
```

Si elle est utilisee plusieures fois, alors elle retournera les lignes de facon successive.
Exemple:

```py
f = open("test.txt", "r")
print(f.readline()) # affichera la premiere ligne
print(f.readline()) # affichera la deuxieme ligne
```

Nous avons alors un moyen de ligne chaque ligne en utilisant une boucle:
```py
f = open("test.txt", "r")
for x in f:
  print(x) 
```


> Remarque: Nous pouvons donc conclure que la methode `readline()` retourne tout le contenu du fichier sous forme d'une liste, ou chaque ligne represente un element de la liste, alors que la methode `read()` retourne tout le contenu du fichier sous forme de chaine de caractere.

**Écrire dans un fichier existant**

Pour écrire dans un fichier existant, vous devez ajouter un paramètre à la fonction open() :

|Mode|Definition|
|:------:|:---------|
|a|Append - pour ajouter à la fin du fichier|
|w|Write - écrase le contenu existant. Cree le fichier s'il n'existe pas|

```py
f = open("test.txt", "a")
f.write("Maintenant mon fichier a plus de contenu")
f.close()

#ouvre et lis le fichier apres l'ajout:
f = open("test.txt", "r")
print(f.read())
```

Autre exemple:
```py
f = open("test.txt", "w")
f.write("Woops! J'ai tout supprime")
f.close()

#ouvre et lis le fichier après l'écrasement :
f = open("test.txt", "r")
print(f.read())
```

**Creer un nouveau fichier**

Pour créer un nouveau fichier en Python, utilisez la méthode open(), avec l'un des paramètres suivants :

|Mode|Définition|
|:------:|:---------|
|x|Create - crée un fichier, renvoie une erreur si le fichier existe.|
|a| Append - crée un fichier si le fichier spécifié n'existe pas|
|w|Write - crée un fichier si le fichier spécifié n'existe pas.|

**La fonction `close()`**

La fonction `f.close()` en Python est utilisée pour fermer un fichier après avoir terminé les opérations de lecture ou d'écriture sur ce fichier. Lorsque vous travaillez avec des fichiers en Python, il est une bonne pratique de fermer explicitement le fichier une fois que vous avez fini de l'utiliser.

Lorsque vous ouvrez un fichier en utilisant la fonction open(), Python alloue des ressources pour gérer la communication avec le fichier. Si vous ne fermez pas le fichier correctement, ces ressources peuvent ne pas être libérées immédiatement, ce qui peut entraîner des problèmes de performance ou d'accès aux fichiers ultérieurement.

```py
#Ouverture du fichier en mode écriture
f = open("exemple.txt", "w")

#Écriture de données dans le fichier
f.write("Ceci est un exemple de texte.")

#Fermeture du fichier
f.close()
```

Il est recommandé d'utiliser la gestion de contexte avec la syntaxe `with` lors de l'ouverture de fichiers en Python. Cela garantit que le fichier sera fermé correctement même en cas d'erreur pendant l'exécution du code. L'exemple précédent peut être réécrit avec la gestion de contexte comme suit :

```py
#Utilisation de la gestion de contexte avec 'with'
with open("exemple.txt", "w") as f:
    f.write("Ceci est un exemple de texte.")
#Le fichier est automatiquement fermé à la sortie du bloc 'with'
```
Avec cette approche, vous n'avez pas besoin d'appeler explicitement `f.close()`, car la gestion de contexte le fait automatiquement.

**Exercices**

*Moyenne des notes*

Le fichier [notes.txt](https://python.sdv.univ-paris-diderot.fr/data-files/notes.txt) contient les notes obtenues par des étudiants pour le cours de Python. Chaque ligne du fichier ne contient qu’une note.
Téléchargez le fichier `notes.txt` et enregistrez-le dans votre répertoire de travail. N’hésitez pas à l’ouvrir avec un éditeur de texte pour voir à quoi il ressemble.
Créez un script Python qui lit chaque ligne de ce fichier, extrait les notes sous forme de float et les stocke dans une liste.
Terminez le script en calculant et affichant la moyenne des notes avec deux décimales.

*Admis ou recalé*

Le fichier notes.txt 5 contient les notes obtenues par des étudiants pour le cours de Python. Chaque ligne du fichier ne contient qu’une note.
Téléchargez le fichier notes.txt et enregistrez-le dans votre répertoire de travail. N’hésitez pas l’ouvrir avec un éditeur
de texte pour voir à quoi il ressemble.
Créez un script Python qui lit chaque ligne de ce fichier, extrait les notes sous forme de float et les stocke dans une liste.
Le script réécrira ensuite les notes dans le fichier notes2.txt avec une note par ligne suivie de « recalé » si la note est
inférieure à 10 et « admis » si la note est supérieure ou égale à 10. Toutes les notes seront écrites avec une décimale. À titre
d’exemple, voici les 3 premières lignes attendues pour le fichier notes2.txt :
```
13.5 admis
17.0 admis
9.5 recalé
```

**Spirale (exercice +++)**

Créez un script `spirale.py` qui calcule les coordonnées cartésiennes d’une spirale à deux dimensions.
Les coordonnées cartésiennes x~A~ et y~A~ d’un point A sur un cercle de rayon `r` s’expriment en fonction de l’angle `θ` représenté sur la figure 7.1 comme :
```
x~A~ = cos(θ) × r
y~A~ = sin(θ) × r
```



Pour calculer les coordonnées cartésiennes qui décrivent la spirale, vous allez faire varier deux variables en même temps :
— l’angle θ , qui va prendre des valeurs de 0 à 4π radians par pas de 0.1, ce qui correspond à deux tours complets ;
— le rayon du cercle r, qui va prendre comme valeur initiale 0.5 puis que vous allez incrémenter (c’est-à-dire augmenter)
par pas de 0.1.
Les fonctions trigonométriques sinus et cosinus sont disponibles dans le module math que vous découvrirez plus en détails dans le chapitre 8 Modules. Pour les utiliser, vous ajouterez au début de votre script l’instruction :
`import math`
La fonction sinus sera `math.sin()` et la fonction cosinus `math.cos()`. Ces deux fonctions prennent comme argument
une valeur d’angle en radian. La constante mathématique π sera également accessible grâce à ce module via math.pi. Par
exemple :
```py
math.sin (0) # 0.0
math.sin ( math.pi /2) # 1.0
math.cos ( math.pi ) # -1.0
```

Sauvegardez ensuite les coordonnées cartésiennes dans le fichier `spirale.dat` en respectant le format suivant :
— un couple de coordonnées (x~A~ et y~A~ ) par ligne ;
— au moins un espace entre les deux coordonnées x A et y A ;
— les coordonnées affichées sur 10 caractères avec 5 chiffres après la virgule.
Les premières lignes de spirale.dat devrait ressembler à :
```
0.50000	0.00000
0.59700	0.05990
0.68605	0.13907
0.76427	0.23642
0.82895	0.35048
0.87758	0.47943
[...]		[...]
```

![Point A sur le cercle de rayon r](/home/emmanuel/Documents/MD/images/Image9.jpeg)

---

### CHAPITRE 8: Fonctions


En programmation, les fonctions sont très utiles pour réaliser plusieurs fois la même opération au sein d’un programme.
Elles rendent également le code plus lisible et plus clair en le fractionnant en blocs logiques.
Vous connaissez déjà certaines fonctions Python. Par exemple math.cos(angle) du module math renvoie le cosinus de
la variable angle exprimé en radian. Vous connaissez aussi des fonctions internes à Python comme range() ou len(). Pour
l’instant, une fonction est à vos yeux une sorte de « boîte noire » (voir figure suivqante) :
1. À laquelle vous passez aucune, une ou plusieurs variable(s) entre parenthèses. Ces variables sont appelées arguments.
Il peut s’agir de n’importe quel type d’objet Python.
2. Qui effectue une action.
3. Et qui renvoie un objet Python ou rien du tout.
Par exemple, si vous appelez la fonction len() de la manière suivante :

```py
len([0, 1, 2]) # 3
```
voici ce qui se passe :
1. vous appelez len() en lui passant une liste en argument (ici la liste [0, 1, 2]) ;
2. la fonction calcule la longueur de cette liste ;
3. elle vous renvoie un entier égal à cette longueur.
Autre exemple, si vous appelez la méthode ma_liste.append() (n’oubliez pas, une méthode est une fonction qui agit
sur l’objet auquel elle est attachée par un point) :
![](/home/emmanuel/Documents/MD/images/Image11.jpeg)

```py
ma_liste.append (5)
```
1. Vous passez l’entier 5 en argument ;
2. la méthode append() ajoute l’entier 5 à l’objet ma_liste ;
3. et elle ne renvoie rien.
Aux yeux du programmeur au contraire, une fonction est une portion de code effectuant une suite d’instructions bien
particulière. Mais avant de vous présenter la syntaxe et la manière de construire une fonction, revenons une dernière fois sur
cette notion de « boîte noire » :
— Une fonction effectue une tâche. Pour cela, elle reçoit éventuellement des arguments et renvoie éventuellement quelque
chose. L’algorithme utilisé au sein de la fonction n’intéresse pas directement l’utilisateur. Par exemple, il est inutile
de savoir comment la fonction math.cos() calcule un cosinus. On a juste besoin de savoir qu’il faut lui passer en
argument un angle en radian et qu’elle renvoie le cosinus de cet angle. Ce qui se passe à l’intérieur de la fonction ne
regarde que le programmeur.
— Chaque fonction effectue en général une tâche unique et précise. Si cela se complique, il est plus judicieux d’écrire
plusieurs fonctions (qui peuvent éventuellement s’appeler les unes les autres). Cette modularité améliore la qualité
générale et la lisibilité du code. Vous verrez qu’en Python, les fonctions présentent une grande flexibilité.
Pour finir sur les généralités, nous avons utilisé dans la figiure precedente le terme programme principal (main en anglais) pour
désigner l’endroit depuis lequel on appelle une fonction (on verra plus tard que l’on peut en fait appeler une fonction de
n’importe où). Le programme principal désigne le code qui est exécuté lorsqu’on lance le script Python, c’est-à-dire toute
la suite d’instructions en dehors des fonctions. En général, dans un script Python, on écrit d’abord les fonctions puis le
programme principal.

**Definition d'une fonction**
Pour définir une fonction, Python utilise le mot-clé `def`.
```py
def hello ():
	print ("bonjour")
```
 Si on souhaite que la fonction renvoie quelque chose, il faut
utiliser le mot-clé return. Par exemple :
```py
def carre (x):
	return x**2
```
Notez que la syntaxe de def utilise les deux-points comme les boucles for et while ainsi que les tests if, un bloc
d’instructions est donc attendu. De même que pour les boucles et les tests, l’indentation de ce bloc d’instructions (qu’on
appelle le corps de la fonction) est obligatoire.
Dans l’exemple précédent, nous avons passé un argument à la fonction carre() qui nous a renvoyé (ou retourné) une
valeur que nous avons immédiatement affichée à l’écran avec l’instruction print(). Que veut dire valeur renvoyée ? Et bien
cela signifie que cette dernière est récupérable dans une variable :

```py
res = carre (2)
print ( res ) # 4
```
Ici, le résultat renvoyé par la fonction est stocké dans la variable res. Notez qu’une fonction ne prend pas forcément un
argument et ne renvoie pas forcément une valeur, par exemple :
```py
hello() # bonjour
```
Dans ce cas la fonction, hello() se contente d’afficher la chaîne de caractères "bonjour" à l’écran. Elle ne prend aucun
argument et ne renvoie rien. Par conséquent, cela n’a pas de sens de vouloir récupérer dans une variable le résultat renvoyé
par une telle fonction. Si on essaie tout de même, Python affecte la valeur None qui signifie rien en anglais :
```py
var = hello () # bonjour
print ( var ) # None
```

**Passage d’arguments**
Le nombre d’arguments que l’on peut passer à une fonction est variable. Nous avons vu ci-dessus des fonctions auxquelles
on passait 0 ou 1 argument. Dans les chapitres précédents, vous avez rencontré des fonctions internes à Python qui prenaient
au moins 2 arguments. Souvenez-vous par exemple de range(1, 10) ou encore range(1, 10, 2). Le nombre d’argument
est donc laissé libre à l’initiative du programmeur qui développe une nouvelle fonction.
Une particularité des fonctions en Python est que vous n’êtes pas obligé de préciser le type des arguments que vous lui
passez, dès lors que les opérations que vous effectuez avec ces arguments sont valides. Python est en effet connu comme étant
un langage au « typage dynamique », c’est-à-dire qu’il reconnaît pour vous le type des variables au moment de l’exécution.
Par exemple :
```py
def fois (x , y ):
	return x * y

fois(2, 3) # 6
fois (3.1415 , 5.23) # 16.430045000000003
fois("to" , 2) # 'toto'
fois ([1 ,3] , 2) # [1 , 3 , 1 , 3]
```
L’opérateur * reconnaît plusieurs types (entiers, floats, chaînes de caractères, listes). Notre fonction fois() est donc
capable d’effectuer des tâches différentes ! Même si Python autorise cela, méfiez-vous tout de même de cette grande flexibilité
qui pourrait conduire à des surprises dans vos futurs programmes. En général, il est plus judicieux que chaque argument ait
un type précis (entiers, floats, chaînes de caractères, etc) et pas l’un ou l’autre.

**Renvoi de résultats**
Un énorme avantage en Python est que les fonctions sont capables de renvoyer plusieurs objets à la fois, comme dans cette
fraction de code :
```py
def carre_cube ( x ):
	return x **2 , x **3

carre_cube (2) # (4 , 8)
```
**Arguments positionnels et arguments par mot-clé**
Jusqu’à maintenant, nous avons systématiquement passé le nombre d’arguments que la fonction attendait. Que se passe-t-il
si une fonction attend deux arguments et que nous ne lui en passons qu’un seul ?
```py
def fois (x , y ):
	return x * y

fois (2 , 3) # 6
fois (2)
"""
Traceback ( most recent call last ):
File " < stdin >" , line 1 , in < module >
TypeError : fois () missing 1 required positional argument : 'y '
"""
```
On constate que passer un seul argument à une fonction qui en attend deux conduit à une erreur.

> Définition
Lorsqu’on définit une fonction def fct(x, y): les arguments x et y sont appelés arguments positionnels (en anglais
positional arguments). Il est strictement obligatoire de les préciser lors de l’appel de la fonction. De plus, il est nécessaire de respecter le même ordre lors de l’appel que dans la définition de la fonction. Dans l’exemple ci-dessus, 2 correspondra à x et 3 correspondra à y. Finalement, tout dépendra de leur position, d’où leur qualification de positionnel.

Mais il est aussi possible de passer un ou plusieurs argument(s) de manière facultative et de leur attribuer une valeur par
défaut :
```py
def fct ( x =1):
	return x

fct () # 1
fct(10) # 10
```
Définition
Un argument défini avec une syntaxe def fct(arg=val): est appelé argument par mot-clé (en anglais keyword argu-
ment). Le passage d’un tel argument lors de l’appel de la fonction est facultatif. Ce type d’argument ne doit pas être confondu
avec les arguments positionnels présentés ci-dessus, dont la syntaxe est `def fct(arg):`.

Il est bien sûr possible de passer plusieurs arguments par mot-clé :
```py
def fct ( x =0 , y =0 , z =0):
	return x , y , z

fct () # (0 , 0 , 0)
fct (10) # (10 , 0 , 0)
fct (10 , 8) # (10 , 8 , 0)
fct (10 , 8 , 3) # (10 , 8 , 3)
```
On observe que pour l’instant, les arguments par mot-clé sont pris dans l’ordre dans lesquels on les passe lors de l’appel.
Comment pourrions-nous faire si on souhaitait préciser l’argument par mot-clé z et garder les valeurs de x et y par défaut ?
Simplement en précisant le nom de l’argument lors de l’appel :
```py
fct( z =10) # (0 , 0 , 10)
```
Python permet même de rentrer les arguments par mot-clé dans un ordre arbitraire :

```py
fct ( z =10 , x =3 , y =80) # (3, 80, 10)
fct ( z =10 , y =80) # (0, 80, 10)
```

**Variables locales et variables globales**

Lorsqu’on manipule des fonctions, il est essentiel de bien comprendre comment se comportent les variables. Une variable
est dite locale lorsqu’elle est créée dans une fonction. Elle n’existera et ne sera visible que lors de l’exécution de ladite
fonction.
Une variable est dite globale lorsqu’elle est créée dans le programme principal. Elle sera visible partout dans le pro-
gramme.
Ceci ne vous paraît pas clair ? Nous allons prendre un exemple simple qui vous aidera à mieux saisir ces concepts. Observez
le code suivant :

```py
#définition d' une fonction carre ()
def carre ( x ):
	y = x **2
	return y

# programme principal
z = 5
resultat = carre ( z )
print ( resultat ) # 25
```

**Principe DRY**
L’acronyme `DRY` signifie `Don’t Repeat Yourself`. Les fonctions permettent de satisfaire ce principe en évitant la duplica-
tion de code. En effet, plus un code est dupliqué plusieurs fois dans un programme, plus il sera source d’erreurs, notamment
lorsqu’il faudra le faire évoluer.
Considérons par exemple le code suivant qui convertit plusieurs températures des degrés Fahrenheit en degrés Celsius :
```py
temp_in_fahrenheit = 60
(temp_in_fahrenheit - 32) * (5/8) # 17.5
temp_in_fahrenheit = 80
(temp_in_fahrenheit - 32) * (5/8) # 30.0
temp_in_fahrenheit = 100
(temp_in_fahrenheit - 32) * (5/8) # 42.5
```

Malheureusement il y a une erreur dans la formule de conversion. En effet la formule exacte est :

$$
temp_celsius = (temp_farhenheit - 32) * \frac{5}{9}
$$

Il faut alors reprendre les lignes 2, 5 et 8 précédentes et les corriger. Cela n’est pas efficace, surtout si le même code est
utilisé à différents endroits dans le programme.
En écrivant qu’une seule fois la formule de conversion dans une fonction, on applique le principe DRY :
```py
def convert_fahrenheit_to_celsius( temperature ):
	return ( temperature - 32) * (5/9)

temp_in_fahrenheit = 60
convert_fahrenheit_to_celsius (temp_in_fahrenheit) # 15.555555555555557
temp_in_fahrenheit= 80
convert_fahrenheit_to_celsius(temp_in_fahrenheit ) # 26.666666666666668
temp_in_fahrenheit = 100
convert_fahrenheit_to_celsius(temp_in_fahrenheit) # 37.77777777777778
```
Et s’il y a une erreur dans la formule, il suffira de le corriger qu’une seule fois, dans la fonction convert_fahrenheit_to_celsius().

**Exercices**

*Puissance*
Créez une fonction calc_puissance(x, y) qui renvoie x y en utilisant l’opérateur **. Pour rappel :
```
2**2 = 4
2**3 = 8
2**4 = 16
```
Dans le programme principal, calculez et affichez à l’écran 2 i avec i variant de 0 à 20 inclus. On souhaite que le résultat
soit présenté avec le formatage suivant :
```
2^ 0 = 		 1
2^ 1 = 		 2
2^ 2 = 		 4
[...]
2^20 = 1048576
```

*Pyramide*
Reprenez l’exercice du chapitre 5 Boucles et comparaisons qui dessine une pyramide.
Dans un script pyra.py, créez une fonction gen_pyramide() à laquelle vous passez un nombre entier N et qui renvoie
une pyramide de N lignes sous forme de chaîne de caractères. Le programme principal demandera à l’utilisateur le nombre de
lignes souhaitées (utilisez pour cela la fonction input()) et affichera la pyramide à l’écran.

*Nombres premiers*
Reprenez l’exercice du chapitre 6 Tests sur les nombres premiers.
Créez une fonction est_premier() qui prend comme argument un nombre entier positif n (supérieur à 2) et qui renvoie le
booléen True si n est premier et False si n n’est pas premier. Déterminez tous les nombres premiers de 2 à 100. On souhaite
avoir une sortie similaire à celle-ci :
```
2 est premier
3 est premier
4 n ' est pas premier
[...]
100 n ' est pas premier
```

*Distance 3D*

Créez une fonction calc_distance_3D() qui calcule la distance euclidienne en trois dimensions entre deux atomes.
Testez votre fonction sur les 2 points A(0,0,0) et B(1,1,1). Trouvez-vous bien $sqrt(3)$ ?
On rappelle que la distance euclidienne d entre deux points A et B de coordonnées cartésiennes respectives $(x_A , y_A , z_A )$ et
$(x_B , y_B , z_B )$ se calcule comme suit :
$$
d = \sqrt{(x_B - x_a)^2 + (y_B - y_A)^2 + (z_b - z_A)^2}
$$


*Distribution et statistiques*

Créez une fonction `gen_distrib()` qui prend comme argument trois entiers : debut, fin et n. La fonction renverra une
liste de n floats aléatoires entre debut et fin. Pour générer un nombre aléatoire dans un intervalle donné, utilisez la fonction
`uniform()` du module random dont voici quelques exemple d’utilisation :
```py
import random
random.uniform (1 , 10) # 8.199672607202174
random.uniform (1 , 10) # 2.607528561528022
random.uniform (1 , 10) # 9.000404025130946

```
Avec la fonction random.uniform(), les bornes passées en argument sont incluses, c’est-à-dire qu’ici, le nombre aléa-
toire renvoyé est dans l’intervalle [1, 10].
Créez une autre fonction calc_stat() qui prend en argument une liste de floats et qui renvoie une liste de trois éléments
contenant respectivement le minimum, le maximum et la moyenne de la liste.

Dans le programme principal, générez 20 listes aléatoires de 100 floats compris entre 0 et 100 et affichez le minimum
(min()), le maximum (max()) et la moyenne pour chacune d’entre elles. La moyenne pourra être calculée avec les fonctions
sum() et len().
Pour chacune des 20 listes, affichez les statistiques (min, max, et moyenne) avec deux chiffres après la virgule :
```
Liste 1 : min = 0.17 ; max = 99.72 ; moyenne = 57.38
Liste 2 : min = 1.25 ; max = 99.99 ; moyenne = 47.41
[...]
Liste 19 : min = 1.05 ; max = 99.36 ; moyenne = 49.43
Liste 20 : min = 1.33 ; max = 97.63 ; moyenne = 46.53
```
Les écarts sur les statistiques entre les différentes listes sont-ils importants ? Relancez votre script avec des listes de 1000
éléments, puis 10 000 éléments. Les écarts changent-ils quand le nombre d’éléments par liste augmente ?

![Illustration de la distance à l’origine.](/home/emmanuel/Documents/MD/images/Image21.png)


---

### CHAPITRE 9: Programmation modulaire

Considérez qu'un module est la même chose qu'une bibliothèque de code. C'est un fichier contenant un ensemble de fonctions que vous souhaitez inclure dans votre application.

**Créer un module**

Pour créer un module, il suffit de sauvegarder le code que vous voulez dans un fichier avec l'extension .py :
Exemple:

> Enregistrez ce code dans un fichier nommé monmodule.py
```py
def salutations(nom) :
  print("Bonjour, " + nom)
```

**Utiliser un module**

Nous pouvons maintenant utiliser le module que nous venons de créer, en utilisant l'instruction `import` :
Exemple:
>Importez le module nommé mymodule, et appelez la fonction greeting :
```py
import monmodule
monmodule.salutations("Jonathan")
```

**Renommer un module**

Vous pouvez créer un alias lorsque vous importez un module, en utilisant le mot-clé `as` :
Exemple:
> Créer un alias pour monmodule appelé mx :
```
import monmodule as mod

mod.salutations("Aminata")
```

**Modules intégrés**

Il existe plusieurs modules intégrés dans Python, que vous pouvez importer quand vous le souhaitez.
Exemple:
> Importer et utiliser le module platform :
```py
import plateform

x = platform.system()
print(x) # affiche le systeme d'explotation de la machine
```

**Obtenir de l’aide sur les modules importés**

Pour obtenir de l’aide sur un module rien de plus simple, il suffit d’utiliser la commande help() :
```py
import random
help ( random )
#[...]
```
Ce qui renvoie quelque chose du type :

```
Help on module random :
NAME
random - Random variable generators .
MODULE REFERENCE
https :// docs . python . org /3.7/ library / random
The following documentation is automatically generated from the Python source files . It may be incomplete , incorrect or include features that are considered implementat ion detail and may vary between Python implementations. When in doubt, consult the module reference at the location listed above.
DESCRIPTION
integers
--------
uniform within range
sequences
---------
pick random element
pick random sample
```

La commande help() est en fait une commande plus générale permettant d’avoir de l’aide sur n’importe quel objet chargé
en mémoire:
```py
t = [1 , 2 , 3]
help ( t )
Help on list object :

class list ( object )
| list () -> new list
| list ( sequence ) -> new list initialized from sequence ' s items
|
| Methods defined here :
|
| __add__ (...)
|
x . __add__ ( y ) <== > x + y
```

**Quelques modules courants**

Il existe une série de modules que vous serez probablement amenés à utiliser si vous programmez en Python. En voici une
liste non exhaustive. Pour la liste complète, reportez-vous à la page des modules 4 sur le site de Python :
— `math`: fonctions et constantes mathématiques de base (sin, cos, exp, pi. . . ).

— `sys`: interaction avec l’interpréteur Python, passage d’arguments.

— `os`: dialogue avec le système d’exploitation.

— `random`: génération de nombres aléatoires.

— `time`: accès à l’heure de l’ordinateur et aux fonctions gérant le temps.

— `urllib`: récupération de données sur internet depuis Python.

— `Tkinter`: interface python avec Tk. Création d’objets graphiques.

— `re`: gestion des expressions régulières (Expressions régulières et parsing*).


Enfin, notez qu’il existe de nombreux autres modules externes qui ne sont pas installés de base dans Python mais qui
sont très utilisés en bioinformatique et en analyse de données. Citons-en quelques-uns : NumPy (manipulations de vecteurs
et de matrices, algèbre linéaire), Biopython (recherche dans les banques de données biologiques, manipulation de séquences
ou de structures de biomolécules), matplotlib (représentations graphiques : courbes, nuages de points, diagrammes en bâtons... ), pandas (analyse de données). . .


**Importer une fonction ou une variable à partir d'un module**

Vous pouvez choisir de n'importer que des parties d'un module, en utilisant le mot-clé `from`.
Imaginez que dans votre fichier `monmodule.py` vous avez plusieurs fonctions comme suite:
```py

def salutations(nom) :
  print("Bonjour, " + nom)

def aurevoir(nom) :
  print("Aurevoir, " + nom)
```
Maintenant vous ne souhaitez utiliser que la fonction `aurevoir()`, sans pour autant importer tout le fichier entier, vous pouvez proceder comme suite:

```py
from monmodule import aurevoir
aurevoir("Yaro Emmanuel")
```
> Cependant, nous n'appelons plus la fonction `aurevoir` de la maniere suivant : -[monmodule.aurevoir("le nom souhaite")], car nous n'avons pas importer tout le module.

**Exercices**

_Racine carrée_
Affichez sur la même ligne les nombres de 10 à 20 (inclus) ainsi que leur racine carrée avec 3 décimales. Utilisez pour
cela le module math avec la fonction sqrt(). Exemple :
```
10 3.162
11 3.317
12 3.464
13 3.606
[...]
```

_Cosinus_
Calculez le cosinus de π/2 en utilisant le module math avec la fonction cos() et la constante pi.

_Nom et contenu du répertoire courant_
Affichez le nom et le contenu du répertoire courant (celui depuis lequel vous avez lancé l’interpréteur Python).
Déterminez également le nombre total de fichiers et de répertoires présents dans le répertoire courant.
Nous allons utiliser la fonction `os.getcwd()` et `os.listdir()`.

_Affichage temporisé_
Affichez les nombres de 1 à 10 avec 1 seconde d’intervalle. Utilisez pour cela le module time et sa fonction sleep().
Nous allons utiliser ici la fonction `time.sleep()`.

*Séquences aléatoires de chiffres*

Générez une séquence aléatoire de 6 chiffres, ceux-ci étant des entiers tirés entre 1 et 4. Utilisez le module random avec la fonction randint().

**Détermination du nombre pi par la méthode Monte Carlo (exercice +++)**
Soit un cercle de rayon 1 inscrit dans un carré de côté 2 (en trait pointillé).
Avec R = 1, l’aire du carré vaut (2R) 2 soit 4 et l’aire du disque délimité par le cercle vaut πR 2 soit π.
En choisissant N points aléatoires (à l’aide d’une distribution uniforme) à l’intérieur du carré, la probabilité que ces points se trouvent aussi dans le cercle est :

![Cercle de rayon 1 inscrit dans un carré de côté 2.](/home/emmanuel/Documents/MD/images/Image10.png)
$$
p = \frac{aire~du~cercle}{aire~du~carre} = \frac{π}{4}
$$


Soit n, le nombre de points effectivement dans le cercle, il vient alors

$$
p = \frac{n}{N} = \frac{\pi}{4}
$$

d’où

$$
π = 4*\frac{n}{N}
$$

Déterminez une approximation de π par cette méthode. Pour cela, pour N itérations :

— Choisissez aléatoirement les coordonnées x et y d’un point entre -1 et 1. Utilisez la fonction uniform() du module
random.

— Calculez la distance entre le centre du cercle et ce point.

— Déterminez si cette distance est inférieure au rayon du cercle, c’est-à-dire si le point est dans le cercle ou pas.

— Si le point est effectivement dans le cercle, incrémentez le compteur n.

Finalement calculez le rapport entre n et N et proposez une estimation de π. Quelle valeur de π obtenez-vous pour 100
itérations ? 1000 itérations ? 10 000 itérations ? Comparez les valeurs obtenues à la valeur de π fournie par le module math.
On rappelle que la distance d entre deux points A et B de coordonnées respectives $(x_A , y_A )$ et $(x_B , y_B)$ se calcule comme :
$$
d = \sqrt{(x_B − x_A)^2 + (y_B − y_A)^2}
$$

---

## CHAPITRE 10: Plus sur les chaines de caracteres et les listes

Dans ce chapitre nous allons explorer quelques methodes utiles pour les chaines de caracteres ainsi que les listes en python.

### Méthodes pour les chaînes de caractères en Python

`len()` : Retourne la longueur de la chaîne.

```py
texte = "Bonjour, Python!"
longueur = len(texte)
print(longueur)  # Affiche 15
```

`lower()` : Convertit tous les caractères de la chaîne en minuscules. Utile lorsque vous souhaitez comparer des chaînes sans tenir compte de la casse.

```py
texte = "Hello, World!"
minuscules = texte.lower()
print(minuscules)  # Affiche "hello, world!"
```

`upper()` : Convertit tous les caractères de la chaîne en majuscules. Utile lorsque vous avez besoin d'une version en majuscules de la chaîne d'origine.

```py
texte = "Bonjour, Python!"
majuscules = texte.upper()
print(majuscules)  # Affiche "BONJOUR, PYTHON!"
```

`strip()` : Supprime les espaces (ou d'autres caractères spécifiés) au début et à la fin de la chaîne. Pratique pour nettoyer une chaîne en éliminant les espaces inutiles.

```py
texte = "    Python    "
nettoye = texte.strip()
print(nettoye)  # Affiche "Python"
```

`replace()` : Rôle : Remplace une sous-chaîne par une autre.
Utile pour effectuer des substitutions dans une chaîne.

```py
texte = "Hello, World!"
nouveau_texte = texte.replace("Hello", "Bonjour")
print(nouveau_texte)  # Affiche "Bonjour, World!"
```

`find()` : Retourne l'index de la première occurrence d'une sous-chaîne. Permet de trouver la position d'une sous-chaîne dans une chaîne.
```py
texte = "Python est puissant et Python est cool."
index = texte.find("Python")
print(index)  # Affiche 0 (première occurrence)
```

`split()` : Divise la chaîne en une liste de sous-chaînes en utilisant un séparateur spécifié. Utile pour diviser une chaîne en parties distinctes en fonction d'un séparateur.

```py
texte = "Python,JavaScript,Java,C++"
langages = texte.split(",")
print(langages)  # Affiche ['Python', 'JavaScript', 'Java', 'C++']
```

`join()` : Joint les éléments d'une liste en une seule chaîne en utilisant la chaîne appelante comme séparateur. Inverse de split(), cette méthode permet de concaténer des éléments de liste en une seule chaîne.

```py
langages = ['Python', 'JavaScript', 'Java', 'C++']
texte = ", ".join(langages)
print(texte)  # Affiche "Python, JavaScript, Java, C++"
```

### Méthodes pour les listes en Python

`len()` : Retourne la longueur de la liste (le nombre d'éléments).
Cette méthode est utilisée pour obtenir le nombre d'éléments dans une liste.


```py
ma_liste = [1, 2, 3, 4, 5]
longueur = len(ma_liste)
print(longueur)  # Affiche 5
```

`append()` : Ajoute un élément à la fin de la liste.
Utile pour étendre une liste en ajoutant un nouvel élément.

```py
ma_liste = [1, 2, 3]
ma_liste.append(4)
print(ma_liste)  # Affiche [1, 2, 3, 4]
```

`extend()` : Ajoute les éléments d'une liste (ou tout autre iterable) à la fin de la liste. Permet de fusionner deux listes en ajoutant les éléments de l'une à la fin de l'autre.

```py
liste1 = [1, 2, 3]
liste2 = [4, 5, 6]
liste1.extend(liste2)
print(liste1)  # Affiche [1, 2, 3, 4, 5, 6]
```

`insert()` : Insère un élément à une position spécifiée dans la liste. Utile pour insérer un élément à un emplacement précis dans la liste.

```py
ma_liste = [1, 2, 3]
ma_liste.insert(1, 4)  # Insère 4 à l'index 1
print(ma_liste)  # Affiche [1, 4, 2, 3]
```

`remove()` : Supprime la première occurrence d'une valeur spécifiée. Permet de supprimer un élément particulier de la liste.

```py
ma_liste = [1, 2, 3, 4, 3]
ma_liste.remove(3)
print(ma_liste)  # Affiche [1, 2, 4, 3]
```

`pop()` : Retire et retourne l'élément à une position spécifiée. Utile pour extraire un élément de la liste à une position donnée.

```py
ma_liste = [1, 2, 3]
element_retire = ma_liste.pop(1)
print(element_retire)  # Affiche 2
print(ma_liste)  # Affiche [1, 3]
```

`index()` : Retourne l'index de la première occurrence d'une valeur spécifiée. Permet de trouver la position d'un élément dans la liste.

```py
ma_liste = [10, 20, 30, 20, 40]
index = ma_liste.index(20)
print(index)  # Affiche 1 (première occurrence)
```

`sort()` : Trie les éléments de la liste.
Permet de trier la liste dans l'ordre croissant par défaut (ou dans l'ordre décroissant avec l'argument `reverse=True`).

```py
ma_liste = [3, 1, 4, 1, 5, 9, 2]
ma_liste.sort()
print(ma_liste)  # Affiche [1, 1, 2, 3, 4, 5, 9]
```

`del` : l’instruction del supprime un élément d’une liste à un indice déterminé :
```py
a = [1 , 2 , 3]
del a [1]
print(a) # [1 ,3]
```

**Particularités des méthodes associées aux listes**

De nombreuses méthodes mentionnées précédemment (.append(), .sort(), etc.) modifient la liste mais ne renvoient
rien, c’est-à-dire qu’elles ne renvoient pas d’objet récupérable dans une variable. Il s’agit d’un exemple d’utilisation
de méthode (donc de fonction particulière) qui fait une action mais qui ne renvoie rien. Pensez-y dans vos utilisa-
tions futures des listes : même si var = liste.reverse() est une instruction Python valide, elle n’a aucun intérêt,
préférez-lui liste.reverse().

**Exercices**

*Parcours d’une liste de chaînes de caractères*

Soit la liste ['girafe', 'tigre', 'singe', 'souris']. Avec une boucle, affichez chaque élément ainsi que sa taille
(nombre de caractères).

*Fréquence des bases dans une séquence d’ADN*

Soit la séquence d’ADN ATATACGGATCGGCTGTTGCCTGCGTAGTAGCGT. On souhaite calculer la fréquence de chaque base
A, T, C et G dans cette séquence et afficher le résultat à l’écran.
Créez pour cela une fonction calc_composition() à laquelle vous passez en argument votre séquence d’ADN sous
forme d’une chaîne de caractères et qui renvoie une liste de quatre floats indiquant respectivement la fréquence en bases A, T,
G et C.

*Palindrome*

Un palindrome est un mot ou une phrase dont l’ordre des lettres reste le même si on le lit de gauche à droite ou de droite
à gauche. Par exemple, « ressasser » et « engage le jeu que je le gagne » sont des palindromes.
Créez la fonction test_palindrome() qui prend en argument une chaîne de caractères et qui affiche xxx est un
palindrome si la chaîne de caractères xxx passée en argument est un palindrome ou xxx n'est pas un palindrome
sinon. Pensez à vous débarrasser au préalable des majuscules et des espaces.
Testez ensuite si les expressions suivantes sont des palindromes :
— radar

— never odd or even

— karine alla en Iran

— un roc si biscornu

*Mot composable*

Un mot est composable à partir d’une séquence de lettres si la séquence contient toutes les lettres du mot. Chaque lettre de
la séquence ne peut être utilisée qu’une seule fois. Par exemple, « coucou » est composable à partir de « uocuoceokzefhu ».
Écrivez la fonction test_composable() qui prend en argument un mot (sous la forme d’une chaîne de caractères) et
une séquence de lettres (aussi comme une chaîne de caractères) et qui affiche Le mot xxx est composable à partir
de yyy si le mot (xxx) est composable à partir de la séquence de lettres (yyy) ou Le mot xxx n'est pas composable à
partir de yyy sinon.
Testez cette fonction avec les mots et les séquences suivantes :

|Mot|Séquence|
|:---|:---|
|python|aeiouyhpq|
|python|aophrtkny|
|coucou|uocuoceokzezh|
|fonction|nhwfnitvkloco|

*Alphabet et pangramme*

Les codes ASCII des lettres minuscules de l’alphabet vont de 97 (lettre « a ») à 122 (lettre « z »). La fonction chr() prend
en argument un code ASCII sous la forme d’un entier et renvoie le caractère correspondant (sous la forme d’une chaîne de
caractères). Ainsi chr(97) renvoie 'a', chr(98) renvoie 'b' et ainsi de suite.
Créez la fonction get_alphabet() qui utilise une boucle et la fonction chr() et qui renvoie une chaîne de caractères
contenant toutes les lettres de l’alphabet.
Un pangramme est une phrase comportant au moins une fois chaque lettre de l’alphabet. Par exemple, « Portez ce vieux
whisky au juge blond qui fume » est un pangramme.
Créez la fonction pangramme() qui utilise la fonction get_alphabet() précédente, qui prend en argument une chaîne
de caractères (xxx) et qui renvoie xxx est un pangramme si cette chaîne de caractères est un pangramme ou xxx n'est
pas un pangramme sinon. Pensez à vous débarrasser des majuscules le cas échéant.
Testez ensuite si les expressions suivantes sont des pangrammes :
— Portez ce vieux whisky au juge blond qui fume

— Monsieur Jack vous dactylographiez bien mieux que votre ami Wolf

— Buvez de ce whisky que le patron juge fameux

*Tri de liste*
Soit la liste de nombres [8, 3, 12.5, 45, 25.5, 52, 1]. Triez les nombres de cette liste par ordre croissant, sans
utiliser la fonction sort(). Les fonctions et méthodes min(), .append() et .remove() vous seront utiles.

*Séquence d’ADN complémentaire inverse*

Créez une fonction comp_inv() qui prend comme argument une séquence d’ADN sous la forme d’une chaîne de ca-
ractères, qui renvoie la séquence complémentaire inverse sous la forme d’une autre chaîne de caractères et qui utilise des
méthodes associées aux listes.
Utilisez cette fonction pour transformer la séquence d’ADN TCTGTTAACCATCCACTTCG en sa séquence complémentaire
inverse.
Rappel : la séquence complémentaire inverse doit être « inversée ». Par exemple, la séquence complémentaire inverse de
la séquence ATCG est CGAT.

*Doublons*

Soit la liste de nombres liste = [5, 1, 1, 2, 5, 6, 3, 4, 4, 4, 2].
À partir de liste, créez une nouvelle liste sans les doublons, triez-la et affichez-la.

*Le nombre mystère*

Trouvez le nombre mystère qui répond aux conditions suivantes :
— Il est composé de 3 chiffres.

— Il est strictement inférieur à 300.

— Il est pair.

— Deux de ses chiffres sont identiques.

— La somme de ses chiffres est égale à 7.

On vous propose d’employer une méthode dite « brute force », c’est-à-dire d’utiliser une boucle et à chaque itération de
tester les différentes conditions.

*Triangle de Pascal (exercice +++)*
Voici le début du triangle de Pascal :
```
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
1 5 10 10 5 1
[...]
```
Déduisez comment une ligne est construite à partir de la précédente. Par exemple, à partir de la ligne 2 (1 1), construisez
la ligne suivante (ligne 3 : 1 2 1) et ainsi de suite.
Implémentez cette construction en Python. Généralisez à l’aide d’une boucle.
Écrivez dans un fichier pascal.out les 10 premières lignes du triangle de Pascal.

---

## CHAPITRE 11: Containers, dictionnaires, tuples et sets

Dans ce chapitre nous allons voir trois nouveaux types d’objet qui s’avèrent extrêmement utiles : les dictionnaires, les
tuples et les sets. Comme les listes ou les chaînes de caractères, ces trois nouveaux types sont appelés communémement des
containers. Avant d’aborder en détail ces nouveaux types, nous allons définir les containers et leurs propriétés.

### Containers
Un container est un nom générique pour définir un objet Python qui contient une collection d’autres objets.
Les containers que nous connaissons depuis le début de ce cours sont les listes et les chaînes de caractères. Même si on ne
l’a pas vu explicitement, les objets de type range sont également des containers.

Bien sûr ! Les containers en Python sont des structures de données qui permettent de stocker et d'organiser des objets de manière efficace. Il existe plusieurs types de containers en Python, chacun ayant ses propres caractéristiques et utilisations. Voici un aperçu des containers les plus couramment utilisés :

### Listes (Lists)

Les listes sont des séquences mutables d'éléments. Les éléments peuvent être de n'importe quel type, et vous pouvez les modifier (ajouter, supprimer, mettre à jour) après la création de la liste.

Exemple :
```python
ma_liste = [1, 2, 3, 'quatre', 5.0]
ma_liste.append(6)
print(ma_liste)  # Affiche [1, 2, 3, 'quatre', 5.0, 6]
```

### Tuples

Les tuples sont des séquences immuables d'éléments. Une fois créés, vous ne pouvez pas ajouter, supprimer ou modifier des éléments à l'intérieur d'un tuple.

Exemple :
```python
mon_tuple = (1, 2, 3, 'quatre', 5.0)
print(mon_tuple)  # Affiche (1, 2, 3, 'quatre', 5.0)
```

### Ensembles (Sets)

Les ensembles sont des collections non ordonnées d'éléments uniques. Ils sont utiles pour effectuer des opérations ensemblistes telles que l'union, l'intersection et la différence.

Exemple :
```python
mon_ensemble1 = {1, 2, 3, 4, 5}
mon_ensemble2 = {3, 4, 5, 6, 7}
union = mon_ensemble1 | mon_ensemble2
print(union)  # Affiche {1, 2, 3, 4, 5, 6, 7}
```

Bien sûr ! Voici une liste de quelques-unes des méthodes les plus utiles pour travailler avec les ensembles (sets) et les tuples en Python :

### Méthodes pour les Sets (Ensembles)

`add()` : Ajoute un élément à l'ensemble.

```python
mon_ensemble = {1, 2, 3}
mon_ensemble.add(4)
print(mon_ensemble)  # Affiche {1, 2, 3, 4}
```

`remove()` : Retire un élément de l'ensemble. Lève une exception si l'élément n'est pas présent.

**Exemple :**
```python
mon_ensemble = {1, 2, 3, 4}
mon_ensemble.remove(3)
print(mon_ensemble)  # Affiche {1, 2, 4}
```

`discard()` : Retire un élément de l'ensemble. Ne lève pas d'exception si l'élément n'est pas présent.

```python
mon_ensemble = {1, 2, 3, 4}
mon_ensemble.discard(3)
print(mon_ensemble)  # Affiche {1, 2, 4}
```

`pop()` : Retire et retourne un élément arbitraire de l'ensemble. Lève une exception si l'ensemble est vide.

```python
mon_ensemble = {1, 2, 3, 4}
element_retire = mon_ensemble.pop()
print(element_retire)  # Affiche un élément aléatoire
print(mon_ensemble)  # Affiche l'ensemble sans l'élément retiré
```

`union()` : Retourne l'union de deux ensembles.

**Exemple :**
```python
ensemble1 = {1, 2, 3}
ensemble2 = {3, 4, 5}
union = ensemble1.union(ensemble2)
print(union)  # Affiche {1, 2, 3, 4, 5}
```

`intersection()` : Retourne l'intersection de deux ensembles.

**Exemple :**
```python
ensemble1 = {1, 2, 3, 4}
ensemble2 = {3, 4, 5, 6}
intersection = ensemble1.intersection(ensemble2)
print(intersection)  # Affiche {3, 4}
```

`difference()` : Retourne la différence entre deux ensembles (éléments présents dans le premier ensemble mais pas dans le second).

**Exemple :**
```python
ensemble1 = {1, 2, 3, 4}
ensemble2 = {3, 4, 5, 6}
difference = ensemble1.difference(ensemble2)
print(difference)  # Affiche {1, 2}
```

#### Méthodes pour les Tuples

`count()` : Retourne le nombre d'occurrences d'une valeur dans le tuple.

```python
mon_tuple = (1, 2, 3, 2, 4, 2, 5)
occurrences_deux = mon_tuple.count(2)
print(occurrences_deux)  # Affiche 3
```

`index()` : Retourne l'index de la première occurrence d'une valeur spécifiée.

```python
mon_tuple = (1, 2, 3, 2, 4, 2, 5)
index_deux = mon_tuple.index(2)
print(index_deux)  # Affiche 1 (première occurrence)
```

##### Création de Tuples (sans méthode)

Les tuples sont immuables, donc on les crée en utilisant simplement des virgules ou la fonction `tuple()`.

```python
tuple1 = 1, 2, 3
tuple2 = tuple([4, 5, 6])
print(tuple1)  # Affiche (1, 2, 3)
print(tuple2)  # Affiche (4, 5, 6)
```


### Dictionnaires (Dictionaries)

Les dictionnaires se révèlent très pratiques lorsque vous devez manipuler des structures complexes à décrire et que les
listes présentent leurs limites. Les dictionnaires sont des collections non ordonnées d’objets (ceci est vrai jusqu’à la version 3.6 de Python, voir remarque ci-dessous). Il ne s’agit pas d’objets séquentiels comme les listes ou chaînes de caractères, mais plutôt d’objets dits de correspondance (mapping objects en anglais) ou tableaux associatifs. En effet, on accède aux valeurs
d’un dictionnaire par des clés. Ceci semble un peu confus ? Regardez l’exemple suivant :

Exemple :
```python
mon_dictionnaire = {'nom': 'John', 'age': 30, 'ville': 'Paris'}
print(mon_dictionnaire['age'])  # Affiche 30
```

Les dictionnaires en Python sont des structures de données puissantes qui permettent de stocker des paires clé-valeur. Voici quelques-unes des méthodes les plus utiles pour travailler avec les dictionnaires :

#### Méthodes Fondamentales

`len()` : Retourne le nombre d'éléments (paires clé-valeur) dans le dictionnaire.


```python
mon_dictionnaire = {'nom': 'John', 'age': 30, 'ville': 'Paris'}
taille = len(mon_dictionnaire)
print(taille)  # Affiche 3
```

`keys()` : Retourne une vue sur les clés du dictionnaire.

```python
mon_dictionnaire = {'nom': 'John', 'age': 30, 'ville': 'Paris'}
cles = mon_dictionnaire.keys()
print(cles)  # Affiche dict_keys(['nom', 'age', 'ville'])
```

`values()`: Retourne une vue sur les valeurs du dictionnaire.

```python
mon_dictionnaire = {'nom': 'John', 'age': 30, 'ville': 'Paris'}
valeurs = mon_dictionnaire.values()
print(valeurs)  # Affiche dict_values(['John', 30, 'Paris'])
```

`items()` : Retourne une vue sur les paires clé-valeur du dictionnaire sous la forme de tuples.

```python
mon_dictionnaire = {'nom': 'John', 'age': 30, 'ville': 'Paris'}
paires = mon_dictionnaire.items()
print(paires)  # Affiche dict_items([('nom', 'John'), ('age', 30), ('ville', 'Paris')])
```

#### Manipulation de Dictionnaires

`get()` : Retourne la valeur associée à une clé spécifiée. Si la clé n'existe pas, retourne une valeur par défaut (ou `None` si aucune valeur par défaut n'est spécifiée).

**Exemple :**
```python
mon_dictionnaire = {'nom': 'John', 'age': 30, 'ville': 'Paris'}
valeur_age = mon_dictionnaire.get('age')
print(valeur_age)  # Affiche 30
```

`pop()` : Retire la clé spécifiée et retourne la valeur associée. Si la clé n'existe pas, lève une exception (à moins qu'une valeur par défaut ne soit spécifiée).

```python
mon_dictionnaire = {'nom': 'John', 'age': 30, 'ville': 'Paris'}
valeur_age = mon_dictionnaire.pop('age')
print(valeur_age)  # Affiche 30
print(mon_dictionnaire)  # Affiche {'nom': 'John', 'ville': 'Paris'}
```

`popitem()` : Retire et retourne la paire clé-valeur la plus récemment ajoutée au dictionnaire sous forme de tuple. Utile pour LIFO (Last In, First Out).

```python
mon_dictionnaire = {'nom': 'John', 'age': 30, 'ville': 'Paris'}
derniere_paire = mon_dictionnaire.popitem()
print(derniere_paire)  # Affiche ('ville', 'Paris')
print(mon_dictionnaire)  # Affiche {'nom': 'John', 'age': 30}
```

`update()` : Met à jour le dictionnaire avec les paires clé-valeur d'un autre dictionnaire ou d'une séquence de paires clé-valeur.

```python
mon_dictionnaire = {'nom': 'John', 'age': 30}
nouvelles_infos = {'ville': 'Paris', 'age': 31}
mon_dictionnaire.update(nouvelles_infos)
print(mon_dictionnaire)  # Affiche {'nom': 'John', 'age': 31, 'ville': 'Paris'}
```

#### Autres Méthodes

`clear()` : Supprime tous les éléments du dictionnaire.

```python
mon_dictionnaire = {'nom': 'John', 'age': 30, 'ville': 'Paris'}
mon_dictionnaire.clear()
print(mon_dictionnaire)  # Affiche {}
```

`copy()` : Crée une copie superficielle du dictionnaire (shallow copy). Les objets internes ne sont pas copiés, mais référencés.

```python
mon_dictionnaire = {'nom': 'John', 'age': 30, 'ville': 'Paris'}
copie_dictionnaire = mon_dictionnaire.copy()
print(copie_dictionnaire)  # Affiche {'nom': 'John', 'age': 30, 'ville': 'Paris'}
```



### Compréhensions de Listes et Ensembles

Python offre des compréhensions de listes et d'ensembles, qui sont des moyens concis de créer des listes et des ensembles en une seule ligne, en utilisant une syntaxe plus compacte.

Exemple (Compréhension de liste) :
```python
carres = [x**2 for x in range(1, 6)]
print(carres)  # Affiche [1, 4, 9, 16, 25]
```

Exemple (Compréhension d'ensemble) :
```python
ensemble_carres = {x**2 for x in range(1, 6)}
print(ensemble_carres)  # Affiche {1, 4, 9, 16, 25}
```

### Notions importantes

- **Mutabilité :** Les listes, ensembles et dictionnaires sont mutables, ce qui signifie que vous pouvez modifier leur contenu après leur création. Les tuples sont immuables.
  
- **Indexation :** Les listes, tuples et chaînes de caractères sont indexés (vous pouvez accéder à leurs éléments par leur position). Les ensembles et les dictionnaires ne sont pas indexés.

- **Hétérogénéité :** Les listes, tuples et ensembles peuvent contenir des éléments de différents types. Les dictionnaires peuvent également avoir des valeurs de types différents.

- **Itérabilité :** Vous pouvez itérer sur tous ces containers à l'aide de boucles `for`.

Ces containers offrent une grande flexibilité et sont largement utilisés dans le développement Python pour stocker et manipuler des données de manière efficace. N'hésitez pas à explorer davantage chacun d'eux pour en comprendre toutes les fonctionnalités.

**Exercices**

*Composition en acides aminés*

En utilisant un dictionnaire, déterminez le nombre d’occurrences de chaque acide aminé dans la séquence AGWPSGGASAGLAILWGASAIMPGA
Le dictionnaire ne doit contenir que les acides aminés présents dans la séquence.

*Mots de 2 et 3 lettres dans une séquence d’ADN*

Créez une fonction compte_mots_2_lettres() qui prend comme argument une séquence sous la forme d’une chaîne de
caractères et qui renvoie tous les mots de 2 lettres qui existent dans la séquence sous la forme d’un dictionnaire. Par exemple
pour la séquence ACCTAGCCCTA, le dictionnaire renvoyée serait : {'AC': 1, 'CC': 3, 'CT': 2, 'TA': 2, 'AG': 1,
'GC': 1}
Créez une nouvelle fonction compte_mots_3_lettres() qui a un comportement similaire à compte_mots_2_lettres()
mais avec des mots de 3 lettres.
Utilisez ces fonctions pour affichez les mots de 2 et 3 lettres et leurs occurrences trouvés dans la séquence d’ADN :
ACCTAGCCATGTAGAATCGCCTAGGCTTTAGCTAGCTCTAGCTAGCTG
Voici un exemple de sortie attendue :

```
Mots de 2 lettres
AC : 1
CC : 3
CT : 8
[...]
Mots de 3 lettres
ACC : 1
CCT : 2
CTA : 5
[...]
```

---

## CHAPITRE 12: Bonnes pratiques en programmation Python

ser l’écriture de code en Python, la communauté des développeurs Python recommande un certain nombre de règles afin
qu’un code soit lisible. Lisible par quelqu’un d’autre, mais également, et surtout, par soi-même. Essayez de relire un code que
vous avez écrit « rapidement » il y a un 1 mois, 6 mois ou un an. Si le code ne fait que quelques lignes, il se peut que vous
vous y retrouviez, mais s’il fait plusieurs dizaines voire centaines de lignes, vous serez perdus.
Dans ce contexte, le créateur de Python, Guido van Rossum, part d’un constat simple : « code is read much more often than
it is written » (« le code est plus souvent lu qu’écrit »). Avec l’expérience, vous vous rendrez compte que cela est parfaitement
vrai.

*Indentation*

On a vu que l’indentation est obligatoire en Python pour séparer les blocs d’instructions. Cela vient d’un constat simple,
l’indentation améliore la lisibilité d’un code.

Importation des modules
Comme on l’a vu au chapitre 8 Modules, le chargement d’un module se fait avec l’instruction import module plutôt
qu’avec from module import *.
Si on souhaite ensuite utiliser une fonction d’un module, la première syntaxe conduit à module.fonction() ce qui rend
explicite la provenance de la fonction. Avec la seconde syntaxe, il faudrait écrire fonction() ce qui peut :
— mener à un conflit si une de vos fonctions a le même nom ;
— rendre difficile la recherche de documentation si on ne sait pas d’où vient la fonction, notamment si plusieurs modules
sont chargés avec l’instruction `from module import *``

Dans un script Python, on importe en général un module par ligne. D’abord les modules internes (classés par ordre
alphabétique), c’est-à-dire les modules de base de Python, puis les modules externes (ceux que vous avez installés en plus).
Si le nom du module est trop long, on peut utiliser un alias. L’instruction from est tolérée si vous n’importez que quelques
fonctions clairement identifiées.
En résumé :
```py
import module_interne_1
import module_interne_2
from module_interne_3 import fonction_sp é cifique
from module_interne_4 import constante_1 , fonction_1 , fonction_2

import module_interne_1
import module_interne_2
import module_interne_3_qui_a_un_nom_long as mod3
```

**Règles de nommage**
Les noms de variables, de fonctions et de modules doivent être de la forme :
```
ma_variable
fonction_test_27()
mon_module
```
c’est-à-dire en minuscules avec un caractère « souligné » (« tiret du bas » ou underscore en anglais) pour séparer les
différents « mots » dans le nom.
Les constantes sont écrites en majuscules :
```
MA_CONSTANTE
VITESSE_LUMIERE
```

Le style recommandé pour nommer les variables et les fonctions en Python est appelé snake_case. Il est différent du CamelCase utilisé pour les noms des classes et des exceptions.
Pensez à donner à vos variables des noms qui ont du sens. Évitez autant que possible les a1, a2, i, truc, toto. . . Les
noms de variables à un caractère sont néanmoins autorisés pour les boucles et les indices :
```py
ma_liste = [1 , 3 , 5 , 7 , 9 , 11]
for i in range ( len ( ma_liste )):
	print ( ma_liste [ i ])
```
Bien sûr, une écriture plus « pythonique » de l’exemple précédent permet de se débarrasser de l’indice i :
```py
ma_liste = [1 , 3 , 5 , 7 , 9 , 11]
for entier in ma_liste :
	print ( entier )

```
Enfin, des noms de variable à une lettre peuvent être utilisés lorsque cela a un sens mathématique (par exemple, les noms
x, y et z évoquent des coordonnées cartésiennes).

*Commentaires*

Les commentaires débutent toujours par le symbole # suivi d’un espace. Ils donnent des explications claires sur l’utilité
du code et doivent être synchronisés avec le code, c’est-à-dire que si le code est modifié, les commentaires doivent l’être aussi
(le cas échéant).
Les commentaires sont sur le même niveau d’indentation que le code qu’ils commentent. Les commentaires sont constitués
de phrases complètes, avec une majuscule au début (sauf si le premier mot est une variable qui s’écrit sans majuscule) et un
point à la fin.

*Conseils sur la conception d’un script*

Voici quelques conseils pour vous aider à concevoir un script Python.
— Réfléchissez avec un papier, un crayon. . . et un cerveau (voire même plusieurs) ! Reformulez avec des mots en français
(ou en anglais) les consignes qui vous ont été données ou le cahier des charges qui vous a été communiqué. Dessinez
ou construisez des schémas si cela vous aide.

— Découpez en fonctions chaque élément de votre programme. Vous pourrez ainsi tester chaque élément indépendam-
ment du reste. Pensez à écrire les docstrings en même temps que vous écrivez vos fonctions.

— Quand l’algorithme est complexe, commentez votre code pour expliquer votre raisonnement. Utiliser des fonctions (ou
méthodes) encore plus petites peut aussi être une solution.
— Documentez-vous. L’algorithme dont vous avez besoin existe-t-il déjà dans un autre module ? Existe-t-il sous la forme
de pseudo-code ? De quels outils mathématiques avez-vous besoin dans votre algorithme ?

— Si vous créez ou manipulez une entité cohérente avec des propriétés propres, essayez de construire une classe.

— Utilisez des noms de variables explicites, qui signifient quelque chose. En lisant votre code, on doit comprendre ce que
vous faites. Choisir des noms de variables pertinents permet aussi de réduire les commentaires.

— Quand vous construisez une structure de données complexe (par exemple une liste de dictionnaires contenant d’autres
objets), documentez et illustrez l’organisation de cette structure de données sur un exemple simple.

— Testez toujours votre code sur un jeu de données simple pour pouvoir comprendre rapidement ce qui se passe. Par
exemple, une séquence de 1000 bases est plus facile à gérer que le génome humain ! Cela vous permettra également
de retrouver plus facilement une erreur lorsque votre programme ne fait pas ce que vous souhaitez.

— Lorsque votre programme « plante », lisez le message d’erreur. Python tente de vous expliquer ce qui ne va pas. Le
numéro de la ligne qui pose problème est aussi indiqué.

— Discutez avec des gens. Faites tester votre programme par d’autres. Les instructions d’utilisation sont-elles claires ?
	— Si vous distribuez votre code :
	— Rédigez une documentation claire.
	— Testez votre programme.
	— Précisez une licence d’utilisation