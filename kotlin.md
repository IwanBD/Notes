# **KOTLIN CHEAT SHEET**

# Basic Program Structure
```kotlin
fun main() {
    // statements go here
}
```

# Comments
```kotlin
// -> single-line comments
/* */ -> multi-line comments
/** */ -> KDoc comments (documentation)
```

# Print to Console
```kotlin
println(text)    // with new line
print(text)      // without new line
```

# Math Operations
```kotlin
// Basic operations work like in other languages (+, -, *, /)
// Special operations:
println(4/3)     // will show 1.3333333333333333 (returns Double)
println(4/3.0)   // will show 1.3333333333333333 (returns Double)
println(4 div 3) // will show 1 (integer division)
println(4 % 3)   // will show 1 (remainder/modulo)
```

# Data Types
- `Int`: integers
- `Double`: decimal numbers (64-bit)
- `Float`: decimal numbers (32-bit)
- `Long`: large integers (64-bit)
- `Short`: small integers (16-bit)
- `Byte`: very small integers (8-bit)
- `Boolean`: booleans (`true`/`false`)
- `Char`: single characters
- `String`: characters
- `Array`: arrays
- `List`: lists
- `Set`: sets
- `Map`: maps/dictionaries

> NB: In Kotlin, all variables are objects, even primitive types

# Variable Declaration
```kotlin
// Mutable variables (can be reassigned)
var varName: Type = value
var varName = value  // Type inference

// Immutable variables (cannot be reassigned)
val valName: Type = value
val valName = value  // Type inference

// Late initialization (must be initialized before use)
lateinit var varName: Type

// Nullable types
var varName: Type? = value
```

> NB: Kotlin has type inference, so explicit type declaration is often optional

# Constants
```kotlin
// Compile-time constants (must be primitive types or String)
const val CONST_NAME = value

// Runtime constants (can be any type)
val constName = value
```

> NB: `const` values must be assigned at compile time and can only be used at the top level or within objects (not in functions)

# Data Conversion
```kotlin
// From numeric to string
numVar.toString()

// From string to number types
stringVar.toInt()
stringVar.toDouble()
stringVar.toLong()
stringVar.toFloat()

// Alternative numeric parsing (with exception handling)
stringVar.toIntOrNull()
stringVar.toDoubleOrNull()
```

# Strings
```kotlin
// String concatenation
val newStr = str1 + str2 + str3

// String interpolation
val newStr = "Hello, $name"
val newStr = "Result: ${2 + 2}"

// Multiline strings
val multilineStr = """
    This is a
    multiline string
    without escape characters
""".trimIndent()

// String operations
str.length          // String length
str.uppercase()     // Convert to uppercase
str.lowercase()     // Convert to lowercase
str.trim()          // Remove whitespace
str.split(",")      // Split string into list
str.startsWith("A") // Check if starts with "A"
str.endsWith("Z")   // Check if ends with "Z"
str.contains("text")// Check if contains "text"
str.replace("old", "new") // Replace text
```

# Operators and Precedence
Standard operator precedence applies:
1. Unary operators (`!`, `++`, `--`)
2. Multiplicative operators (`*`, `/`, `%`)
3. Additive operators (`+`, `-`)
4. Comparison operators (`>`, `<`, `>=`, `<=`)
5. Equality operators (`==`, `!=`)
6. Logical AND (`&&`)
7. Logical OR (`||`)

# Conditions
```kotlin
// If statements
if (condition) {
    // statements
} else if (otherCondition) {
    // statements
} else {
    // statements
}

// Ternary-like expression (Kotlin uses if-else as expression)
val result = if (condition) valueIfTrue else valueIfFalse

// When expression (similar to switch in other languages)
when (variable) {
    value1 -> { /* statements */ }
    value2, value3 -> { /* statements */ }
    in range -> { /* statements */ }
    is Type -> { /* statements */ }
    else -> { /* statements */ }
}

// When as expression
val result = when (variable) {
    value1 -> resultValue1
    value2 -> resultValue2
    else -> defaultResult
}

// When without argument
when {
    condition1 -> { /* statements */ }
    condition2 -> { /* statements */ }
    else -> { /* statements */ }
}
```

# Loops
```kotlin
// For loop with range
for (i in 1..10) {
    // statements
}

// For loop with step
for (i in 1..10 step 2) {
    // statements
}

// For loop in reverse
for (i in 10 downTo 1) {
    // statements
}

// For loop with until (excludes end value)
for (i in 0 until 10) {
    // statements
}

// For loop with collection
for (item in collection) {
    // statements
}

// While loop
while (condition) {
    // statements
}

// Do-while loop
do {
    // statements
} while (condition)

// ForEach
collection.forEach { item ->
    // statements
}

// ForEachIndexed
collection.forEachIndexed { index, item ->
    // statements
}
```

