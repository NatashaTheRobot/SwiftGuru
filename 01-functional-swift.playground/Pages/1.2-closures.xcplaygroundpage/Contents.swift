/*:
 ## Session 1: Functional Swift
 ### 1.2 Closures
 Closures are anonymous functions.
 - Be able to write closures
 */

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var reversedNames = names.sorted(by: backward)

//1. Closure Syntax
let syntax = { (param1: String, param2: String) -> Bool in
    // statements
    return false
}

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

//2. Inferring Type From Context
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

//3. Implicit Returns from Single-Expression Closures
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

//4. Shorthand Argument Names
reversedNames = names.sorted(by: { $0 > $1 })

//5. Operator Methods
reversedNames = names.sorted(by: >)
