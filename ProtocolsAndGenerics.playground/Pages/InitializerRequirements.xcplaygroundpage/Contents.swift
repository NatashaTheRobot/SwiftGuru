//: [Previous](@previous)

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

//: [Next](@next)
