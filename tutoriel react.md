# Tutoriel React JS

## Prerequis

- Vite ou JSX

*JSX* cest une extension de JavaScript qui nous permettra de creer ou d'utiliser des balises deja existantes du DOM HTML.

EX: `const element = <h1>Hello, world!</h1>;`

*Vite* par ailleur est une extension de JavaScript, nous permettant de creer un server local et de regrouper notre code source en un bunde de fichiers JS.
**Creer un nouveau projet NodeJS avec ViteJS**
```sh
npm create vite@latest ./
```
Installation des dependances
```sh
npm install
or
npm i
```

**Lancer le projet sur un server**
```sh
npm run dev
```

**Creer un nouveau projet NodeJS**
```sh
npm init // et suivre les instructions pas a pas
```

## SYNTAXE JSX

La syntaxe du JSX est pareille a celle du HTML, a quelques differences pres:

- L'attribut `class` sera remplace par `className`. Deplus les attributs html composes comme `classname` seront remplaces par `className`. On utilise le camelCase ici, hors mis `data-`, `aria-`
- Les elements HTML, sont obligatoirement imbriques les uns dans les autres, et n'appartienent qu'a un seul parent.

- Les proprietes sont ecrites en camelCase.

- Les proprietes de l'attribut style sont gardees dans un objet JS.

- Les balises sont forcement fermees, ou auto-fermantes.

- Chaque enfant dans une liste (li) doit avoir un attribut key avec une valeur unique.

NB: L'arborescence de notre DOM HTML est encadre par une `div`; elle peut etre remplacee par la balise `<Fragment></Fragment>` ayant pour alternatif `<></>`


### Interpolation des variables
C'est la propriete qui permet de utiliser le contenu d'une variable dans une chaine de caracteres afin de faire une concatenation:

Ex:
```jsx
const str_var = "Hello World";

function App()
{
	return <h1>{str_var}<h1/>
}
```
Ou meme d'executer une instruction JavaScript.

### Conditions
```
//code ...
{condition && code_a_executer_si_vrai}
//code ...
```
ou utiliser les ternaires
```
//code ...
{condition ? code_a_executer_si_vrai : code_a_executer_si_faux}
//code ...
```

### Fonctions (Composants)
```jsx
function MaFonction(props)
{
	var {color, children} = props;
	return <h1 style={{color: color}}>{children}</h1>
}

// a l'appel de la fonction
// ...code
<MaFonction color = "red">Hello World</MaFonction>
// ...code
```
NB: Le nom des composant est ecrit en pascal-case, c-a-d chaque nouveau mot commence par une majuscule

## Les Hooks

Ce sont des fonctions utilises a l'interieur des composants et qui ont la caracteristique de changer l'etat (status) d'une variable, afin quelle soit re-rendue a l'affichage dans pour autant recharger la page.

- Les hooks commencent tous par le mot-clef `use`
- Les hooks ne peuvent pas etre appellees dans les boucles ou les conditions
- Les fonctions de changement d'etat des hooks peuvent etre appellees plusieurs fois dans le composant
- Un composant peut avoir plusieurs hooks en son sein

## useState
```jsx
function TestComp ()
{
	const [count, setState] = useState(0) // 0 represente la valeur par defaut de `count`
// fonction de mise a jour
	const increment = ()=>
  {
    setState(count+1)
  }
	return <>
		<p> Compteur {count} </p>
		<button onClick={increment}>Incrementer</button>
	</>
}
```
La methode `useState` prend en parametre une valeur, qui represente la valeur par defaut de notre variable qui sera sujet a des modifications. Elle retourne un tableau de deux (02) valeurs, qui representent:

- `la variable sujet a des modifications`: c'est cette variable qui va subir les modifications au cours des differentes interactions des utilisateurs sur la page courante.
- `une fonction`: c'est la fonction a utiliser lorsque l'on souhaite operer des modifications des valeurs de notre variable ainsi que de remettre a jour ces modifications dans notre rendu. Cette fonction, afin quelle puisse mettre a jour les modifications, doit imperativement avoir une variable passee en parametre, differente de celle, retournee par le `useState`.

**Exemple de certains cas qui ne vont pas effectuer un rendu**:

