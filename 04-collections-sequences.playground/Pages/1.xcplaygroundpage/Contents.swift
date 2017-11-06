/*:
 ## Collections and Sequences

 This playground will help you build your own collection type. After going through this playground you must be able to appreciate how conforming to the different collection protocols gives you standard library functionality in return, for your own types.

 #### The Protocols

 The different protocols that we will play around today are:
 1. Sequence
 2. Collection
 3. BidirectionalCollection
 4. RandomAccessCollection
 5. MutableCollection
 6. RangeReplacableCollection

 #### Example

 Matrices have always been super important in the various disciplines of computer science, right from graph algorithms to deep learning. Deep learning is soon becoming mainstream and so is linear algebra that the former is based upon. Thinking in terms of matrices is common practice in deep learning algorithms!

 Let us attempt to implement a simple matrix type, which has an array as its backing data structure. Let us then conform to the various protocols listed above and get a first hand experience of the rich functionality we get in return. We will work with a very simple 2-D matrix abstraction. The dimensions of a matrix are represented by the pair (m, n) where m = number of rows and n = number of columns.

 We may want to support the reshaping operation. Given a (m, n) matrix we may want to reshape it to (p, r) under the constraint that m * n == p * r.

 So, let us write a simple Matrix type.
 */
import Foundation

struct Matrix2D {
    var elements: [Int]
    var rows: Int
    var columns: Int

    init(_ elements: [Int], rows: Int, columns: Int) {
        precondition(rows * columns == elements.count)
        self.elements = elements
        self.rows = rows
        self.columns = columns
    }

    mutating func reshape(rows: Int, columns: Int) {
        precondition(rows * columns == self.rows * self.columns)
        self.rows = rows
        self.columns = columns
    }
}

/*:
 ##### Sequence: iterating through the rows of the matrix
 As a part of our deep learning package we want to have the ability to iterate through the matrix, one row at a time! How do we implement this functionality without actually looping through the array? The `Sequence` protocol is one possible way.
 Once our type is a Sequence, we can use the `for-in` construct and also it's functional counterpart `forEach`. All we need is to make our type conform to Sequence and create an iterator that conforms to IteratorProtocol.

 Please refer to: https://developer.apple.com/documentation/swift/iteratorprotocol
 */
extension Matrix2D: Sequence {
    func makeIterator() -> RowIterator {
        //Exercise begins
        return RowIterator(self)
        //Exercise ends
    }
}

struct RowIterator: IteratorProtocol {
    let matrix: Matrix2D
    var index = 0

    init(_ matrix: Matrix2D) {
        self.matrix = matrix
    }

    mutating func next() -> [Int]? {
        //Exercise begins
        guard index < matrix.rows else { return nil }
        defer { index += 1 }
        return Array(matrix.elements[(index * matrix.columns)..<((index + 1) * matrix.columns)])
        //Exercise ends
    }
}

var matrix = Matrix2D(Array(1...24), rows: 3, columns: 8)
/*:
 > The for-in loop simply works with our type now.
 */
for row in matrix {
    print(row)
}
matrix.reshape(rows: 6, columns: 4)
/*:
 > And this must print the reshaped rows
 */
matrix.forEach { print($0) }

/*:
 > Printing the sum of every row of the matrix
 */
let m = matrix.map {
    row in row.reduce(0,+)
}
print(m)

/*:
 > Printing only those rows whose sum is divisible by 10
 */
//Exercise begins
matrix.filter { row in row.reduce(0, +) % 10 == 0 }
    .forEach { print($0) }
//Exercise ends

/*:
 ##### Collection: making Matrix2D row indexable
* matrix.first must return the first row
* matrix[2] must return the second row
* matrix[2...4] must return rows 2, 3 and 4

 Refer to https://developer.apple.com/documentation/swift/collection
 */
extension Matrix2D: Collection {

    var startIndex: Int {
        return 0
    }

    var endIndex: Int {
        return rows
    }

    func index(after idx: Int) -> Int {
        return idx + 1
    }

    subscript(position: Int) -> [Int] {
        return Array(elements[position*columns..<(position+1)*columns])
    }
}
/*:
 > Print the first row of the matrix
 */
print(matrix.first!)

/*:
 > Print the third row of the matrix
 */
print(matrix[2])
/*:
 > Print rows 2, 3 and 4 of the matrix
 */
matrix[2...4].forEach { print($0) }
