/*:
 ## Session 3: Protocols and Generics
 ### 3.1 Protocols
 */

class DrawableClass {
    
    func draw() {
        fatalError("implement me")
    }
    
}

class CircleClass: DrawableClass {
    
    override func draw() {
        print("I am a circle")
    }
    
}
let shapeObject = CircleClass()
shapeObject.draw()

/*
 Protocols
 A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
 */

protocol Drawable {
    func draw()
}

struct Circle: Drawable {
    func draw() {
        print("I am a circle struct")
    }
    
    func render() {
        print("I am rendering from struct")
    }
}

let shape = Circle()
shape.draw()

/// Method Dispatching
extension Drawable {
    func render() {
        print("I am rendering")
    }
}

shape.render()
