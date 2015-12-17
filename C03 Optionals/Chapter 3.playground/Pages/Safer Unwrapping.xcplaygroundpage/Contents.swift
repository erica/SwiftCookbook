//: [Previous](@previous)

import Foundation
//: ### Safe Unwrapping

//: Use if-let for safe, conditional binding
var soundDictionary = ["cow":"moo", "dog":"bark", "pig":"squeal"]
let animal = "cow"
// let animal = "fox"
if let sound = soundDictionary[animal] {    print("The \(animal) says \(sound)")} else {    print("Any sound the \(animal) says is unknown to modern science")}

//: The "pyramid of doom"
if let cowSound = soundDictionary["cow"] {
    if let dogSound = soundDictionary["dog"] {
        if let pigSound = soundDictionary["pig"] {
            // Use unwrapped values here
            print("\(cowSound), \(dogSound), \(pigSound)")
        }
    }
}

//: Let cascade
if let
    cowSound = soundDictionary["cow"],
    dogSound = soundDictionary["dog"],
    pigSound = soundDictionary["pig"] {
       // use unwrapped values here
       print("\(cowSound), \(dogSound), \(pigSound)")
}

//: The cascade stops when a value cannot be unwrapped
if let
    iguanaSound         = soundDictionary["iguana"],
    hippopotamusSound   = soundDictionary["hippopotamus"],
    pigSound            = soundDictionary["pig"] {
        // use sounds here
    } else {
    print("No luck")
}

//: [Next](@next)
