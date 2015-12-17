//: [Previous](@previous)

import Foundation

//: ### Inferred closure types

let random = {return Int(arc4random_uniform(100))}
var nums = (1...5).map({_ in random()})
print(nums)
nums.sortInPlace({$0 > $1}) // reverse sort
print(nums)

let testEquality1: (Int, Int) -> Bool = {
    (x, y) -> Bool in
    x == y
}

let testEquality2: (Int, Int) -> Bool = {
    (x, y) in
    x == y
}

let testEquality3: (Int, Int) -> Bool = {(x, y) in x == y}

let testEquality4: (Int, Int) -> Bool = (==)

testEquality4(1, 2)
testEquality4(1, 1)

//: [Next](@next)
