import Foundation

protocol Stackable {
    associatedtype Element
    mutating func push(_ item: Element)
    mutating func pop() -> Element?
}

extension Stackable where Self: Sequence {
    
}
