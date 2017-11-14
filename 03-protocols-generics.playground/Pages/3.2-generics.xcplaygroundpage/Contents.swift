/*:
 ## Session 3: Generics and Protocols
 ### 3.1 Generic Functions
 */

//1. Generic Functions

//Non-Generic function
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var firstInt = 1
var secondInt = 2
swapTwoInts(&firstInt, &secondInt)
print("firstInt is now \(firstInt), secondInt is now \(secondInt)")

//Generic function
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
//The generic version of the function uses a placeholder type name (called T, in this case) instead of an actual type name (such as Int, String, or Double). The placeholder type name doesn’t say anything about what T must be, but it does say that both a and b must be of the same type T, whatever T represents.
var firstString = "first"
var secondString = "second"
swapTwoValues(&firstString, &secondString)
print("firstString: \(firstString), secondString: \(secondString)")

//2. Generic Types

//Non Generic Type
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
var intStack = IntStack()
intStack.push(3)
intStack.push(1)
intStack.push(2)
intStack.pop()
intStack

//Generic Type
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stringStack = Stack<String>()
stringStack.push("foo")
stringStack.push("bar")
stringStack.push("baz")
stringStack.pop()
stringStack
