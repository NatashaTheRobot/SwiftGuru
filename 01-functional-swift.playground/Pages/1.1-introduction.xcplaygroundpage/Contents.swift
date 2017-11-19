/*:
 ## Session 1: Functional Swift
 ### 1.1 Introduction
 */

/* Speaker Notes
 Functional Programming is a programming paradigm that treats computation as evaluation of mathematical functions and avoid states and mutable data. ~Wikipedia
 
 Key Concepts
 - Immutability
 - Pure Functions
 - First Class Citizens
 
 Advantages
 - No Concurrency issues
 - Easy Testing and Debugging
 - Reusability
 - Reasoning
 */

//1. Immutability and Side Effects
var mutableNumber = 1;
mutableNumber = 5;
func incrementByTen() -> Int {
    mutableNumber += 10
    return mutableNumber
}
incrementByTen()
incrementByTen()
incrementByTen()

//2. Pure Function
let immutableNumber = 1
func incrementByTen(_ immutableNumber: Int) -> Int {
    var immutableNumber = immutableNumber
    immutableNumber += 10
    return immutableNumber
}

incrementByTen(immutableNumber)
incrementByTen(immutableNumber)
incrementByTen(immutableNumber)

//3. First Class Functions
//3.1. Using Functions as a property
func sayHello() { print("Hello!") }
let greeting = sayHello
greeting()

//3.2. Passing a function as a parameter
func executeFunction(_ function: () -> Void) {
    function()
}
func sayHi() { print("Hi!") }
executeFunction(sayHi)

//3.3. Returning a function
func returnFunction() -> (() -> Void) {
    func sayHey() { print("Hey!") }
    return sayHey
}
returnFunction()()