*cas 1: La variable utilisee n'est pas encore mise a jour*
```jsx
function TestComp ()
{
	const [count, setState] = useState(0) // 0 represente la valeur par defaut de `count`
// fonction de mise a jour
	const increment = ()=>
  {
    setState(count+1) // count = 0 et 0 + 1 = 1
	setState(count+1) // count = 0 et 0 + 1 = 1 //puisque nous utilisons la valeur par defaut / actuelle de count
	setState(count+1) // count = 0 et 0 + 1 = 1
  }
	return <>
		<p> Compteur {count} </p>
		<button onClick={Incrementer}>Incrementer</button>
	</>
}
```

*Asctuce*

```jsx
function TestComp ()
{
	const [count, setState] = useState(0) // 0 represente la valeur par defaut de `count`
// fonction de mise a jour
	const increment = ()=>
  {
    setState((count)=>count+1) // count = 0 et 0 + 1 = 1
	setState((count)=>count+1) // count = 1 et 1 + 1 = 2
/*
il faut noter qu'ici count et count sont differents car ils n'appartiennent pas au meme context.
L'un est dans setCount et l'autre est un peu plus global
*/
  }
	return <>
		<p> Compteur {count} </p>
		<button onClick={Incrementer}>Incrementer</button>
	</>
}
```

*cas 2: La mutation des objets*
```jsx
function TestComp ()
{
	const [person, setState] = useState({nom: "Moussa", age: 25})
// fonction de mise a jour
	const incrementage = ()=>
  {
	person.age++
    setState(person)
/*
la variable person est la meme que celle retournee par le
 useState, du point de vue de son adresse en memoire;
 il n'y aura donc pas de changements
*/
  }
	return <>
		<p> Nom: {person.nom} </p>
		<p> Age: {person.age} </p>
		<button onClick={incrementage}>Incrementer l'age</button>
	</>
}
```

*Astuce*
```jsx
function TestComp ()
{
	const [person, setState] = useState({nom: "Moussa", age: 25})
// fonction de mise a jour
	const incrementage = ()=>
  {
    setState({...person, age: person.age++}) //creation d'un nouvel objet person
/*
la variable person est la meme que celle retournee par le
 useState, du point de vue de son adresse en memoire;
 il n'y aura donc pas de changements
*/
  }
	return <>
		<p> Nom: {person.nom} </p>
		<p> Age: {person.age} </p>
		<button onClick={incrementage}>Incrementer l'age</button>
	</>
}
```

### Les formulaires
*Recuperer la valeur d'un champ*
```jsx
const [value, setState] = useState("Nikiema")

const handleChanges = (e)=>
{
	setState(e.target.value)
}

<form>
	<input value={value} onChange={handleChanges} type="text" />
</form>

```
> L'inconvenient avec cette facon de proceder est qu'a chaque fois que l'on saisit dans le champ ou qu'il y a une modification, on actualise le composant entier; cela peut etrainer la lenteur ou la baisse des performances de l'application.

*Astuce: Ne pas utiliser de `useState`, et recuperer la valeur des champs du formulaire a l'envoi du formulaire*
```jsx
  const handleSubmit = (e)=>
{
	e.preventDefault()
  var formData = new FormData(e.target)
  console.log(formData.get("username"))
	
}
return <form onSubmit={handleSubmit}>
	<input defaultValue="default" name="username" type="text" />
	<button> submit </button>
</form>
}
```

## Transmission des donnees inter-composants:
En React, les composants communiquent entre eux, c'est-a-dire que les informations des du composant peuvent etre transmises d'un composant a l'autre. Nous pouvant avoir plusieurs relations entre les composants notament, **parent-enfant**, **enfant-parent**, ...

*parent-enfant*
```jsx
function App() {
  return <>
    <form>
      <TermsAndConditions checked={true}/> 
      {/*  l'etat de l'enfant est directement choisi par le parent
          mais il est impossible de faire remonter l'information (l'etat du checkbox) de l'enfant vers le parent
       */}
      <br />
      <button>Envoyer</button>
    </form>
  </>
}

function TermsAndConditions(props)
{
  const {checked} = props
  return <>
    <input type="checkbox" checked={{checked}} /><span>Accepter les termes et conditions d'utilisation</span>
  </>
}
```

