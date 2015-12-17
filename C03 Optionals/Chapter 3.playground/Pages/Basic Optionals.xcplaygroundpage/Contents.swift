import UIKit

//: ### Basic Optionals
var soundDictionary = ["cow":"moo", "dog":"bark", "pig":"squeal"]
print(soundDictionary["cow"] == "moo") // prints trueprint(soundDictionary["fox"]) // What does the fox say?

//: Confirm the dictionary type
print(soundDictionary.dynamicType) // Swift.Dictionary<Swift.String, Swift.String>

//: Confirm that look-ups produce optionals
var sound = soundDictionary["cow"] // String?
print(sound.dynamicType) // Swift.Optional<Swift.String>

//: Don't use this optional type without unwrapping
// uncomment for error: value of optional type 'String?' not unwrapped; did you mean to use '!' or '?'?
// let statement = "The cow says " + sound

//: Forced unwrapping is dangerous
// uncomment for error: fatal error: unexpectedly found nil while unwrapping an Optional value
// sound = soundDictionary["fox"]
print("The sound is \(sound!)") // may or may not crash, depending on how sound was assigned

//: Safer approach tests for nil first

if sound != nil {
    print("The sound is \(sound!)")
}

//: [Next](@next)
