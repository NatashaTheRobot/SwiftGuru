/*:
 #### Sequences
 A sequence is a list of values that you can step through, one at a time, the most common way being a _for-in_ loop. Sequences also offer a large variety of operations, including a few that are functional in nature.

*/
import PlaygroundSupport
import Foundation
import XCTest
/*:
###### A Sequence Example
 While the Swift standard and Foundation libraries offer built-in Sequence types like Array, ArraySlice, Range et al, it is very easy to have your own type conform to the Sequence protocol.
 
You can read more about Sequence here: https://developer.apple.com/documentation/swift/sequence

 It is simple to conform to the Sequence protocol. Let us take an example of an abstraction that represents a Swift program. Let us call it program. A program is a stream of tokens. So, we may want to have the Program type be a Sequence of Tokens. We are expected to do two things for this conformance:
 * Define an iterator that conforms to the IteratorProtocol and define the next() method
 * Program must conform to Sequence, for which we need to define the makeIterator() method
 
 Take a look at the Program abstraction here. It's a simple wrapper around a String.
*/
struct Program {
    let text: String
    
    public init(_ text: String) {
        self.text = text
    }
}
/*:
Now we want Program to be a sequence of tokens. So, let us begin by defining a TokenIterator that conforms to the IteratorProtocol. Just fill in the code for the next() function!
*/
struct TokenIterator : IteratorProtocol {
    let tokens: [String]
    var index = 0
    
    init( _ program: Program) {
        tokens = program.text
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { $0.count > 0 }
    }
    
    mutating func next() -> String? {
        //YOUR CODE GOES HERE
        guard index < tokens.count else { return nil }
        defer { index += 1 }
        return tokens[index]
    }
}
/*:
Great, we now have an interator that iterates through the tokens of a Program. But we need to connect it to our Program type through the Sequence protocol. Just fill in the code for the makeIterator() function and we'll be good to go!
*/
extension Program : Sequence {
    func makeIterator() -> TokenIterator {
        //YOUR CODE GOES HERE
        return TokenIterator(self)
    }
}
/*:
 Make sure the `testSequence()` test passes with the code you wrote above! And this brings us to the end of the first part of this exercise. We now know how to make your custom type behave like a Sequence.
 
 You may also try running the `for-in` loop with the Program type!

#### Collection
While a Sequence can be traversed once, using the iterator, a Collection can be traversed multiple times nondestructively, and accessed by an indexed subscript. The two common Collection types offered by the standard library are Array and Dictionary.

 The Swift Standard Library offers multiple Collection protocols. Here are some of them:
 * Collection
 * BidirectionalCollection
 * MutableCollection
 * RangeReplaceableCollection
 * RandomAccessCollection

To conform to each of these protocols, it is sufficient to implement a small number of methods or properties and a huge amount of functionality can be bought in return!

###### A Collection example
 
 Let us take up the example of a two-dimensional matrix. Matrices are super important in mathematical packages, especially the ones providing linear algebra functionality. We may want to look at a matrix as a collection of rows. Though, an independent implementation of such a "row indexed matrix" is not very difficult to achieve, going the Collections way makes it easier, pleasurable and more adaptable to change.
 
 Consider this simple Matrix abstraction:
 */
struct Matrix {
    var elements: [Int]
    var rows: Int
    var columns: Int
    
    init(_ elements: [Int], rows: Int, columns: Int) {
        precondition(rows * columns == elements.count)
        self.elements = elements
        self.rows = rows
        self.columns = columns
    }
}
/*:
Now, for our linear algebra package we have identified a set of functionalities the Matrix type must support. Take a close look at them and make sure you understand the functionality each of them is expected to offer.

 Implementing each of these methods will need you to conform to one of these protocols:
 * Collection
 * BidirectionalCollection
 * MutableCollection
 
 To implement all of the below methods, you will need to make sure the Matrix types conforms to the three protocols listed above. Before implementing them, let us scroll down to the two extensions that will conform Matrix to Collection, MutableCollection and BidirectionalCollection.
*/
extension Matrix {
    func first() -> Element? {
        //YOUR CODE GOES HERE
        return self.first
    }
    
    func rows(upTo idx: Int) -> SubSequence? {
        //YOUR CODE GOES HERE
        return self.prefix(upTo: idx)
    }
    
    func row(at idx: Int) -> Element? {
        //YOUR CODE GOES HERE
        return self[idx]
    }
    
    func rows(in range: Range<Int>) -> SubSequence? {
        //YOUR CODE GOES HERE
        return self[range]
    }
    
    func last() -> Element? {
        //YOUR CODE GOES HERE
        return self.last
    }
    
    func rows(from index: Int) -> SubSequence? {
        //YOUR CODE GOES HERE
        return self.suffix(from: index)
    }
    