# Functions
```kotlin
// Basic function
fun functionName(param1: Type1, param2: Type2): ReturnType {
    // statements
    return value
}

// Single-expression function
fun add(a: Int, b: Int): Int = a + b

// Function with default parameters
fun greet(name: String = "World"): String {
    return "Hello, $name!"
}

// Named arguments
fun createUser(name: String, age: Int, isAdmin: Boolean) {}
// Call with named arguments
createUser(name = "John", age = 25, isAdmin = false)

// Variable number of arguments (vararg)
fun sum(vararg numbers: Int): Int {
    return numbers.sum()
}

// Extension functions
fun String.addExclamation(): String {
    return this + "!"
}
// Usage: "Hello".addExclamation() returns "Hello!"

// Infix functions
infix fun Int.times(str: String): String {
    return str.repeat(this)
}
// Usage: 3 times "Hello" returns "HelloHelloHello"

// Higher-order functions (functions that take functions as parameters)
fun operateOnNumbers(a: Int, b: Int, operation: (Int, Int) -> Int): Int {
    return operation(a, b)
}

// Lambda expressions
val sum = { a: Int, b: Int -> a + b }

// Function reference
val doubleFunc = ::double
```

# Object-Oriented Programming
```kotlin
// Class definition
class ClassName(val prop1: Type1, var prop2: Type2) {
    // Properties
    val immutableProp: Type = value
    var mutableProp: Type = value
    
    // Secondary constructor
    constructor(param: Type): this(defaultValue1, defaultValue2) {
        // initialization code
    }
    
    // Initialization block
    init {
        // initialization code
    }
    
    // Methods
    fun methodName(param: Type): ReturnType {
        // statements
        return value
    }
}

// Create instance
val obj = ClassName(value1, value2)

// Access property
val x = obj.prop1

// Update property
obj.prop2 = newValue
```

# Constructors
```kotlin
// Primary constructor
class Person(val name: String, var age: Int)

// Primary constructor with init block
class Person(val name: String) {
    var age: Int
    init {
        age = 0
    }
}

// Secondary constructor
class Person {
    val name: String
    var age: Int
    
    constructor(name: String, age: Int) {
        this.name = name
        this.age = age
    }
    
    constructor(name: String): this(name, 0)
}

// Private constructor
class Singleton private constructor() {
    companion object {
        val instance = Singleton()
    }
}
```

# Encapsulation
```kotlin
class Person {
    // Private property
    private val _id: Int = generateId()
    
    // Getter
    val id: Int
        get() = _id
    
    // Custom getter and setter
    var name: String = ""
        get() = field.uppercase()
        set(value) {
            if (value.isNotBlank()) {
                field = value
            }
        }
}
```

> NB: In Kotlin, fields are private by default and accessors (getters/setters) are generated automatically

# Null Safety
```kotlin
// Nullable type
var name: String? = "John"
name = null  // Valid

// Non-nullable type
var name: String = "John"
// name = null  // Compile error

// Safe call operator
val length = name?.length  // Returns null if name is null

// Elvis operator (null coalescing)
val length = name?.length ?: 0  // Returns 0 if name is null

// Not-null assertion
val length = name!!.length  // Throws NullPointerException if name is null

// Smart cast
if (name != null) {
    // name is treated as non-null String within this scope
    val length = name.length
}

// Safe cast
val value: Any = "Hello"
val str: String? = value as? String  // Returns null if cast fails
```

# Collections
## Lists
```kotlin
// Immutable list
val immutableList = listOf("a", "b", "c")

// Mutable list
val mutableList = mutableListOf("a", "b", "c")

// ArrayList
val arrayList = ArrayList<String>()

// Empty list with specified type
val emptyList = emptyList<String>()

// Access element
val item = list[0]

// Add element (mutable lists only)
mutableList.add("d")

// Remove element (mutable lists only)
mutableList.remove("a")

// Check if list contains element
list.contains("b")  // or "b" in list

// List size
list.size

// First and last elements
list.first()
list.last()

// List operations
list.indexOf("b")
list.filter { it > 10 }
list.map { it * 2 }
list.sorted()
list.forEach { println(it) }
```

