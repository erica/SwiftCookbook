//: [Previous](@previous)

import Foundation

func testEquality(x x: Int, y: Int) -> Bool {return x == y}
let testEqualityClosure = {(x x: Int, y y: Int) -> Bool in x == y}

let testArgs = (x:1, y:1)
let testArgs2 = (1, 1)
let testArgs3 = (a: 1, b: 1)

testEquality(testArgs)
testEqualityClosure(testArgs)

// This may change
// testEquality(testArgs2) // fail
// testEquality(testArgs3) // fail

let pairs = zip([1, 2, 3, 4], [1, 5, 3, 8]).map({(x:$0.0, y:$0.1)})
//let pairs = zip([1, 2, 3, 4], [1, 5, 3, 8]).map({$0}) // partially matching parameter lists
let equalities = pairs.map({testEquality($0)})
let equalities2 = pairs.map({testEqualityClosure($0)})
print(equalities) // true, false, true, false
print(equalities2) // true, false, true, false

let equalities3 = zip([1, 2, 3, 4], [1, 5, 3, 8]).map({
    (tuple: (x:Int, y:Int)) in  testEquality(tuple)})
print(equalities3)
//: [Next](@next)
