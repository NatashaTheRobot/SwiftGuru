//: [Previous](@previous)

//  Property Requirements
//  A protocol can require any conforming type to provide an instance property or type property with a particular name and type. The protocol also specifies whether each property must be gettable or gettable and settable.
//  If a protocol requires a property to be gettable and settable, that property requirement can’t be fulfilled by a constant stored property or a read-only computed property. If the protocol only requires a property to be gettable,
protocol PropertyProtocol {
    var mustBeSettable: Int { get }
    static var doesNotNeedToBeSettable: Int { get set }
}

//  Method Requirements
//  Protocols can require specific instance methods and type methods to be implemented by conforming types.

protocol MethodProtocol {
    static func someTypeMethod()
}

//  Initializer Requirements
//  “Protocols can require specific initializers to be implemented by conforming types.”

protocol IntializerProtocol {
    init(someParameter: Int)
}

class IntializerClass: IntializerProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}

//  “The use of the required modifier ensures that you provide an explicit or inherited implementation of the initializer requirement on all subclasses of the conforming class, such that they also conform to the protocol.”

// Example here

//: [Next](@next)

