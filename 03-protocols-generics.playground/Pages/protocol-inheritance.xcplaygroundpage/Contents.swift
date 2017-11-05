//: [Previous](@previous)

//  Protocol Inheritance
//  “A protocol can inherit one or more other protocols and can add further requirements on top of the requirements it inherits. The syntax for protocol inheritance is similar to the syntax for class inheritance, but with the option to list multiple inherited protocols, separated by commas:”

protocol SomeProtocol {}
protocol AnotherProtocol {}
protocol InheritProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}

//: [Next](@next)
