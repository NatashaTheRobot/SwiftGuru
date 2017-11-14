import Foundation
import XCTest


/*:
 #### Enumerations
 
In Swift, the power of `enums` is best realized by doing pattern matching on them. Enumeration cases can have associated values, that may also be used in pattern matching. One exciting exercise can be abstracing prefix expression (here, only involving binary operations) using an enum and then evaluating it using pattern matching.

Let us begin by defining an Operator type that has four possible values, the four arithmetic operators +, -, * and /
*/
enum Operator: String {
    case plus = "+"
    case minus = "-"
    case multiply = "*"
    case divide = "/"
}

/*:
This is the most important step of the exercise. It is like defining a grammar!
 
An expression can take two possible forms:
* a constant
* the result of two subexpressions (we are supporting only binary operations)
 
Do you know why we call it an `indirect enum`?
*/
indirect enum Expression {
    case constant(Int)
    case expression(Operator, Expression, Expression)
}

/*:
##### Parsing

This is not a part of the exercise! These are some fundamental functions that aid in parsing the expression string into tokens. To keep things simple, we maintain a whitespace between any two tokens in the expression string. Also, we assume there are no syntax errors.

You need not do anything here. Just go through the functions o this extensions.
*/
extension Expression {
    //Compile an expression string into an Expression
    static func compile(_ text: String) -> Expression {
        return Expression.for(text.components(separatedBy: .whitespacesAndNewlines).filter { $0.count > 0 })
    }
    
    //Given that we only have binary operations, this function finds the index that separates the two operators of a given operation.
    private static func separator(expression: [String]) -> Int {
        guard let open = expression.first, open == "(" else { return 1 }
        var level = 1, idx = 1
        while level > 0 {
            if expression[idx] == "(" { level += 1 }
            else if expression[idx] == ")" { level -= 1 }
            idx += 1
        }
        return idx
    }

    //This function constructs an Expression for a string, calling itself recursively
    private static func `for`(_ tokens: [String]) -> Expression {
        if let first = tokens.first, let constant = Int(first) {
            return .constant(constant)
        } else {
            let subExpressions = Array(tokens[2..<(tokens.count-1)])
            let idx = separator(expression: subExpressions)
            return .expression(Operator(rawValue: tokens[1])!,
                               Expression.for(Array(subExpressions[0..<idx])),
                               Expression.for(Array(subExpressions[idx..<subExpressions.count])))
        }
    }
}

/*:
##### Pattern Matching
 
Now let us come to some basic pattern matching using the switch statement. May we ask you to write a computed property called function which will switch on the Operator value and return a closure for the respective operation. Please bear in mind that we must be able to invoke the returned closure on two Int operands to yield the result of that arithmetic operation.
 
*/
extension Operator {
    var function: ((Int, Int) -> Int) {
        //YOUR CODE GOES HERE
        switch self {
        case .plus:
            return { a, b in a + b }
        case .minus:
            return { a, b in a - b }
        case .multiply:
            return { a, b in a * b }
        case .divide:
            return { a, b in a / b }
        }
    }
}

/*:
##### Pattern Matching (real!)

Now, let us write the evaluate function that evaluates an Expression to yield a value. This is where you get serious about pattern matching and this is where the real power of enums comes to light!
*/
extension Expression {
    func evaluate() -> Int {
        //YOUR CODE GOES HERE
        switch self {
        case .constant(let x):
            return x
        case .expression(let op, let ex1, let ex2):
            return op.function(ex1.evaluate(), ex2.evaluate())
        }
    }
}

XCTAssertEqual(Expression.compile("( + 1 1 )").evaluate(), 2)
XCTAssertEqual(Expression.compile("( + ( * 2 2 ) ( * 3 3 ) )").evaluate(), 13)
XCTAssertEqual(Expression.compile("( / ( - ( + ( * 3 3 ) ( * 4 ( + 4 1 ) ) ) 1 ) 7 )").evaluate(), 4)

/*:
##### Error handling using Enums

Let us take up a simple example of element-wise division of two arrays.
divide(A, B) = [Ci | Ai / Bi for all i] where size of the arrays is equal and lesser than 1M

 This function divide() can detect three kinds of error conditions:
 * Division by 0
 * Arrays A and B are of different lengths
 * Arrays A or B is of length > 1M
 
 When these error conditions occur, the divide() functions must throw an error called DivideError. First let us design the DivideError type as an enum
 */
enum DivideError : Error {
    //YOUR CODE GOES HERE
    case DivideByZero(Int)
    case UnequalLengths(Int, Int)
    case LargeArray(Int)
}

/*:
Now let's write the divide() function to check all mentioned error conditions and throw a DivideError if needed.
*/
func divide(_ A: [Int], _ B: [Int]) throws -> [Int] {
    //YOUR CODE GOES HERE
    guard A.count == B.count else { throw DivideError.UnequalLengths(A.count, B.count) }
    guard A.count < 1000000 else { throw DivideError.LargeArray(A.count) }
    var C: [Int] = []
    for i in 0..<A.count {
        guard B[i] != 0 else { throw DivideError.DivideByZero(i)}
        C.append(A[i]/B[i])
    }
    return C
}

/*:
Next, you can call divide(), catch all the three types of errors and log a description of those errors.
 */
func testDivide(_ A: [Int], _ B: [Int]) -> [Int] {
    //YOUR CODE GOES HERE
    do {
        let C = try divide(A, B)
        return C
    } catch DivideError.DivideByZero(let idx) {
        print("Division by zero at index = \(idx)")
    } catch DivideError.UnequalLengths(let l1, let l2) {
        print("Arrays passed have unequal lengths \(l1) and \(l2)")
    } catch DivideError.LargeArray(let count) {
        print("Either or both arrays are too large: count = \(count)")
    } catch {
        print("Unrecognized Error")
    }
    return []
}

//must print [9, 4, 3]
print(testDivide([9, 9, 9], [1, 2, 3]))

//must print "Division by zero at index = 0" followed by "[]"
print(testDivide([1, 1], [0, 1]))

//must print "Either or both arrays are too large: count = 1000000" followed by "[]"
print(testDivide(Array(1...1000000), Array(1...1000000)))

//must print "Arrays passed have unequal lengths 4 and 3" followed by "[]"
print(testDivide([1, 2, 3, 4], [2, 2, 2]))
