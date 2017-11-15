/*:
 ## Session 5: Value & References and Copy On Write
 ### 5.1 Copy On Write
 - Be able to understand how to have value semantics in classes
 */

import Foundation

// Value Types
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

// Reference Types
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

let rahul = Person(name: "Rahul", points: 5)
var personArray = [rahul]
rahul.points += 10
rahul
personArray.description

/*
The funciton isKnownUniquelyReferenced(_:) returns a Boolean value indicating whether the given object is known to have a single strong reference.
 */
class SomeClass {}
var object = SomeClass()
isKnownUniquelyReferenced(&object)
var object2 = object
isKnownUniquelyReferenced(&object)

//Making reference types work like value types
var cow = PersonCOW(name: "Rahul", points: 5)
var cowArray = [cow]
cow.points += 10
cow
cowArray.description
