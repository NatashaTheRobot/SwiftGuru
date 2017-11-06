/*:
 ## Session 3: Protocols and Generics
 ### 3.2 Generic Types
 - Be able to
 */

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

