//: [Previous](@previous)

import Foundation

//: ### Mapping

//: Mapping and optionals

//: Non-nil case
var x: Int? = 8
var doubleX = x.map({2 * $0})
print(doubleX) // Optional(-8)

//: nil case
x = nil
doubleX = x.map({2 * $0})
print(doubleX) // nil

//: Both map and flatMap return identical values in this minimal example
var word: String? = "hello"
print(word.map({$0}))
print(word.flatMap({$0}))

//: However, these differentiate the two because the second won't compile
//: as flatMap must return optional
// print(word.map({string->String in string})) // succeeds, returns String
// print(word.flatMap({string->String in string})) // fails, returns String

//: Super-basic optional chaining compared to equivalent map
var cap = word.map({$0.capitalizedString})
cap = word?.capitalizedString

//: Use flatmap to extract values
let optionalNumbers: [Int?] = [1, 3, 5, nil, 7, nil, 9, nil]
let nonOptionals = optionalNumbers.flatMap({$0})
print(nonOptionals) // [1, 3, 5, 7, 9]

//: Recipe 3-3
func FlatMembers<T>(array: [T?]) -> [T] {
    return array.flatMap({$0})
}
FlatMembers(optionalNumbers)

//: Non-existent ternary conditional binding semi-workaround.
//:
//:    if let x = x ? [x] : []
//:
//: Apple rejected radar requesting ternary conditional 20587497
let optValue = Optional(6)
//let optValue: Int? = nil
let result = [optValue].flatMap({$0})
print(result)

//: [Next](@next)
