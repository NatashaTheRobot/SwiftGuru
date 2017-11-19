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
intStack.push(0)
intStack.push(1)
intStack.push(2)
intStack.push(3)
intStack.pop()

// Creating a Type Erasure
class AnyStackable<T>: Stackable {
    typealias Element = T
    private let _push:(_ item: T) -> ()
    private let _pop:() -> T?
    
    init<S: Stackable>(stackable: S) where S.Element == T {
        _push = stackable.push
        _pop = stackable.pop
    }
    
    func push(_ item: T) { _push(item) }
    func pop() -> T? { return _pop() }
}

let anyIntStack: AnyStackable<Int> = AnyStackable(stackable:  Stack<Int>())
anyIntStack.push(0)
anyIntStack.push(1)
anyIntStack.push(2)
anyIntStack.push(3)
anyIntStack.pop()

