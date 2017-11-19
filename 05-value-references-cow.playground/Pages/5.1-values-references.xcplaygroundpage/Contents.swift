/*:
 ## Session 5: Value & References and Copy On Write
 ### 5.1 Value & References
 */

/* Speaker Notes
 The difference is when a object is assigned or intialized or passed as an argument.
 - Value types creates an independent instance with its own unique copy of its data
 - Reference types creates a shared instance implicitly so modifying data in the second variable will affect the original
 
 Value Types are preferred when
 - comparing instance data with == makes sense
 - you want copies to have independent state
 
 Reference Types are preferred when
 - comparing instance data with === makes sense
 - you want to create shared mutable state
 */

struct Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let rahul = Person(name: "Rahul")
var aarkay = rahul
aarkay.name = "AarKay"
//rahul.name = "AarKay"

print(rahul.name)
print(aarkay.name)
