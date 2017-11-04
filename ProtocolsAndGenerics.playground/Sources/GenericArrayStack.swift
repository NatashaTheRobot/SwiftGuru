import Foundation

public struct GenericArrayStack<Element> {
    
    fileprivate var storage = [Element]()
    
    /// Creates a new, empty `StackArray`.
    public init() {}
    
    public mutating func push(value: Element) {
        storage.append(value)
    }
    
    public mutating func pop() -> Element? {
        if let last = storage.last {
            storage.removeLast()
            return last
        }
        return nil
    }
    
}
