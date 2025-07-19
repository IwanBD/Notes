---
tags: [dart]
title: DART
created: '2022-06-11T00:04:49.323Z'
modified: '2022-06-14T23:00:47.262Z'
---

# **DART**

# start of dart program
```sh
void main()
{
    //statements goes here
}
```
# Comments
```sh
// -> monoline Comments
/* */ -> multinline comments
```
# print a text in the console
```print(text);```
# Math operations
> (basic operations works like in other languages)
```
special operations:
print(4/3) -> will show 1.3333333
print(4~/3) -> will show 1
```
# Data type
- int: integers
- double: decimal numbers
- num: integers & decimal numbers
- bool: booleans
- String: characters
- List: lists
- var: creates the type of the data automatially regarding to the type of data to which it is assigned to
- dynamic: creates the variable like var, but the data type could be changed along the program
> NB: in Dart, variables type are not interchangeable excepted those declared with the type 'dynamic'
    data in dart are objects

# Variable declaration
syntax:
```
type varName;
//or
type varName = value;
```
# Constants
> Constants are variables that among which the values does not change along the execution of the program.
syntax:
```
const constName = value;
//or
final constName;
// some statments
constName = value;
```
> NB: 
- the difference between const and final is that with const, we know the constant value to assign in before the end,
but final is the inverse
- Type inference: refers to automatic detection of the type of an expression

# Data Conversion
- from numeric to string:
    varName.toString()
- from string to double
    double.parse(varName)
- from string to int
    int.parse(varName)

# Strings
-Concatenation
    newVar = string1 + string2, string3
-interpolation
    newVar = "... $string1"
- Multiline Strings
    str = '''
    ...
    ...
    ...
    '''
> NB: we can use interpolation of expression like so:
    "${expression}"

# operators order of precedence
    1. !
    2. => > < <=
    3. == !=
    4. &&
    5. ||
# Conditions
- if statements
syntax:
```
if(condition)
{
    //statements
}
else if(condition)
{
    //statements
}
else
{
    //statements
}
```
- ternary
syntax:
```
(condition) ? statementsIfTrue : statementsIfFalse
```

- switch
```
switch(variable)
{
    case value1:
    //statements
    break;
    case value2:
    //statements
    break;
    case value3:
    //statements
    break;
    default:
    //statements
}
 ```

# Loops
- while
    syntax: 
```
while(condition)
{
    // statements
}
```
- do while
    syntax:
```
do
{
    // statements
}while(condition)
```
- for
    syntax:
```
for(intialisation; condition; action)
```
- forEach
    syntax: 
```
iterableVar.forEach(callback)
```
> NB: the iterableVar should be a list
# Functions
syntax:

```
returnType functionName(type parameter1, type parameter2)
{
    //statements
}
// with optional parameters
returnType functionName(type parameter1, type parameter2, [type optionalParamerter])
{
    //statements
}
//with default values
returnType functionName(type parameter1 = defaultValue1, type parameter2 = defaultValue2)
{
    //statements
}
//with named parameters
returnType functionName({type parameter1, type parameter2})
{
    //statements
}
//with optional named parameters
returnType functionName(type parameter1, {type parameter2})
{
    //statements
}
//anonymous functions
(parameters)
{
    //statements
}
//arrow functions
returnType functionName (type parameter1, type parameter2) =>//actions
(type parameter1, type parameter2)=>//actions
```

> NB: when we have opt params, compulsory parameters must come in first place
    anonymous and arrow functions can be returned by other functions and can be assigned to variables like in JS
    There is a special type of variables to which are assigned functions:
    ex:
```
Function add = (int param1, int param2)
{
    return param1 + param2
}
```
> In arrow functions the actions should only be one statement

# OOP
### It is a specific way of designing a program
### It allows us to think of data n our program in terms of real world objects, with both properties and behaviours

- class: a user-defined type that describes what a certain type of object will contain and how it will behave
object: it is an instance of a class

- creation of a class:
```
class ClassName
{
    //class variables
    //class methods
}
```
-  instanciation of a class:
```
ClassName classObj = ClassName();
//or
var classObj = ClassName();
```
- accessing to a property
```classObj.classVariable```
- modify a class properties
```classObj.classVariable = newValue;```
- define a class variable
> NB: It must be done inside the definition of the class
syntax:
```type varName = value;```
- define a class function (method):
> NB: It must be done inside the definition of the class
syntax:
```
returnType MethodName(type param)
{
    //statements
}
```
> NB: the keyword "@override" is used as a reference for the developer so that he knows the current methods does not belong to the current class
    but to a superclass
    
- Cascade NOTATION
    It allows us to save time, and avoid to write many times the name of the class when we are updating its properties
    syntax:
```
//instead of ...
    var classObj = ClassName();
    classObj.prop1 = newVal1;
    ...
    classObj.propn = newValn;
//we may proceed like that ...
    var classObj = ClassName()
    ..prop1 = newVal
    ..propn = newValn;
```
> NB: It is only the last property that ends with the ";"
# Constructors
 - **constructors**: they are a methods that creates or constructs objects of a class.
