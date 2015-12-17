import Foundation

//: ### Basic Function/Closure Comparison

//: Using a double label exposes the external name, so you can call this with x: as well as y:
func testEquality(x x: Int, y: Int) -> Bool {
    return x == y
}
testEquality(x: 0, y: 1)
testEquality(x: 1, y: 1)

//: (Int, Int) -> Bool
print(testEquality.dynamicType)

//: A more fluent Objective-C-influenced naming is conventional for Swift
func testEqualityBetweenX(x: Int, andY y: Int) -> Bool {
    return x == y
}
testEqualityBetweenX(1, andY: 2) // false

//: Assign a closure to use the same x:y: signature
let testEqualityClosure = {
        (x x: Int, y y: Int) -> Bool in
        return x == y
}
testEqualityClosure(x:1, y:2)
testEqualityClosure(x:1, y:1)
print(testEqualityClosure.dynamicType)

// Call using a tuple argument
let testArgs = (x:1, y:1)
print(testEquality(testArgs)) // true
print(testEqualityClosure(testArgs)) // true

// Zip up some arguments and pass them
let pairs = zip([1, 2, 3, 4], [1, 5, 3, 8]).map({(x:$0.0, y:$0.1)})
let equalities = pairs.map({testEquality($0)})
let equalities2 = pairs.map({testEqualityClosure($0)})
print(equalities) // true, false, true, false
print(equalities2) // true, false, true, false
let equalities3 = zip([1, 2, 3, 4], [1, 5, 3, 8]).map({(tuple: (x:Int, y:Int)) in testEquality(tuple)}) // true, false, true, false

let testEquality: (Int, Int) -> Bool = (==)

//: [Next](@next)