## Sets
```kotlin
// Immutable set
val immutableSet = setOf(1, 2, 3)

// Mutable set
val mutableSet = mutableSetOf(1, 2, 3)

// HashSet
val hashSet = hashSetOf(1, 2, 3)

// Add element (mutable sets only)
mutableSet.add(4)

// Remove element (mutable sets only)
mutableSet.remove(1)

// Set operations
set1.union(set2)
set1.intersect(set2)
set1.subtract(set2)
```

## Maps
```kotlin
// Immutable map
val immutableMap = mapOf("a" to 1, "b" to 2)

// Mutable map
val mutableMap = mutableMapOf("a" to 1, "b" to 2)

// HashMap
val hashMap = hashMapOf("a" to 1, "b" to 2)

// Access value
val value = map["a"]

// Add or update entry (mutable maps only)
mutableMap["c"] = 3

// Remove entry (mutable maps only)
mutableMap.remove("a")

// Check if key exists
map.containsKey("a")  // or "a" in map

// Check if value exists
map.containsValue(1)

// Access keys and values
map.keys
map.values

// Loop through map
for ((key, value) in map) {
    println("$key -> $value")
}

// Map operations
map.forEach { (key, value) -> println("$key -> $value") }
map.filter { (_, value) -> value > 10 }
map.map { (key, value) -> key to value * 2 }
```

# Functional Programming
```kotlin
// Lambda expressions
val sum = { a: Int, b: Int -> a + b }

// Collection operations
val numbers = listOf(1, 2, 3, 4, 5)

// Map (transform each element)
val doubled = numbers.map { it * 2 }

// Filter (select elements that match condition)
val even = numbers.filter { it % 2 == 0 }

// Find (returns first element matching condition or null)
val found = numbers.find { it > 3 }

// Any (returns true if at least one element matches condition)
val hasEven = numbers.any { it % 2 == 0 }

// All (returns true if all elements match condition)
val allPositive = numbers.all { it > 0 }

// Count (counts elements that match condition)
val evenCount = numbers.count { it % 2 == 0 }

// Reduce (combines elements)
val sum = numbers.reduce { acc, i -> acc + i }

// Fold (combines elements with initial value)
val sumPlusTen = numbers.fold(10) { acc, i -> acc + i }

// GroupBy (groups elements by key)
val grouped = listOf("apple", "banana", "cherry").groupBy { it.first() }

// Flatten (flattens nested collections)
val nested = listOf(listOf(1, 2), listOf(3, 4))
val flat = nested.flatten()

// FlatMap (maps and flattens in one operation)
val chars = listOf("abc", "def").flatMap { it.toList() }
```

# Inheritance
```kotlin
// Open class (can be inherited)
open class Parent(val prop: String) {
    open fun method() {
        println("Parent method")
    }
}

// Inheriting class
class Child(prop: String) : Parent(prop) {
    override fun method() {
        println("Child method")
        super.method()  // Call parent method
    }
}

// Abstract class
abstract class Shape {
    abstract fun area(): Double
    
    // Non-abstract method
    fun printArea() {
        println("Area: ${area()}")
    }
}

// Implementing abstract class
class Circle(val radius: Double) : Shape() {
    override fun area(): Double {
        return Math.PI * radius * radius
    }
}
```

# Interfaces
```kotlin
// Interface definition
interface Movable {
    // Abstract property
    val speed: Int
    
    // Abstract method
    fun move()
    
    // Method with default implementation
    fun stop() {
        println("Stopping")
    }
}

// Implementing interface
class Car : Movable {
    override val speed = 100
    
    override fun move() {
        println("Car moving at speed $speed")
    }
    
    // Optional: override default implementation
    override fun stop() {
        println("Car stopping")
    }
}

// Multiple interfaces
class Amphibian : Movable, Swimmable {
    // Must implement all abstract methods and properties from both interfaces
}
```

# Data Classes
```kotlin
// Data class automatically provides equals(), hashCode(), toString(), copy(), and component functions
data class User(val name: String, val age: Int)

// Usage
val user1 = User("John", 30)
val user2 = user1.copy(age = 31)  // Creates a new object with modified age

// Destructuring
val (name, age) = user1
```

# Sealed Classes
```kotlin
// Sealed class (restricted class hierarchy)
sealed class Result {
    data class Success(val data: String) : Result()
    data class Error(val message: String) : Result()
    object Loading : Result()
}

// Using with when expression
fun handleResult(result: Result) = when(result) {
    is Result.Success -> println("Success: ${result.data}")
    is Result.Error -> println("Error: ${result.message}")
    is Result.Loading -> println("Loading...")
    // No else needed as all possibilities are covered
}
```

