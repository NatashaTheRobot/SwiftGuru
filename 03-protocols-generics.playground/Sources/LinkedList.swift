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
    
}

public struct LinkedListIterator<Element>: IteratorProtocol {
    
    let linkedList: LinkedList<Element>
    var current: LinkedListNode<Element>?

    init(_ linkedList: LinkedList<Element>) {
        self.linkedList = linkedList
        current = linkedList.head
    }
    
    mutating public func next() -> Element? {
        guard let thisCurrent = current else { return nil }
        current = thisCurrent.next
        return thisCurrent.value
    }
    
}

extension LinkedList: Sequence {
    
    public func makeIterator() -> LinkedListIterator<Element> {
        return LinkedListIterator(self)
    }
    
}
