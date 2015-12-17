//: [Previous](@previous)

import Foundation
import UIKit

//: ### Capturing Values

var item = 25

//non-capture version
//var closure = {print("Value is \(item)")}

// capture version
var closure = {[item] in print(item)}

item = 35
closure()

class MyClass {
    var value = "InitialValue"
}

var instance = MyClass() // original assignment
var closure2 = {[instance] in print(instance.value)} // captured
instance = MyClass() // updated assignment
instance.value = "UpdatedValue"
closure2()

// This is stored externally in an associated sources file
// You can also paste into a standalone command-line app
globalFunc()


//: [Next](@next)
