/*:
 ## Session 1: Functional Swift
 ### 1.3 Immutability and Pure Functions
 - Be able to understand immutability and side effects
 - Be able to convert an impure function to a pure function
 */

//1. Immutability and Side Effects
let immutableNumber = 1
var mutableNumber = 1;

func incrementByTen() -> Int {
    mutableNumber += 10
    return mutableNumber
}
incrementByTen()
incrementByTen()
incrementByTen()

//2. Pure Function
func incrementByTen(_ num: Int) -> Int {
    return num + 10
}

incrementByTen(mutableNumber)
incrementByTen(mutableNumber)
incrementByTen(mutableNumber)
