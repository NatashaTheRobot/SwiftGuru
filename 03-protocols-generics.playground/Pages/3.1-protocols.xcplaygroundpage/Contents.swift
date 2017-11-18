/*:
 ## Session 3: Protocols and Generics
 ### 3.1 Protocols
 */

/// Protocols
protocol Drawable {
    func draw()
}

struct Circle: Drawable {
    func draw() {
        print("I am a circle")
    }
}

struct Square: Drawable {
    func draw() {
        print("I am a square")
    }
}

struct Triangle: Drawable {
    func draw() {
        print("I am a triangle")
    }
}

let shapes: [Drawable] = [Circle(),Square(),Triangle()]

for shape in shapes {
    shape.draw()
}

/// Protocols with Self Requirements
class OrderedClass {
    func precedes(other: OrderedClass) -> Bool { fatalError("implement me") }
}

class NumberClass: OrderedClass {
    var value: Int!
    override func precedes(other: OrderedClass) -> Bool {
        return value < (other as! NumberClass).value //THIS IS THE PROBLEM! WHAT TYPE IS ORDRED?! Does it have a value? Let's force type cast it
    }
}

/// Protocols to the rescue
protocol OrderedProtocol {
    func precedes(other: Self) -> Bool // No implementation, no runtime error!
}

/// Class can be converted to struct and get the value semantics and we can get rid of the override function.
struct NumberStruct: OrderedProtocol {
    var value: Double = 0
    func precedes(other: NumberStruct) -> Bool {
        return self.value < other.value
    }
}
