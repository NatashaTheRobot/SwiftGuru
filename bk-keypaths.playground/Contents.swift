/*:
 #### KeyPaths
 Key Paths allow you to reference a type's properties (including computed properties) without actually evaluating or computing them. We may say that KeyPaths are to properties what closures are to functions! They hold a reference to the property, which may be lazily evaluated. Before Swift 4, one could have simulated KeyPaths using closures
 A simple example for KeyPaths:
*/
import Foundation
import XCTest

struct _Person {
    let name: String
    let age: Int
}

let sachin = _Person(name: "Sachin Tendulkar", age: 47)

//: KeyPaths for the name and age properties
let namePath = \_Person.name
let agePath = \_Person.age

//: Using KeyPaths to access properties
print(sachin[keyPath: namePath])
print(sachin[keyPath: agePath])

/*:
 KeyPaths come handy in deeply nested structures. They can simply create a view of a deeply nested property.
*/
struct Book {
    let name: String
    let isbn: String
    let authors: [Person]
}

struct Person {
    let name: String
    let age: Int
    let address: Address
}

struct Address {
    let houseNumber: String
    let streetName: String
    let locality: String
    var city: String
    let state: String
    let pinCode: String
    
    var fullAddress: String {
        return "\(houseNumber), \(streetName)\n\(locality), \(city)\n\(state), \(pinCode)"
    }
}

let address = Address(houseNumber: "A/3121", streetName: "Roy Road", locality: "BANDRA", city: "Mumbai",
                      state: "MH", pinCode: "401009")
let kumar = Person(name: "Kumar Mohan", age: 32, address: address)

/*:
Simple KeyPaths for properties
 */
///: Write the keyPath to access the city from the adress of a person
let cityPath = \Person.address.city
XCTAssertEqual(kumar[keyPath: cityPath], "Mumbai")

/*:
KeyPaths involving existing properties
 */
///: Write the keyPath to access the first character of the house number
let houseNumFirst = \Person.address.houseNumber.first
XCTAssertEqual(kumar[keyPath: houseNumFirst], "A")

///Write the keyPath to  access the length of the street name
let streetNameLen = \Person.address.streetName.count
XCTAssertEqual(kumar[keyPath: streetNameLen], 8)

///Write the keyPath to access the locality name in capitalized form
let localityPath = \Person.address.locality.capitalized
XCTAssertEqual(kumar[keyPath: localityPath], "Bandra")

///Let us add another level of nesting
let book = Book(name: "The Swifty Road", isbn: "9780374251239", authors: [kumar])

/*:
Using `subscript` in KeyPaths
*/
///keyPath to access the first author of a book
let firstAuthor = \Book.authors[0]
XCTAssertEqual(book[keyPath: firstAuthor.appending(path: \Person.name)], "Kumar Mohan")

/*:
Appending KeyPaths
*/
///keyPath to access the locality in which the first author of a book resides
let firstAuthorsHouseNumber = firstAuthor.appending(path: houseNumFirst)
XCTAssertEqual(book[keyPath: firstAuthorsHouseNumber], "A")
