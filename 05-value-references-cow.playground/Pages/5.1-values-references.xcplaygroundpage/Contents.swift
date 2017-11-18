/*:
 ## Session 5: Value & References and Copy On Write
 ### 5.1 Value & References
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
