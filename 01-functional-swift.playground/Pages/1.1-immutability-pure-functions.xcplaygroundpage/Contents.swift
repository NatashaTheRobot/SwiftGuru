/*:
 ## Session 1: Functional Swift
 ### 1.1 Introduction
 Functional Programming is a programming paradigm that treats computation as evaluation of mathematical functions and avoid states and mutable data. ~Wikipedia
 
 Advantages
 - No Concurrency issues
 - Easy Testing and Debugging
 - Reusability
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
