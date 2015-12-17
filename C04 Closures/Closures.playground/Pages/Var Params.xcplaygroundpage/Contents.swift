//: [Previous](@previous)

import Foundation

//: ### Constant and Variable Parameters

// NOTE: Var parameters will be removed in Swift 3.0

func adjustValues(
    var varParameter varParameter: Int,
    letParameter: Int,
    inout inoutParameter: Int) {
    varParameter++ // updates within function scope
//        letParameter++ // compile-time error
    inoutParameter++ // updates within and outside function scope
    print("In Function: \((varParameter, letParameter, inoutParameter))")
}
var x = 10; var y = 20; var z = 30 // assign
print("Before: \((x, y, z))") // (10, 20, 30), check
adjustValues(varParameter: x, letParameter:y, inoutParameter: &z) // prints (11, 20, 31)
print("After: \((x, y, z))") // (10, 20, 31) z has now changed

//: [Next](@next)
