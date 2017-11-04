//: [Previous](@previous)

//  Property Requirements
//  “A protocol can require any conforming type to provide an instance property or type property with a particular name and type. The protocol also specifies whether each property must be gettable or gettable and settable.”
//  “If a protocol requires a property to be gettable and settable, that property requirement can’t be fulfilled by a constant stored property or a read-only computed property. If the protocol only requires a property to be gettable, ”
protocol PropertyProtocol {
    var mustBeSettable: Int { get }
    static var doesNotNeedToBeSettable: Int { get set }
}

// Example here

//: [Next](@next)

