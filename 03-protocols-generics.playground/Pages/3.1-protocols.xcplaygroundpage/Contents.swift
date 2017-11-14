/*:
 ## Session 3: Protocols and Generics
 ### 3.1 Protocols
 A Protocol defines blueprint of methods, properties and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
 */

//1. Protocol Syntax
protocol Stackable {
    var items: [Int] { get }
    var count: Int { get set }
    func push(element: Int)
    func pop() -> Int
}
