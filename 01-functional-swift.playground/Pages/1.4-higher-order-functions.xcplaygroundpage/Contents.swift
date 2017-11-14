/*:
 ## Session 1: Functional Swift
 ### 1.4 Higher-order Functions
 Higher order functions are simply functions that operate on other functions by either taking a function as an argument, or returning a function.
 - Be able to use map, filter, reduce and flatMap
 */

//1. Transform [1,2,3,4,5] into Squares
//1.1 Using For Loop
var transformedArray = [Int]()
for number in (1...5) {
    transformedArray.append(number * number)
}
transformedArray

//1.2 Using Map
let transformed = (1...5).map { $0 * $0 }
transformed

//2. Filter even numbers from [1,2,3,4,5]
//2.1 Using For Loop
var filteredArray = [Int]()
for number in (1...5) {
    if number % 2 == 0 {
        filteredArray.append(number)
    }
}
filteredArray

//2.2 Using Filter
let filtered = (1...5).filter { $0 % 2 == 0 }
filtered

//3. Calculate the sum of [1,2,3,4,5]
//3.1 Using For Loop
var reducedNumber = 0
for number in (1...5) {
    reducedNumber += number
}
reducedNumber

//3.2 Using Reduce
let reduced = (1...5).reduce(0) { (sum, number) -> Int in
    return sum + number
}
reduced

//4. Convert [[1,2,3],[4,5,6],[7,8,9]] to [1,2,3,4,5,6,7,8,9]
//1.1 Using For Loop
var flatMappedArray = [Int]()
for array in [[1,2,3],[4,5,6],[7,8,9]] {
    for number in array {
        flatMappedArray.append(number)
    }
}
flatMappedArray

//1.2 Using flatMap
let flatMapped = [[1,2,3],[4,5,6],[7,8,9]].flatMap { $0 }
flatMapped
