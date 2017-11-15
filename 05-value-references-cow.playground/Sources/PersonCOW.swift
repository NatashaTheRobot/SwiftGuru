import Foundation

@objc class Person: NSObject, NSCopying {
    
    public var name: String
    public var points: Int
    
    public init(name: String, points: Int) {
        self.name = name
        self.points = points
    }
    
    override public var description: String {
        return "\(name): \(points)"
    }
    
    func copy(with: NSZone? = nil) -> Any {
        return Person(name: name, points: points)
    }
     
}

public final class SwiftReference<T> {
    var object: T
    init(_ object: T) {
        self.object = object
    }
}

public struct PersonCOW: CustomStringConvertible {
    
    public init(name: String, points: Int) {
        _person = SwiftReference(Person(name: name, points: points))
    }
    
    public var name: String {
        get {
            return _person.object.name
        }
        set {
            _mutatingPerson.name = newValue
        }
    }
    
    public var points: Int {
        get {
            return _person.object.points
        }
        set {
            _mutatingPerson.points = newValue
        }
    }
    
    public var description: String {
        return _person.object.description
    }
    
    fileprivate var _mutatingPerson: Person {
        mutating get {
            if !isKnownUniquelyReferenced(&_person) {
                print("making copy")
                _person = SwiftReference(_person.object.copy() as! Person)
            } else {
                print("no copy")
            }
            return _person.object
        }
    }
    fileprivate var _person: SwiftReference<Person>
}

