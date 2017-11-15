/*:
 ## Session 3: Generics and Protocols
 ### 3.2 Protocols with Associated Type
 */

// Protocol with AssociatedType
protocol Stackable {
    associatedtype Item
    var items: [Item] { get }
    mutating func push(_ item: Item)
    mutating func pop() -> Item?
}

extension Stackable {
    func topItem() -> Item? {
        return items.isEmpty ? nil : items[items.count-1]
    }
}

// Generic Stack adopting Stackable Protocol
struct Stack<Element>: Stackable {
    typealias Item = Element
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element? {
        return items.removeLast()
    }
}

var intStack = Stack<Int>()
intStack.push(3)
intStack.push(2)
intStack.push(1)
intStack.push(0)
intStack.pop()
intStack.topItem()

