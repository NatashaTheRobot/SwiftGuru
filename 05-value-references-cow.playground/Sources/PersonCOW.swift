import Foundation

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

