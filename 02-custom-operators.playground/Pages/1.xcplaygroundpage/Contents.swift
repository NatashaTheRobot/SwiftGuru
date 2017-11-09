import Foundation
import XCTest
/*:
#### Quicksort
*/
func qsort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    let pivot = array[0]
    return qsort(array.filter { $0 < pivot }) + array.filter { $0 == pivot } + qsort(array.filter { $0 > pivot })
}

/*:
 ##### Quicksort using operators
 
 This is a simple, fun exercise. The qsort() function written above is a generic quick sort logic that uses the first element of the given array as a pivot. Though this is not the best thing to do, we will use it for the sake of simplicity. Now, we will define three operators and use them together to write a concise version of quicksort! The three simple operators are:
 * a prefix operator ⍴ that returns the first element of an array
 * a prefix operator ⚀ that returns the size of the array
 * an infix operator ¦ that takes an array and a predicate and returns all elements on which the predicate passes
 
 */
prefix operator ⍴
prefix func ⍴<T>(w: [T]) -> T {
    //YOUR CODE GOES HERE
    return w[0]
}

prefix operator ⚀
prefix func ⚀<T>(w: [T]) -> Int {
    //YOUR CODE GOES HERE
    return w.count
}

infix operator ¦
func ¦<T> (w: [T], predicate: (T)->Bool) -> [T] {
    //YOUR CODE GOES HERE
    return w.filter(predicate)
}

/*:
Now refering to the qsort() function can you rewrite it as q() using the three operators you defined. You may also use Swift's builtin operators.
*/
func q<T : Comparable>(_ w: [T]) -> [T] {
    //YOUR CODE GOES HERE
    return ⚀w <= 1 ? w : q(w ¦ { $0 < ⍴w }) + (w ¦ { $0 == ⍴w}) + q(w ¦ { $0 > ⍴w })
}

XCTAssertEqual(q([4, 10, 9, 9, 8, 6, 4]), [4, 4, 6, 8, 9, 9, 10])
XCTAssertEqual(q(["Tokyo", "New York", "Bangalore"]), ["Bangalore", "New York", "Tokyo"])

/*:
 ##### Precedence Groups
 You have had a taste of custom operators with the quicksort exercise. Next, let us try defining two infix operators on Int arrays:
 * the |+| operator that does an element-wise addition
    [1, 2, 3] |+| [4, 5, 6] = [5, 7, 9]
 * the |*| operator that doesn an element-wise multiplication
    [1, 2, 3] |*| [4, 5, 6] = [4, 10, 18]
 
 The |*| operator must have a higher precedence over the |+| operator.
*/

//YOUR CODE GOES HERE
func binaryOp(_ a: [Int], _ b: [Int], _ op: (Int, Int) -> Int) -> [Int] {
    precondition(a.count == b.count)
    var c: [Int] = []
    for idx in 0..<a.count {
        c.append(op(a[idx], b[idx]))
    }
    return c
}

infix operator |+|: AdditionPrecedence
func |+| (_ a: [Int], _ b: [Int]) -> [Int] {
    return binaryOp(a, b, +)
}

infix operator |*|: MultiplicationPrecedence
func |*| (_ a: [Int], _ b: [Int]) -> [Int] {
    return binaryOp(a, b, *)
}

XCTAssertEqual(([1, 2, 3] |+| [4, 5, 6]), [5, 7, 9])
XCTAssertEqual(([1, 2, 3] |*| [4, 5, 6]), [4, 10, 18])
XCTAssertEqual(([1, 2, 3] |+| [4, 5, 6] |*| [7, 8, 9]), [29, 42, 57])

