import Foundation

public class LinkedListNode<Element> {
    
    public var value: Element
    var next: LinkedListNode?
    
    public init(value: Element) {
        self.value = value
    }
    
}

public struct LinkedList<Element> {
    
    public typealias Node = LinkedListNode<Element>
    public fileprivate(set) var head: Node?
    public fileprivate(set) var tail: Node?
    
    /// Creates a new, empty `LinkedList`.
    public init() {}

    public mutating func addFirst(value: Element) {
        let newNode = LinkedListNode(value: value)
        if let head = head {
            newNode.next = head
        } else {
            tail = newNode
        }
        head = newNode
    }

    public mutating func removeFirst() -> Element? {
        let temp = head?.next
        head = head?.next
        return temp?.value
    }
    
}
