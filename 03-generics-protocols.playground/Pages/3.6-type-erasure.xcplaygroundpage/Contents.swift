//: Playground - noun: a place where people can play

protocol Stackable {
    associatedtype Element
    mutating func push(_ item: Element)
    mutating func pop() -> Element?
}

/////////////////////////////////////////////////////////////////////////
private class _AnyStackableBase<T>: Stackable {
    typealias Element = T
    init() {
        guard type(of: self) != _AnyStackableBase.self else {
            fatalError("_AnyStackableBase<Element> instances can not be created; create a subclass instance instead")
        }
    }
    
    func push(_ item: _AnyStackableBase<T>.Element) {
        fatalError("Must override")
    }
    
    func pop() -> _AnyStackableBase<T>.Element? {
        fatalError("Must override")
    }
    
}

private final class _AnyStackable<Concrete: Stackable>: _AnyStackableBase<Concrete.Element> {
    // variable used since we're calling mutating functions
    var concrete: Concrete

    init(_ concrete: Concrete) {
        self.concrete = concrete
    }

    override func push(_ item: _AnyStackable<Concrete>.Element) {
        concrete.push(item)
    }

    override func pop() -> _AnyStackable<Concrete>.Element? {
        return concrete.pop()
    }

}

final class AnyStackable<T>: Stackable {
       typealias Element = T

    private let box: _AnyStackableBase<T>

    // Initializer takes our concrete implementer of Row i.e. FileCell
    init<Concrete: Stackable>(_ concrete: Concrete) where Concrete.Element == T {
        box = _AnyStackable(concrete)
    }

    func push(_ item: AnyStackable<T>.Element) {
        box.push(item)
    }

    func pop() -> AnyStackable<T>.Element? {
        return box.pop()
    }

}
/////////////////////////////////////////////////////////////////////////

extension Array: Stackable {
    mutating func push(_ item: Element) {
        self.insert(item, at: 0)
    }

    mutating func pop() -> Element? {
        return removeFirst()
    }
}

var stackable = AnyStackable([Int]())
stackable.push(3)
stackable.push(4)
stackable.push(5)
stackable.push(2)
stackable.pop()


