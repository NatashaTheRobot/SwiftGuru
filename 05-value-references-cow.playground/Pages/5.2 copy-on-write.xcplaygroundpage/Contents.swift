//: [Previous](@previous)

import Foundation

// Suppose you are given this Obective-C Monster to work with, and cannot
// convert it to Swift.
@objc public class RWMonster: NSObject, NSCopying {
    
    public init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
    
    override public var description: String {
        return "\(name): \(hitPoints)"
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return RWMonster(name: name, hitPoints: hitPoints)
    }
    
    public var name: String
    public var hitPoints: Int
}

let owlBear = RWMonster(name: "Owl Bear", hitPoints: 30)
var enemies: [RWMonster] = [owlBear]
owlBear.hitPoints += 10
print(enemies)  // Reference semantics :[

final class SwiftReference<T> {
    var object: T
    init(_ object: T) {
        self.object = object
    }
}

struct Monster: CustomStringConvertible {
    
    init(name: String, hitPoints: Int) {
        _monster = SwiftReference(RWMonster(name: name, hitPoints: hitPoints))
    }
    
    var name: String {
        get {
            return _monster.object.name
        }
        set {
            _mutatingMonster.name = newValue
        }
    }
    
    var hitPoints: Int {
        get {
            return _monster.object.hitPoints
        }
        set {
            _mutatingMonster.hitPoints = newValue
        }
    }
    
    var description: String {
        return _monster.object.description
    }
    
    fileprivate var _mutatingMonster: RWMonster {
        
        mutating get {
            if !isKnownUniquelyReferenced(&_monster) {
                print("making copy")
                _monster = SwiftReference(_monster.object.copy() as! RWMonster)
            }
            else {
                print("no copy")
            }
            return _monster.object
        }
    }
    fileprivate var _monster: SwiftReference<RWMonster>
}

var troll = Monster(name: "Troll", hitPoints: 30)
var monsters: [Monster] = [troll]
troll.hitPoints += 100
troll.hitPoints += 1000
troll.hitPoints += 1000
troll.hitPoints += 1000
print(monsters)  // Value semantics :]
print(troll)


//: [Next](@next)
