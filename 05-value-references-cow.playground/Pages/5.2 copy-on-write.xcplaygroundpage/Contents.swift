/*:
 ## Session 5: Value & References and Copy On Write
 ### 5.1 Copy On Write
 - Be able to understand how copy on write works
 */

import Foundation

// Reference Types
class COW { var string = "Hello, try! Swift" }
var one = COW()
var two = one
address(of: one)
address(of: two)
two.string = "try! Swift"
address(of: one)
address(of: two)

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

// The funciton isKnownUniquelyReferenced(_:) returns a Boolean value indicating whether the given object is known to have a single strong reference.
class SomeClass {}
var object = SomeClass()
isKnownUniquelyReferenced(&object)
var object2 = object
isKnownUniquelyReferenced(&object)

// Making Reference Types work like Value Types
let rahul = Person(name: "Rahul", points: 5)
var personArray = [rahul]
rahul.points += 10
personArray.description

// Making Reference Types work like Value Types
var cow = PersonCOW(name: "Rahul", points: 5)
var cowArray = [rahulCOW]
cow.points += 10
cow.points += 10
cow.points += 10
cow.points += 10
cow
cowArray.description
