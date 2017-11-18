/*:
 ## Session 3: Generics and Protocols 
 ### 3.1 Protocols
 */

//1. Protocol Syntax
protocol SomeProtocol {
    var someProperty: String { get set } //Property Requirements
    init?(someProperty: String) //Initializer Requirements
    func someMethod() //Method Requirements
}

//2. Protocol Adoption
class SomeClass: SomeProtocol {
    var someProperty: String = "Hello, try! Swift"
    var anotherProperty: String = "Hello, Protocols!"
    
    required init?(someProperty: String) {
        if someProperty == "" { return nil }
        self.someProperty = someProperty
    }
    
    func someMethod() {
        print(someProperty)
    }
}

//3. Protocols as Type
if let object: SomeProtocol = SomeClass(someProperty: "Hello, Protocols") {
    object.someProperty
    object.someMethod()
}

if let objectTwo: SomeProtocol = SomeClass(someProperty: "") {
    objectTwo.someProperty
    objectTwo.someMethod()
} else {
    print("Failed")
}

//4. Protocol Extensions
extension SomeProtocol {
    
    func someMethod() {
        print("Default, \(someProperty)")
    }
    
}
