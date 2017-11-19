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

extension LinkedList : Collection {
    
    public typealias Index = Int
    
    public var startIndex: Index { return 0 }
    
    public var endIndex: Index {
        get {
            if let head = head {
                var numberOfElements = 1
                var current = head
                while current.next != nil {
                    numberOfElements += 1
                    current = current.next!
                }
                return numberOfElements
            } else {
                return startIndex
            }
        }
    }
    
    public subscript(position: Index) -> Element {
        get {
            var currentPosition = startIndex
            var element = head!
            while currentPosition != position {
                element = element.next!
                currentPosition = index(after: currentPosition)
            }
            return element.value
        }
    }
    
    public func index(after idx: Index) -> Index {
        return idx+1
    }
}