*enfant-parent*
```jsx
function App() {
  const [checked, setState] = useState(false)
  return <>
    <form>
      <TermsAndConditions checked={checked} onChange={setState}/> 
      {/*  on ajoute une nouvelle propriete, qui servira de callback
          ce callback se chargera de mettre a jour le status du checkbox
       */}
      <br />
      <button>Envoyer</button>
    </form>
  </>
}

function TermsAndConditions(props)
{
  const {checked, onChange} = props
  return <>
    <input type="checkbox" checked={checked} onClick={(e)=>onChange(e.target.checked)} /><span>Accepter les termes et conditions d'utilisation</span>
  </>
}
```

## useEffect
C'est un hook qui utilise pour effectuer un fonction, dependant des changements d'etat d'une variable.
Il permet d'isoler l'execution d'un script, par rapport au reste du code.
```jsx
function App()
{
  const [showInput, setShowInput] = useState(false)
  return <>
  <input type="checkbox" name="chkbx" id="" checked={showInput} onChange={(e)=>setShowInput(!showInput)}/> Afficher le champ titre
  {showInput && <EditTitle />}
  </>
}

function EditTitle()
{
  const [title, setTitle] = useState("")
  const [firstName, setFirstName] = useState("")

  console.log("render") // ce console.log est appelle a chaque fois que le state de title ou de firstName change


  useEffect(()=>
  {
	 console.log("title) // n'est appelle que quand c'est le title qui change
    document.title = title // l'instruction est alors isolee
  }, [title])

  return <div>
    <input 
      type="text"
      value={title}
      onChange={(e)=>setTitle(e.target.value)} />
      <br />
      <br />
    <input 
      type="text"
      value={firstName}
      onChange={(e)=>setFirstName(e.target.value)} />
  </div>
}
```

Un petit resume:
```jsx
useEffect(()=>{
// instructions a executer apres avoir rendu le composant
})
useEffect(()=>{
// instructions a executer apres avoir rendu le composant
},
 [stateVar1, ..., stateVarx]) // s'execute si un des stateVar a change
useEffect(()=>{
// instructions a executer apres avoir rendu le composant
}, []) // <==> componentDidMount()
useEffect(()=>{
// instructions a executer apres avoir rendu le composant...
 	return function()
	{
		// statements to execute when the component is unmount
	}
}, []) // <==> componentWillUnmount()
```


> NB: Il faut eviter de mettre directement les `setState` dans le `useEffect`, car cela pourrait creer une boucle infinie.

## useMemo

A l'instar de `useEffect`, le `useMemo`, s'utilise afin d'ameliorer les performances de notre application. Il permet d'executer des instructions, s'il y a changements d'etat, sur une variable precise et uniquement.
La difference avec le `useEffect` est que le `useMemo` retourne une valeur qui sera stockee dans une variable, pendant que l'autre ne retourne rien.

```jsx
function App()
{
  const [name, setName] = useState("")
  const [password, setPassword] = useState("")
  var strength = useMemo(()=>setStrength(password), [password])
  return <>
      <input type="text" placeholder="name" value={name} onChange={(e)=>setName(e.target.value)}/><br />
      <input type="text" placeholder="password" value={password} onChange={(e)=>setPassword(e.target.value)}/>
      <br />
      {strength}
  </>

  function setStrength(password)
  {

    // fausse lenteur
    var startTime = performance.now()

    while(performance.now() - startTime  < 200)
    {

    }
    var len = password.length
    var strenght = ""

    if(len>5 && len <= 10)
    {
      strength = "Moyen"
    }
    else if (len > 10)
    {
      strength = "Fort"
    }
    else
    {
      strength = "Faible"
    }

    return strength
  }
}
```

## useRef
C'est le hook qui est utilise pour faire reference a des elements HTML:
```jsx
function App()
{
  const [name, setName] = useState("")
  const ref = useRef(null)
  useEffect(()=>
  {
    console.log(ref.current)
  }, [])

  return <>
      <input ref={ref} type="text" placeholder="name" value={name} onChange={(e)=>setName(e.target.value)}/><br />
  </>
}
```
En Js, les objets du DOM peuvent être référencés par le nom de classe, l'id ou le nom de la balise.
Dans react, ils peuvent également être référencés par le mot-clé `ref`, de sorte qu'un événement sur un autre élément du DOM (comme un bouton), appelle les références.
dans le DOM (comme un bouton), appelle les références.
