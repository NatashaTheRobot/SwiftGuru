/*:
 ## Session 1: Functional Swift
 ### 1.4 Higher-order Functions
 */

//1. Transform [1,2,3,4,5] into Squares
//1.1 Using For Loop
var transformedArray = [Int]()
for number in (1...5) {
    transformedArray.append(number * number)
}
transformedArray

//1.2 Using Map

//2 Convert [[1,2,3],[4,5,6],[7,8,9]] to [1,2,3,4,5,6,7,8,9]
//2.1 Using For Loop
var flatMappedArray = [Int]()
for array in [[1,2,3],[4,5,6],[7,8,9]] {
    for number in array {
        flatMappedArray.append(number)
    }
}
flatMappedArray

//2.2 Using flatMap

//3. Filter even numbers from [1,2,3,4,5]
//3.1 Using For Loop
var filteredArray = [Int]()
for number in (1...5) {
    if number % 2 == 0 {
        filteredArray.append(number)
    }
}
filteredArray

//3.2 Using Filter

//4. Calculate the sum of [1,2,3,4,5]
//5.1 Using For Loop
var reducedNumber = 0
for number in (1...5) {
    reducedNumber += number
}
reducedNumber

//4.2 Using Reduce
