//: [Previous](@previous)

import Foundation

//: ### Implicitly Unwrapped Optionals

//: Unwrap the reassignment to fox to create an unwrapping error
var soundDictionary = ["cow":"moo", "dog":"bark", "pig":"squeal"]
var animal = "cow"
// animal = "fox"

//: Implicit unwrapping using the String! type
let wrappedSound = soundDictionary[animal]
var unwrappedSound: String! = soundDictionary[animal]
let soundString = "\"" + unwrappedSound + "\""
print("The unwrapped sound is \(soundString)")

print(wrappedSound) // Optional("moo")
print(unwrappedSound) // "moo"
print(wrappedSound.dynamicType) // Swift.Optional<Swift.String>
print(unwrappedSound.dynamicType) // Swift.ImplicitlyUnwrappedOptional<Swift.String>

//: Unwrapped optionals can be tested and printed. Uncomment this to see how.
// unwrappedSound = soundDictionary["fox"]
print(unwrappedSound) // moo or nil
if unwrappedSound != nil {
    print("valid: " + unwrappedSound)
}

//: You can assign optionals, non-optionals, and nil
//: but do not test except against nil if the value might be nil
var myImplicitlyUnwrappedOptional: String!
myImplicitlyUnwrappedOptional = Optional("Value")
myImplicitlyUnwrappedOptional == "Value" // true
myImplicitlyUnwrappedOptional = nil // do not test except against nil
myImplicitlyUnwrappedOptional == nil // true
myImplicitlyUnwrappedOptional = "Value"
myImplicitlyUnwrappedOptional == "Value" // true

//: Simple pattern matching with switch
switch soundDictionary[animal] {
    case .Some(let sound):
        print("Using case, the unwrapped sound is \(sound) [1]")
    default: break
}

//: Using the ? shortcut for optional pattern matching
switch soundDictionary[animal] {
    case let sound?:
        print("Using case, the unwrapped sound is \(sound) [2]")
    default: break
}

//: Adding where clauses
switch soundDictionary[animal] {
case let sound? where sound.characters.count > 5:
    print("The \(sound) is long")
case let sound?:
    print("The \(sound) sound is under 5 characters")
default: break
}

//: Using pattern matching with if and where clauses
if case .Some(let sound) = soundDictionary[animal] where sound.hasPrefix("m") {
    print("Sound \(sound) starts with m")
}
if case let sound? = soundDictionary[animal] where sound.hasPrefix("m") {
    print("Sound \(sound) starts with m")
}
if case .Some(let sound) = soundDictionary[animal] where sound.characters.count < 5 {
    print("Sound \(sound) uses fewer than 5 characters [3]")
}
if case let sound? = soundDictionary[animal] where sound.characters.count < 5 {
    print("Sound \(sound) uses fewer than 5 characters [4]")
}

//: Using pattern matching with for loops
let soundOptionals = ["cow", "rhino", "dog", "goose", "hippo", "pig"].map({soundDictionary[$0]})
print(soundOptionals)
for case let sound? in soundOptionals {
    print("The sound \"\(sound)\" appears in the dictionary")
}

guard case let .Some(sound) = soundDictionary["cow"] else {fatalError()}
print(sound)

//: Contrast the for loop with map and flatMap
soundOptionals.map({print($0)}) // not unwrapped
soundOptionals.flatMap({print($0)}) // not unwrapped


//: [Next](@next)
