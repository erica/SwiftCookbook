//: [Previous](@previous)

import Foundation

// NOTE: CURRYING TO BE REMOVED IN SWIFT 3.0

//: ### Currying: part 2

class TestClass {
    func multiParameterMethod(arg1: Int, _ arg2: Int, _ arg3: Int) {
        print("\(arg1) \(arg2) \(arg3)")
    }
}

let test = TestClass()
TestClass.multiParameterMethod(test)(1, 2, 3)

//: [Next](@next)
