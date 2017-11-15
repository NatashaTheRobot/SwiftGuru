/*:
 ## Session 3: Generics and Protocols
 ### 3.2 Protocol Oriented Programming
 
 OOP has 4 pillars that are
 - Abstraction
 - Encapusaltion
 - Inheritance
 - Polymorphishm
 
 POP is extremely similar to OOP but it encourages composition over inheritance and protocols have no stored properties that means no state, only computed properties.
 
 How POP is implemented?
 we have Protocols and we have Extensions and with Swift 2, Protocol Extensions.
 A lot of methods after protocol extensions were converted from global functions to instance functions like countElements(array) was converted to array.count
 */

//1. Extending protocols
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let i: Int = 8
i.squared()

let ui: UInt = 8
//ui.squared()

//2. Extending Equatable
extension Equatable {
    
}

//2.matches(array: [2,2,2,2]) // true
//"hello".matches(array: ["a","b","c"]) //false

//3. Extending Comparable
extension Comparable {
    
}

//5.lessThan(array: [6,7,8]) // true
//5.lessThan(array: [5,6,7]) // false
//"cat".lessThan(array: ["dog","goat","tiger"]) // true

//3. Constaining Protocol Extensions
//3.1 Extending Protocols which Constaints
extension Collection where Iterator.Element: Equatable {
    func myContains(element: Iterator.Element) -> Bool {
        for item in self {
            if item == element {
                return true
            }
        }
        return false
    }
}


