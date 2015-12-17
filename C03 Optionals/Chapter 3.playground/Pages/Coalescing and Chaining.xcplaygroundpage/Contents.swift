//: [Previous](@previous)

import Foundation

//: ### Coalescing and Chaining

//: Use the coalescing operator (??) to provide unwrapping fallback values
var soundDictionary = ["cow":"moo", "dog":"bark", "pig":"squeal", "empty":""]
let soundWithFallback = soundDictionary["fox"] ?? "unknown"

//: Optional Chaining
var animal = "cow"
// animal = "fox" // Uncomment to create error
let sound = String(soundDictionary[animal]?.characters)

soundDictionary.description.characters.count // non-optional chaining
soundDictionary[animal]?.characters.count // 3 for Moo
soundDictionary[animal]!.capitalizedString // Moo or Runtime Error

let test1 = soundDictionary[animal]?.capitalizedString // String?
let test2 = soundDictionary[animal]?.characters.first?.hashValue // Int?

import UIKit

//: Optional constructor with AnyClass instance
let colorClass: AnyClass = UIColor.self
let noncolorClass: AnyClass = NSString.self
colorClass.blueColor?()
noncolorClass.blueColor?()
// noncolorClass.blueColor() // unrecognized selector exception


//: Only Subclass 1 implements the something method
class BaseClass {}
class Subclass1: BaseClass {
    func something() -> String {return "Success"}
}
class Subclass2: BaseClass {}

var instance: BaseClass = Subclass1()
(instance as? Subclass1)?.something() // nil
instance = Subclass2()
(instance as? Subclass1)?.something() // "Success"

//: Nodes are normally heterogeneous in type
import SpriteKit
var node: SKNode = SKShapeNode(circleOfRadius: 24.0)
(node as? SKShapeNode)?.lineWidth = 4.0

//: Recipe 3-2
//: Optional-chaining in action
let numberArray = [2, 3, 8, 5, 1, 6, 9, 8]
extension Array where Element:Comparable {
    var maxIndex: Int? {
    return enumerate().maxElement({$1.element > $0.element})?.index
    }
}
print(numberArray.maxIndex)

//: Subscript chaining
let array: Array? = [1, 2, 3, 4, 5]
array?[0] // 1
// array?[8] // still fails, fatal "Array index out of range" error

//: Create a failable look-up that returns optionals using the safe: subscript
extension Array {
    subscript (safe index: UInt) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }
}
print(array?[safe: 0]?.dynamicType)
print(array?[safe: 8]?.dynamicType)
array?[safe:8] // the ? before [ is required

let arrayDict = [0:[1, 2], 1:[3, 4]]
// arrayDict[0][1] // error
arrayDict[0]?[1] // 2
// arrayDict[0]?[8] // Out of range error
arrayDict[8]?[1] // nil

//: [Next](@next)
