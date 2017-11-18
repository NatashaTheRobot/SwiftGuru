/*:
 ## Session 3: Protocols and Generics
 ### 3.4 Type Erasures
 */

protocol Stackable {
    associatedtype Element
    func push(_ item: Element)
    func pop() -> Element?
}

class Stack<Element>: Stackable {
    var items = [Element]()
    func push(_ item: Element) {
        items.append(item)
    }
    func pop() -> Element? {
        return items.removeLast()
    }
}

let intStack/*: Stackable*/ = Stack<Int>()
intStack.push(3)
intStack.push(1)
intStack.push(2)
intStack.pop()
intStack

//let anyIntStack: AnyStackable<Int> = AnyStackable(stackable:  Stack<Int>())
//anyIntStack.push(0)
//anyIntStack.push(1)
//anyIntStack.push(2)
//anyIntStack.push(3)
//anyIntStack.pop()