    mutating func replaceWithZeros(at index: Int) {
        //YOUR CODE GOES HERE
        self[index] = Array(repeatElement(0, count: columns))
    }
    
    mutating func swapRows(at idx: Int, with: Int) {
        //YOUR CODE GOES HERE
        self.swapAt(idx, with)
    }
 
    //No tests
    func sums() -> [Int] {
        return []
    }
 
    //No tests
    func sums(predicate: ([Int]) -> Bool) -> [Int] {
        return []
    }
}
/*:
 To conform to Collection, your type needs to implement:
 * the startIndex property
 * the endIndex property
 * the index(after:) method which returns the next index
 * the subscript which allows indexed access to the collection
 
 To conform to BidirectionalCollection, we simply add one more method
 * index(before:) which returns the previous index
 
 To conform to the MutableCollection protocol, we only need to add a setter to the subscript that we added in the Collection conformance.
 
 Below, you can see two extensions. The first one conforms Matrix to MutableCollection and hence Collection. The second extension conforms Matrix to BidirectionalCollection.
 
 Fill in the implementatins of each of the methods and properties.
 */
extension Matrix: MutableCollection {
    
    var startIndex: Int {
        //YOUR CODE GOES HERE
        return 0
    }

    var endIndex: Int {
        //YOUR CODE GOES HERE
        return rows
    }

    func index(after idx: Int) -> Int {
        //YOUR CODE GOES HERE
        return idx + 1
    }

    subscript(position: Int) -> [Int] {
        get {
            //YOUR CODE GOES HERE
            return Array(elements[position*columns..<(position+1)*columns])
        }
        set(newValue) {
            //YOUR CODE GOES HERE
            for i in 0..<newValue.count {
                self.elements[position * columns + i] = newValue[i]
            }
        }
    }
}

extension Matrix: BidirectionalCollection {
    func index(before idx: Int) -> Int {
        //YOUR CODE GOES HERE
        return idx - 1
    }
}
/*:
Awesome! If you have reached here and have implemented everything that we expected you to, and correctly too, all of the following tests must pass. If they don't pass, don't worry. Revisit your implementation and let us know!
 
 If they are passing, then Congratulations!
*/
//Tests: Sequence
func testSequence() {
    let text = """
        struct Program {
            let text : String
            public init ( _ text : String ) {
                self.text = text
            }
        }
    """
    
    let program = Program(text)
    XCTAssertEqual(program.filter { $0 == "}" || $0 == "{" }.count, 4)
}

//Tests: Collection
var matrix = Matrix(Array(1...24), rows: 6, columns: 4)

func testCollectionsFirst() {
    XCTAssertEqual(matrix.first()!, [1, 2, 3, 4])
}

func testCollectionsRowsUpto() {
    let rows = matrix.rows(upTo: 2)
    XCTAssertNotNil(rows)
    XCTAssertEqual(rows![0], [1, 2, 3, 4])
    XCTAssertEqual(rows![1], [5, 6, 7, 8])
}

func testCollectionsRowAt() {
    let rowAt2 = matrix.row(at: 2)
    XCTAssertNotNil(rowAt2)
    XCTAssertEqual(rowAt2!, [9, 10, 11, 12])
}

func testCollectionsRowsIn() {
    let rows2to4 = matrix.rows(in: Range<Int>(2...4))
    XCTAssertNotNil(rows2to4)

    XCTAssertEqual(rows2to4![2], [9, 10, 11, 12])
    XCTAssertEqual(rows2to4![3], [13, 14, 15, 16])
    XCTAssertEqual(rows2to4![4], [17, 18, 19, 20])
}

func testCollectionsLast() {
    XCTAssertEqual(matrix.last()!, [21, 22, 23, 24])
}

func testCollectionsRowsFrom() {
    let lastThreeRows = matrix.rows(from: 3)
    XCTAssertNotNil(lastThreeRows)
    XCTAssertEqual(lastThreeRows![3], [13, 14, 15, 16])
    XCTAssertEqual(lastThreeRows![4], [17, 18, 19, 20])
    XCTAssertEqual(lastThreeRows![5], [21, 22, 23, 24])
}

func testReplaceWithZeros() {
    matrix.replaceWithZeros(at: 0)
    XCTAssertEqual(matrix.first()!, [0, 0, 0, 0])
}

func testSwapRows() {
    matrix.swapRows(at: 0, with: 5)
    XCTAssertEqual(matrix.first()!, [21, 22, 23, 24])
    XCTAssertEqual(matrix.last()!, [0, 0, 0, 0])
}

//Test invocation
testSequence()
testCollectionsFirst()
testCollectionsRowsUpto()
testCollectionsRowAt()
testCollectionsRowsIn()
testCollectionsLast()
testCollectionsRowsFrom()
testReplaceWithZeros()
testSwapRows()
print("Done!")