> NB: In Dart, they have the same name of the class.
    By default each owned created class has a default constructor (a constructor that either has no parameter, or if it has parameters, all of them has the defaul value)
 - **generative constructor**: it is a constructor that takes parameters to initialize the properties of class
syntax:
```
className(type param1, ..., type paramn)
{
    this.prop1 = param1;
    ...
    this.propn = paramn;
}
// or
ClassName(this.prop1, ..., this.propn);
//or
ClassName(param1, ..., paramn):
this.prop1 = param1,
this.prop2 = param2,
...
this.propn = paramn;
```
 - **named constructors**:
    In Dart, two methods cannot have the same name, even if they have different parameters. Two constructors cannot 
    have the same name either. If we would like more than one way to construct an object at initialization time, we need 
    to use named constructors. Named constructors are regular constructors that also have an identifier associated with 
    them. Perhaps we have a class Temperature that maintains a temperature in Kelvin degrees. It has three constructors. 
    One is for creating a Temperature with a number already in degrees Kelvin. The other two are for converting from 
    Celsius or Fahrenheit.
    Ex:
```
class Temperature 
{
    double degreesKelvin;
    Temperature(this.degreesKelvin);
    Temperature.fromCelsius(double degreesCelsius) 
    {
        degreesKelvin = degreesCelsius + 273.15;
    }
    Temperature.fromFahrenheit(double degreesFahrenheit) 
    {
        degreesKelvin = 5 / 9 * (degreesFahrenheit – 32) + 273.15;
    }
}
```
 - Forwarding constructor
    syntax:
  ```ClassName.identifierName(): this(defaultValue1, ..., defaultValuen);```

# Encapsulation
- protect a property:
    syntax:
  ```type _prop = value;```
> NB: in dart, the private term means that the variable is accessible inside the file where the class has been created.

# Assertions
an assertion is a statement to check wheter a parameter respects certain conditions before assigning it to the class variable
syntax:
  ```assert(condition);```

# Constant Constructor
The class variables must be declared with the keyword final
The constructor must be followed by the keyword const
syntax:
```
class ClassName
{
    final type prop1;
    ...
    final type propn;

    const ClassName(this.prop1, ..., this.propn);
}
```
> NB: The advantage of such class, it that all instances having the same parameters will be
    considered by dart as one and one single instance. So, no more space will be allocated to the creation of clones.
    Moreover, the variables declared with the keyword final have their scoop reduced to protected-like.
    They are therefore unmuttable, once we have done an affectation operation on them.
# Getters & Setters
- Getters
syntax:
```
returnType get getterName => property;
```
- call a getter
syntax:
```
var x = className.getterName;
```
- Setters
syntax:
```
set setterName(String newValue) => property = newValue;
```
- call a setter
syntax:
```
className.setterName = newValue;

```
# Static Members
static member: it is property or method that belongs to a class, rather than to the class instances. They remain always the same, regardless of how and where they are used.
syntax:
```
//for the variable
static type prop = value;
//for the static method
static void StaticMethName(type parameter)
{
    // statements
}
```       
- access to the static property
syntax:
```
//for the variable
var x = ClassName.staticProp;
//for the static method
ClassName.StaticMethName(arg);
```
# Nullability & Null-Safety 
NB: in Dart, primitive types can not be null.
    To declare a variable that may be null (or that can take null as one of its value) we have to do the following:
    ```type? varName = defaultalue;```

# Null aware operators 
- if null (??)
EX:
```
String? name;
if (name == null)
{
    name = defaultalue;
}
//can be resumed as :
String? name;
username = name ?? defaultalue;
//but if we had make like this, we will get an error (Solution: null aware assignment)
String? name = "Emmanuel";
username = name ?? defaultalue;
```
- null-aware assignment
EX:
```
String? name;
name ??= defaultalue;
username = name;
```
- null-aware access
it is mainly used when we want to acces to a property of a variable that may be null (since null does not have shch property)
syntax:
```
variable?.property;
```
Ex:
```
String? name = 'Emmanuel';
print(name.length); // will throw an exeption
print(name?.length); //will work perfeclty
```

# Lists
- declaration:
1. with default values
var list = ["value1", ..., "valuen"];
2. with default type
var list = <type> [];
3. unmuttable:
var list = List.unmodifiable(["value1", ..., "valuen"]);
> NB: The all data contained in the list should be instances of the defined type
- get the index of an item in a List
```var x = list.indexOf(item)```;
- add new value to a list
```list.add(newValue)```;
- remove an element to a list
```list.remove(item)```;
> NB: it removes the first occurence
- remove an item from its index:
```list.removeAt(index)```;
- other usefull properties
**list.isEmpty**: returns a boolean saying wheter or not if the list is empty
**list.isNotEmpty**: returns a boolean saying wheter or not if the list is empty
**list.first**: returns the first element of a list
**list.last**: returns the last element of a list
- for in loop
syntax:
```
for(var item in list)
{
    //statements
}
```
- forEach loop
syntax:
```
list.forEach((item)
{
    //statements
})
//or 
list.forEach(callback);
```
NB: Dart supports spread operators like in js.
- collection if
It permits to insert new elements to list when a condition is reached
syntax:
       var list = ["value1", ..., "valuen", if(condition) newElementToAdd];
