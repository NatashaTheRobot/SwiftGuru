import Foundation

// Protocol with AssociatedType
public protocol Stackable {
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
public struct Stack<Element>: Stackable {
    public typealias Item = Element
    public var items = [Element]()
    public mutating func push(_ item: Element) {
        items.append(item)
    }
    public mutating func pop() -> Element? {
        return items.removeLast()
    }
}
