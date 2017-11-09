import Foundation
import XCTest
/*:
####Quicksort
*/
func qsort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    let pivot = array[0]
    return qsort(array.filter { $0 < pivot }) + qsort(array.filter { $0 == pivot }) + qsort(array.filter { $0 > pivot })
}

/*:
 #####Quick sort using custom operators
 
 Let us have an operator that returns the first element of an array. Lets call it ⍴
 */
prefix operator ⍴
prefix func ⍴<T>(w: [T]) -> T {
    return w[0]
}

prefix operator ⚀
prefix func ⚀<T>(w: [T]) -> Int {
    return w.count
}

infix operator ¦
func ¦<T> (w: [T], predicate: (T)->Bool) -> [T] {
    return w.filter(predicate)
}

func q<T : Comparable>(_ w: [T]) -> [T] {
    return ⚀w <= 1 ? w : q(w ¦ { $0 < ⍴w }) + q(w ¦ { $0 == ⍴w }) + q(w ¦ { $0 > ⍴w })
}

q([10, 9, 8, 6, 4])
q(["Tokyo", "New York", "Bangalore"])
