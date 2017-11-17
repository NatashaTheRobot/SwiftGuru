import Foundation

public class LinkedListNode<Element> {
    
    public var value: Element
    public var next: LinkedListNode?
    
    public init(value: Element) {
        self.value = value
    }
    
}

public struct LinkedList<Element> {
    
    public typealias Node = LinkedListNode<Element>
    public var head: Node?
    
    /// Creates a new, empty `LinkedList`.
    public init() {}
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        return reduce("") {
            if $0.isEmpty {
                return "\($1)"
            } else {
                return "\($0) -> \($1)"
            }
        }
    }
    
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
