# GIT

**Introduction**

- enregistrer les changements effectues sur le code

- enregistrer les auteurs des differentes modifications

- outil de collaboration

*Mode de fonctionement*

- initialiser Git sur un dossier, fait de ce dernier, un `depot git` ou un `repository`.

- cree un nouveau dossier cache, afin d'enregistrer les differentes modifications sur le dossier

- possibilite de creer plusieurs versions du code, appellees branches (branch en anglais), qui fonctionnent en parallele

- possibilite de faire des commits, qui sont des moyen de valider l'etat actuel du code.

**Version**

```sh
git --version
```

**Configuration**
```sh
git config --global user.name "username"
git config --global user.email "email@"
```

**Initialisation d'un nouveau projet**

```sh
git init
```

**Status**

```sh
git status
```

**Ajout de nouveaux fichiers au projet**

```sh
git add nom_fichier.ext # ajout d'un fichier precis
git add * # ajout de tous les fichiers
git add nom_fichier.* # ajout de tous les fichiers portant le nom `nom_fichier`, quelque soit l'extension
git add *.ext # ajout de tous les fichiers portant l'extension precisee
git add --all
# ou 
git add * # ajoute tous les nouveaux fichiers au repertoire 
```

**Commit**
```sh
git commit -m "message" # cree un nouveau commit
git commit -a -m "message" # ajoute les fichiers recents au depot, puis execute un nouveau commit
```

**Status ++**
```sh
git status
git status --short
```

```
? ficihiers non trackes
A fichiers trackes
M fichiers modifies
D fichiers modifies
```

**Log**

```sh
git log 
```

**Help**

```sh
git <command> -help # permet de voir l'usage d'une commande si elle existe
git help --all # affiche toutes les commandes disponible
```

**Branches**

Imaginons que vous ayez un projet de grande envergure et que vous deviez en actualiser la conception.

Comment cela se passerait-il sans et avec Git ?

*Sans Git* :

	- Faites des copies de tous les fichiers pertinents pour éviter d'impacter la version en cours.

	- Commencez à travailler sur la conception et découvrez que le code dépend du code d'autres fichiers, qui doivent également être modifiés !

	- Faites également des copies des fichiers dépendants. Assurez-vous que chaque fichier dépendant fait référence au nom de fichier correct.

	- URGENCE ! Il y a une erreur sans rapport avec le projet qui doit être corrigée le plus rapidement possible !

	- Sauvegardez tous vos fichiers, en notant les noms des copies sur lesquelles vous travailliez.
    
	- Travaillez sur l'erreur sans rapport avec le projet et mettez à jour le code pour la corriger.

	- Revenez à la conception et terminez le travail à cet endroit.

	- Copiez le code ou renommez les fichiers, de manière à ce que la conception mise à jour se retrouve sur la version en ligne. (2 semaines plus tard, vous réalisez que l'erreur non liée n'a pas été corrigée dans la nouvelle version du design parce que vous avez copié les fichiers avant la correction)

*Avec Git* :

    - Avec une nouvelle branche appelée new-design, modifiez le code directement sans impacter la branche principale.

	- URGENCE ! Il y a une erreur sans rapport avec le projet qui doit être corrigée le plus rapidement possible !
    
	- Créez une nouvelle branche à partir du projet principal appelée small-error-fix
    
	- Corrigez l'erreur non liée et fusionnez la branche small-error-fix avec la branche principale.
    
	- Vous retournez à la branche new-design, et vous y terminez le travail.

	- Fusionnez la branche new-design avec la branche principale (en étant alerté de la petite erreur que vous avez corrigée).

```sh
git branch <nom_branch> # cree une nouvelle branche
git branch # affiche toutes les branches disponible
git checkout <nom_branch> # change de branche
```

Les branches vous permettent de travailler sur différentes parties d'un projet sans avoir d'impact sur la branche principale.

Lorsque le travail est terminé, une branche peut être fusionnée avec le projet principal.

Vous pouvez même passer d'une branche à l'autre et travailler sur différents projets sans qu'ils n'interfèrent les uns avec les autres.

Les branches dans Git sont très légères et rapides !

**Merge**

```sh
git checkout master # repars sur la branche principale
git merge <nom_branche> # fusionne la branche secondaire a la branche principale
```

**Suppression d'une branche**

```sh
git branch -d <nom_branche> # supprime la branche precisee
```

**Log**

```sh
git log # affiche les differents commits effectues
git log --graph # affiche les logs sous forme de graph
git log --oneline # affiche les logs en une ligne
git log --all # affiche tous les logs
git log --graph --online --all # combine les differents commits en combinant les options precendentes
```

**Git revert**: cree un nouveau commit
```sh
git revert <hash du commit>
git revert HEAD # repart sur le dernier commit
```

**Git reset**: supprime le commit de la liste des commits
```sh
git reset  <hash du commit>
```


**Git remote**
```sh
git remote add origin <lien_du_repo>
```

Cree une sorte de tunnel de communication entre le repository en ligne et celui en local

**Git Push**
```sh
git push --set-upstream origin master # precise sur quelle branche nous souhaitons faire les interactions
git push # effectue un push et fusion la branche principale par defaut en ligne a la branche definie en local

```

**Git fetch**
```sh
git fetch origin # recupere le contenu du repo en ligne
```

**Git pull**

Apres avoir recupere le contenu d'un depot, il faut le fusionner a une des branches en local.
`git pull <=> git push + git merge`
```sh
git pull origin
```

**Git clone**
```sh
git clone <lien_du_repo>
```