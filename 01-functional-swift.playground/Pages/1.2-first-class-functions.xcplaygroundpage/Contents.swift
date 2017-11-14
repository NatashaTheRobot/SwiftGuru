/*:
 ## Session 1: Functional Swift
 ### 1.2 First-class functions
 - Be able to assign a function to a property
 - Be able to pass a function as a parameter
 - Be able to return a function from a function
 */

//1. Using Functions as a property
func sayHello() { print("Hello!") }
let greeting = sayHello
greeting()

//2. Passing a function as a parameter
func executeFunction(_ function: () -> Void) {
    function()
}
func sayHi() { print("Hi!") }
executeFunction(sayHi)

//3. Returning a function
func returnFunction() -> (() -> Void) {
    func sayHey() { print("Hey!") }
    return sayHey
}
returnFunction()()
