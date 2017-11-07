import Foundation
import XCTest

struct Program {
    let text: String
    
    public init(_ text: String) {
        self.text = text
    }
}

extension Program : Sequence {
    func makeIterator() -> TokenIterator {
        return TokenIterator(self)
    }
}

struct TokenIterator : IteratorProtocol {
    let tokens: [String]
    var index = 0
    
    init( _ program: Program) {
        tokens = program.text
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { $0.count > 0 }
    }
    
    mutating func next() -> String? {
        guard index < tokens.count else { return nil }
        defer { index += 1 }
        return tokens[index]
    }
}

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

extension Matrix: MutableCollection {
    
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
        get {
            return Array(elements[position*columns..<(position+1)*columns])
        }
        set(newValue) {
            for i in 0..<newValue.count {
                self.elements[position * columns + i] = newValue[i]
            }
        }
    }
}

extension Matrix: BidirectionalCollection {
    func index(before idx: Int) -> Int {
        return idx - 1
    }
}

extension Matrix {
    func first() -> Element? {
        return self.first
    }
    
    func rows(upTo idx: Int) -> SubSequence? {
        return self.prefix(upTo: idx)
    }
    
    func row(at idx: Int) -> Element? {
        return self[idx]
    }
    
    func rows(in range: Range<Int>) -> SubSequence? {
        return self[range]
    }
    
    func last() -> Element? {
        return self.last
    }
    
    func rows(from index: Int) -> SubSequence? {
        return self.suffix(from: index)
    }
    
    mutating func replaceWithZeros(at index: Int) {
        self[index] = Array(repeatElement(0, count: columns))
    }
    
    mutating func swapRows(at idx: Int, with: Int) {
        self.swapAt(idx, with)
    }
    
    func sums() -> [Int] {
        return []
    }
    
    func sums(predicate: ([Int]) -> Bool) -> [Int] {
        return []
    }
    
}

//Tests
//Sequences
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

//Collections
var matrix = Matrix(Array(1...24), rows: 6, columns: 4)
XCTAssertEqual(matrix.first()!, [1, 2, 3, 4])

let rows = matrix.rows(upTo: 2)
XCTAssertNotNil(rows)
XCTAssertEqual(rows![0], [1, 2, 3, 4])
XCTAssertEqual(rows![1], [5, 6, 7, 8])

let rowAt2 = matrix.row(at: 2)
XCTAssertNotNil(rowAt2)
XCTAssertEqual(rowAt2!, [9, 10, 11, 12])

let rows2to4 = matrix.rows(in: Range<Int>(2...4))
XCTAssertNotNil(rows2to4)

XCTAssertEqual(rows2to4![2], [9, 10, 11, 12])
XCTAssertEqual(rows2to4![3], [13, 14, 15, 16])
XCTAssertEqual(rows2to4![4], [17, 18, 19, 20])

XCTAssertEqual(matrix.last()!, [21, 22, 23, 24])

let lastThreeRows = matrix.rows(from: 3)
XCTAssertNotNil(lastThreeRows)
XCTAssertEqual(lastThreeRows![3], [13, 14, 15, 16])
XCTAssertEqual(lastThreeRows![4], [17, 18, 19, 20])
XCTAssertEqual(lastThreeRows![5], [21, 22, 23, 24])

matrix.replaceWithZeros(at: 0)
XCTAssertEqual(matrix.first()!, [0, 0, 0, 0])

matrix.swapRows(at: 0, with: 5)
XCTAssertEqual(matrix.first()!, [21, 22, 23, 24])
XCTAssertEqual(matrix.last()!, [0, 0, 0, 0])
