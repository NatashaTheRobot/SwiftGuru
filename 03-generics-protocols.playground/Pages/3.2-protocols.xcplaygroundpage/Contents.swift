/*:
 ## Session 3: Generics and Protocols 
 ### 3.1 Protocols
 A Protocol defines blueprint of methods, properties and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
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

//5. Exercise
//5.1 Create a stackable protocol that has array of items as a property requirement and has mutating method requirements to push and pop an integer
protocol Stackable {
    var items: [Int] { get }
    mutating func push(_ item: Int)
    mutating func pop() -> Int?
}

//5.2 Create a struct IntStack and adopt the Stackable protocol
struct IntStack: Stackable {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int? {
        return items.removeLast()
    }
}

var intStack: Stackable = IntStack()
intStack.push(3)
intStack.push(2)
intStack.push(1)
intStack.push(0)
intStack.pop()

//5.3 Extend Stackable to provide a method to get the top item
extension Stackable {
    func topItem() -> Int? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

intStack.topItem()
