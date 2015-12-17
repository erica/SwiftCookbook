//: [Previous](@previous)

import Foundation

//: ### Tuples

// true == initial struct
#if false
    struct MyStruct {
        var a: Int
        var b: String
        var c: Double
    }
    
    #else
    struct MyStruct {
        var a: Int
        var b: String
        var c: Double
        init(a: Int, b: String, c: Double) {
            (self.a, self.b, self.c) = (a, b, c)
        }
        init(_ a: Int, _ b: String, _ c: Double) {
            self.init(a:a, b:b, c:c)
        }
    }
#endif

let mystruct = MyStruct(a: 1, b: "Hello", c: 2.4)

let labeledTuple = (a:1, b:"Hello", c:2.2)
labeledTuple.1 // "Hello"
labeledTuple.b // "Hello"

let mystruct2 = MyStruct(labeledTuple)

let unlabledTuple = (1, "Hello", 2.2)
let mystruct3 = MyStruct(unlabledTuple) // will not work unless you update MyStruct for unlabeled initializer


let mirror1 = Mirror(reflecting: mystruct)
mirror1.children.count
mirror1.children.forEach{print("\($0.label): \($0.value)")}

let mirror2 = Mirror(reflecting: labeledTuple)
mirror2.children.count
mirror2.children.forEach{print("\($0.label): \($0.value)")}

//: [Next](@next)
