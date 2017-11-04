import Foundation

public struct LinkedListStack<Element> {
    
    fileprivate var linkedList = LinkedList<Element>()
    
    /// Creates a new, empty `StackLinkedList`.
    public init() {}
    
    public mutating func push(value: Element) {
        linkedList.addFirst(value: value)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return linkedList.removeFirst()
    }
    
}
