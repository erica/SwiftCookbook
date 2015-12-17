//: [Previous](@previous)

import Foundation

//: ### Nesting functions

//: Recipe 4-1
enum CompareType{case Equal, Unequal}
func compareFunction(comparison: CompareType) -> (Int, Int) -> Bool {
    func testEquality(x: Int, y: Int) -> Bool {return x == y}
    func testInequality(x: Int, y: Int) -> Bool {return x != y}
    switch comparison {
    case .Equal: return testEquality
    case .Unequal: return testInequality
    }
}

compareFunction(.Equal)(1, 2) // false
compareFunction(.Equal)(1, 1) // true


//: Recipe 4-2
// n choose i
// Admittedly, not an ideal solution for efficiency, overflow
func n(n: Int, choose i: Int) -> Int {
    precondition(i < n, "n choose i is not legal when n (\(n)) < i (\(i))")
    precondition(i > 0, "choose value i (\(i)) must be positive") // forces n > 0
    func factorial(n: Int) -> Int {return (1...n).reduce(1, combine:*)}
    return factorial(n) / (factorial(i) * factorial(n - i))
}

print(n(5, choose:3)) // 10
print(n(10, choose:4)) // 210

//n(5, choose:-6)
//n(5, choose:6)


//: Recipe 4-3
let myFactorialFactoryClosure: () -> ((Int) -> Int) = {
    func factorial(n: Int) -> Int {return (1...n).reduce(1, combine:*)}
    return factorial
}

let fac = myFactorialFactoryClosure()
fac(5) // 120

func outerFunc() -> Int {
    var n = 5
    func incrementN() {n += 1}
    incrementN()
    incrementN()
    return n
}

outerFunc() // 7

//: [Next](@next)