- collection forIt allows to perform some actions in order to modified the content of a new list inheriting from another
(like map in JS).
syntax:
```
var list = [
    for(var item in list)
    {
        //statements
    }
]
```
# Sets & Maps
## Sets
- declaration
1. with default values
```var setName = {val1, ..., valn};```
2. With default type
```
final Set <type> setName = {};
//or
var setName = <type> {}
```
NB: it stores only one occurence of an item
- check the content of a set
**setName.contains(item)**: returns true when the item is an element of the set and false when not found
- add new value to a set
```
setName.add(newValue);
//or to add multiple elements
setName.addAll([item1, ..., itemn]);
```
- remove an element to a set
setName.remove(item);
> NB: it removes the first occurence
- intersection
it returns a new set contains all the same time the content of two Sets
```set1.intersection(set2);```
- union
concatenates two sets and returns it
````set1.union(set2);````
## Maps
they are like objects in JS or dict in python
- declaration
```
final Map <keyType, valueType> mapName = {};
//or
final mapName = <keyType, valueType>{};
```
var mapName = {};
- initialization
```var mapName = {key1: value1, ..., keyn: valuen};```
- accessing an element of a map
```var x = mapName[key];```
- add new elements in a map
```mapName[newKey] = value;```
- remove an item in a map
```mapName.remove(key);```
- check if a key exists
```mapName.containsKey(key);```
- check if a value exists
```mapName.containsValue(value);```
- access to the keys
```mapName.keys;```
- access to the values
```mapName.values```
- loop through a map
```
for(var key in mapName.keys)
{
    //statements
}
//or
mapName.forEach((key, value)
{
    //statements
})
//or 
for(final entry in mapName.entries)
{
    // entry.key => to have access to the key
    // entry.value => to access to the value
}
```
- cast an iterable item to a list
var x = varName.toList();
- cast an iterable item to a set
var x = varName.toSet();
# Higher Order Functions 
They are functions that take as param another function, or returns a new one.
- **collection.map(callback)**: runs the callback function at each loop an returns a new collection
- **collection.where(element => condition)**: returns a new collection, with content that respects the condition.
                                            The call function must only return a boolean.
- **collection.reduce((a, b)=>a+b)**: consolidates all elements of a collection, in our case, it sums up all elements
- **collection.fold(***************)**
- **list.sort(): sorts a list**

# Inheritance 
syntax:
```
        class ChildClassName extends superclass
        {
            ChildClassName(type param)
            {
                super(param)
            }
        }
 ```       
> NB: when we will have to call a method, or a property of the superclass, we can do like the following:
```
var x = super.property;
super.method();
```
- check if an object is instance of another class
**subclass is className**: returns a boolean

# Abstract class 
It is class that can not be instanciated and must have at least one abstract method.
It is a class of ideation.
an abstract method is a method that has not a body (no statements), only composed of its signature.
syntax:
```
abstract class AbstClassName
{
    type vraible;
    type MethodName();
    //statements
}
```
> NB: all methods declared in the abstract class must be developped in each class implementing it.
    an abstract class can have properties.
    If an instance is defined having the type of the high level class, the properties of the inheriting class
    are not callable on the instance.
    EX:
```
Animal duck = Duck()
duck.layEggs() //will throw an exception since the layEggs() is not defined in the Animal class.
```

- Inheritance
```
class className extends AbstClassName
{
    //statements
}
```
# Mixins 
They allows to used properties and method of a class in other one, both without being related.

syntax:
```
mixin MixinName
{
    type MethodName()
    {
        //statements
    }
}

class ClassName extends AnotherClass with MixinName
{
    //statements
}
```
# Futures 
They allow us to reschedule tasks to be executed in the futur.
The different states of a scheduled task are:
- uncommpleted
- completed with a value
- completed with an error
syntax:
```
    Futures <datatype> identifier;
    //explicitly
    Future.delayed(Duration(seconds: x), () => variable).
    then((returnedVariable)
    {
        //statements when everythging goes well
    }).
    catchError((error)
    {
        //statements when a error occures
    }).
    whenComplete(()
    {
        //statments when the task is completed - it is executed whether the results of the task
    });

    //other mean

    type functionName() async
    {
        final varName = await Furture.delayed(Duration(seconds: sec), ()=>variable);
        print('the variable returned value is $variable');
    }
```
# Handling Errors 
```
try
{
    //statements that may rise an error
}
catch(error)
{
    //statments to perform when an error occures
}
finally
{
    // statments to perform whenever an error occures or not
}
```

- throw an exception

```
throw Exception(messageDescribingError);
```
