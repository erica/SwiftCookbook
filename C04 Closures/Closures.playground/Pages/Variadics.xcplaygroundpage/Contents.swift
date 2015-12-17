//: [Previous](@previous)

import Foundation

//: ### Variadics

//: Recipe 4-4
func RunningSum(numbers: Int...) {
    var sum = 0
    for eachNumber in numbers {
        sum += eachNumber
        print("\(eachNumber): \(sum)")
    }
    print("Sum: \(sum)")
}

RunningSum()
RunningSum(1, 5, 3, 2, 8)


//: Recipe 4-5
extension Array {
    typealias ArrayType = Element
    subscript(i1: Int, i2: Int, rest: Int...) ->  [ArrayType] {
        var result = [self[i1], self[i2]]
        for index in rest {
            result += [self[index]]
        }
        return result
    }
}

//: [Next](@next)
