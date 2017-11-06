import Foundation

protocol Queuable {
    associatedtype Element
    mutating func enqueue(_ item: Element)
    mutating func dequeue() -> Element?
}

private class _AnyQueuableBase<T>: Queuable {
    typealias Element = T
    init() {
        guard type(of: self) != _AnyQueuableBase.self else {
            fatalError("_AnyQueuableBase<Element> instances can not be created; create a subclass instance instead")
        }
    }
    
    func enqueue(_ item: _AnyQueuableBase<T>.Element) {
        fatalError("Must override")
    }
    
    func dequeue() -> _AnyQueuableBase<T>.Element? {
        fatalError("Must override")
    }
    
}

private final class _AnyQueuable<Concrete: Queuable>: _AnyQueuableBase<Concrete.Element> {
    typealias Element = Concrete.Element
    // variable used since we're calling mutating functions
    var concrete: Concrete
    
    init(_ concrete: Concrete) {
        self.concrete = concrete
    }
    
    override func enqueue(_ item: _AnyQueuable<Concrete>.Element) {
        concrete.enqueue(item)
    }
    
    override func dequeue() -> _AnyQueuable<Concrete>.Element? {
        return concrete.dequeue()
    }
    
}

final class AnyQueuable<T>: Queuable {
    typealias Element = T
    
    private let box: _AnyQueuableBase<T>
    
    // Initializer takes our concrete implementer of Row i.e. FileCell
    init<Concrete: Queuable>(_ concrete: Concrete) where Concrete.Element == T {
        box = _AnyQueuable(concrete)
    }
    
    func enqueue(_ item: AnyQueuable<T>.Element) {
        box.enqueue(item)
    }
    
    func dequeue() -> AnyQueuable<T>.Element? {
        return box.dequeue()
    }
    
}
