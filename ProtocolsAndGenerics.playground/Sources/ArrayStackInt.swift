import Foundation

public struct ArrayStackInt {
    
    fileprivate var storage = [Int]()
    
    /// Creates a new, empty `StackArray`.
    public init() {}
    
    public mutating func push(value: Int) {
        storage.append(value)
    }
    
    public mutating func pop() -> Int? {
        if let last = storage.last {
            storage.removeLast()
            return last
        }
        return nil
    }
    
}
