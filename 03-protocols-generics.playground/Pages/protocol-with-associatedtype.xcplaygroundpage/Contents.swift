protocol Stackable {
    associatedtype Element
    mutating func push(_ item: Element)
    mutating func pop() -> Element?
}

extension Array: Stackable {
    mutating func push(_ item: Element) {
        self.insert(item, at: 0)
    }
    
    mutating func pop() -> Element? {
        return removeFirst()
    }
}