# Object and Companion Object
```kotlin
// Singleton (object declaration)
object Singleton {
    val prop = "Property"
    fun method() {
        println("Method")
    }
}

// Usage
Singleton.prop
Singleton.method()

// Companion object (static-like members)
class MyClass {
    companion object {
        const val CONSTANT = 100
        fun create(): MyClass = MyClass()
    }
}

// Usage
val constant = MyClass.CONSTANT
val instance = MyClass.create()
```

# Extension Functions and Properties
```kotlin
// Extension function
fun String.removeFirstAndLast(): String {
    return if (length <= 2) "" else substring(1, length - 1)
}

// Usage
"Hello".removeFirstAndLast()  // Returns "ell"

// Extension property
val String.lastIndex: Int
    get() = length - 1

// Usage
"Hello".lastIndex  // Returns 4
```

# Coroutines
```kotlin
// Simple coroutine
fun main() = runBlocking {
    launch {
        delay(1000L)
        println("World!")
    }
    println("Hello")
}

// Async/await
fun main() = runBlocking {
    val result = async {
        delay(1000L)
        "Result"
    }
    println("Waiting...")
    println(result.await())
}

// Structured concurrency
fun main() = runBlocking {
    coroutineScope {
        launch {
            delay(500L)
            println("Task 1")
        }
        launch {
            delay(300L)
            println("Task 2")
        }
    }
    println("All tasks completed")
}
```

# Exception Handling
```kotlin
// Try-catch
try {
    // Code that might throw an exception
    val result = 10 / 0
} catch (e: ArithmeticException) {
    // Handle specific exception
    println("Division by zero")
} catch (e: Exception) {
    // Handle any other exception
    println("Generic error: ${e.message}")
} finally {
    // Always executed
    println("Cleanup")
}

// Try as expression
val result = try {
    10 / someValue
} catch (e: ArithmeticException) {
    0  // Default value on error
}

// Throw exception
throw Exception("Error message")

// Custom exception
class CustomException(message: String) : Exception(message)
```

# Type Checking and Casting
```kotlin
// is operator (type check)
if (obj is String) {
    // Smart cast: obj is treated as String in this scope
    println(obj.length)
}

// as operator (explicit cast)
val str = obj as String  // Throws ClassCastException if cast fails

// Safe cast
val str = obj as? String  // Returns null if cast fails
```

# Scope Functions
```kotlin
// let - operates on object and returns result
val length = str?.let {
    println("Processing: $it")
    it.length
}

// run - operates on object and returns result
val length = str?.run {
    println("Processing: $this")
    length
}

// with - operates on object and returns result
val result = with(obj) {
    property1 + property2
}

// apply - operates on object and returns object
val person = Person().apply {
    name = "John"
    age = 30
}

// also - operates on object and returns object
val numbers = mutableListOf(1, 2, 3).also {
    println("List elements: $it")
}
```

# Delegated Properties
```kotlin
// Lazy initialization
val lazyValue: String by lazy {
    println("Computed!")
    "Hello"
}

// Observable changes
var name: String by Delegates.observable("Initial") { _, old, new ->
    println("Name changed from $old to $new")
}

// Storing properties in a map
class User(val map: Map<String, Any?>) {
    val name: String by map
    val age: Int by map
}

// Custom delegate
class Delegate {
    operator fun getValue(thisRef: Any?, property: KProperty<*>): String {
        return "$thisRef, property ${property.name}"
    }
    
    operator fun setValue(thisRef: Any?, property: KProperty<*>, value: String) {
        println("$value assigned to ${property.name}")
    }
}

// Usage
val example: String by Delegate()
```

# Inline Functions
```kotlin
// Inline function - inlines lambda at call site
inline fun operation(a: Int, b: Int, op: (Int, Int) -> Int): Int {
    return op(a, b)
}

// Non-local returns
inline fun forEach(list: List<Int>, action: (Int) -> Unit) {
    for (item in list) {
        action(item)
    }
}

// Usage
fun example() {
    forEach(listOf(1, 2, 3)) {
        if (it == 2) return  // Returns from example() function
        println(it)
    }
}
```

# Value Classes
```kotlin
// Value class (JVM inline class)
@JvmInline
value class Password(val value: String)

// Usage
val password = Password("secret")
```

# String Templates
```kotlin
val name = "John"
val greeting = "Hello, $name!"
val calculation = "Result: ${2 + 2}"
```

# Type Aliases
```kotlin
// Create an alias for a complex type
typealias ClickHandler = (View, Int) -> Unit

// Usage
fun setClickListener(handler: ClickHandler) {
    // Implementation
}
```
