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
class SomeClass {}
var object = SomeClass()
isKnownUniquelyReferenced(&object)
var object2 = object
isKnownUniquelyReferenced(&object)
