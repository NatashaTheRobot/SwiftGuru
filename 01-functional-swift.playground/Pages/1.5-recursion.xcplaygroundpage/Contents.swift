/*:
 ## Session 1: Functional Swift
 ### 1.5 Recursion
 - Be able to use recursion in functional way
 */

import Foundation

//1. Fibbonacci
func fib(_ n: Int) -> Int {
    if n == 0 || n == 1 { return n }
    return fib(n - 1) + fib(n - 2)
}

fib(4)

//2. Factorial
func factorial(_ num: Int) -> Int {
    if num == 1 {
        return 1
    }
    return num * factorial(num - 1)
}

factorial(4)
