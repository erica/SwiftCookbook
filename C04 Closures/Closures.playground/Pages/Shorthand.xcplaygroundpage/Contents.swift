//: [Previous](@previous)

import Foundation

//: ### Shorthand Argument Names

//: Positional arguments
let testEquality: (Int, Int) -> Bool = {return $0 == $1}
testEquality(1, 2) // false
testEquality(2, 2) // true

//: Contrast with named arguments
let testEquality2 = {(x: Int, y: Int) -> Bool in return x == y}
testEquality2(1, 2) // false
testEquality2(2, 2) // true

//: Labeled positional arguments
let testEquality3: (x: Int, y: Int) -> Bool = {return $0 == $1}
testEquality3(x:1, y:2) // false
testEquality3(x:2, y:2) // true

let testEquality4: (x: Int, y: Int) -> Bool = {x, y in return x == y}
testEquality4(x:1, y:2) // false
testEquality4(x:2, y:2) // true

let testEqualityFull: (x: Int, y: Int) -> Bool = {(x: Int, y: Int) -> Bool in return x == y}
testEqualityFull(x:1, y:2) // false
testEqualityFull(x:2, y:2) // true

let hello = {print("Hello")}
let random = {return Int(arc4random_uniform(100))}
//let printit = {print($0)} // this is problematic

// Initializers
String(5)
Int("3")

[1, 5, 2, 9, 6].forEach{print($0)}
[(2, 3), (5, 1), (6, 7)].forEach{print($0)}
[(2, 3), (5, 1), (6, 7)].forEach{print("a: \($0) b: \($1)")}

let a = 1; let b = 2
withExtendedLifetime(a, {print("a: \($0)")})
withExtendedLifetime((a, b)){print("a: \($0) b: \($1)")}

//: [Next](@next)
