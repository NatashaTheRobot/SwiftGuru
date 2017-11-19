/*:
 ## Session 5: Value & References and Copy On Write
 ### 5.1 Copy On Write
 - Be able to understand how to have value semantics in classes
 */

import Foundation

/// Value Types
let a = [1,2,3]
let b = a
var c = b
address(of: a)
address(of: b)
address(of: c)
c.append(4)
address(of: a)
address(of: b)
address(of: c)
c.append(5)
address(of: c)

/// Reference Types
class Person: NSCopying, CustomStringConvertible {
    
    public var name: String
    public var score: Int
    
    public init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
    
    func copy(with: NSZone? = nil) -> Any {
        return Person(name: name, score: score)
    }
    
    var description: String {
        return "\(name): \(score)"
    }
}

let rahul = Person(name: "Rahul", score: 5)
rahul.score += 10
var personArray = [rahul]
rahul.score += 10
rahul
personArray

/// Having value semantics in reference types
/* Speaker Notes
 To add value semantics to the class, we are going make use of the funciton isKnownUniquelyReferenced(_:) which returns a Boolean value indicating whether the given object is known to have a single strong reference.
 */

class SomeClass {}
var object = SomeClass()
isKnownUniquelyReferenced(&object)
var object2 = object
isKnownUniquelyReferenced(&object)

struct PersonCow: CustomStringConvertible {
    fileprivate var _person: Person
    fileprivate var _mutatingPerson: Person {
        mutating get {
            if !isKnownUniquelyReferenced(&_person) {
                print("Copying")
                _person = _person.copy() as! Person
            } else {
                print("No Copy")
            }
            return _person
        }
    }
    
    public init(name: String, score: Int) {
        _person = Person(name: name, score: score)
    }
    public var name: String {
        get {
            return _person.name
        } set {
            _mutatingPerson.name = newValue
        }
    }
    public var score: Int {
        get {
            return _person.score
        } set {
            _mutatingPerson.score = newValue
        }
    }
    
    var description: String {
        return _person.description
    }
}

var cow = PersonCow(name: "Cow", score: 5)
cow.score += 10
print(cow)
var cowArray = [cow]
cow.score += 10
print(cow)
print(cowArray)
