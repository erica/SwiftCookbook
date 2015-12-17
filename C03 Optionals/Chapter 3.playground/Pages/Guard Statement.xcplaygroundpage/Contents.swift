//: [Previous](@previous)

import Foundation
var soundDictionary = ["cow":"moo", "dog":"bark", "pig":"squeal"]

//: ### Guard Statements

//: Use guard to unwrap with early return
enum Error: ErrorType {case MissingValue, Odd, Failure}

if let cowSound = soundDictionary["cow"] {
    // cowSound is unwrapped within this scope
}

//: There is no fox sound, so catch a missing value error
do {
    guard let cowSound = soundDictionary["cow"] else {throw Error.MissingValue}
    print(cowSound)
    
    guard let foxSound = soundDictionary["fox"] else {throw Error.MissingValue}
    print(foxSound)
} catch { print(error) }

guard let
    cowSound = soundDictionary["cow"],
    dogSound = soundDictionary["dog"]
    else {throw Error.MissingValue}


guard
    soundDictionary.count > 2,
    let cowSound = soundDictionary["cow"],
    let dogSound = soundDictionary["dog"]
    else {throw Error.MissingValue}

soundDictionary.count // 3


//: This structure can only be initialized with even numbers
struct EvenInt {
    let number: Int
    init?(_ number: Int) {
        if number % 2 == 0 {
            self.number = number
        } else {
            return nil
        }
    }
}

//: Guard statements ensure that each element is properly initialized
//: You cannot init from 3, so this throws an error
do {
    guard let even2 = EvenInt(2) else {throw Error.Odd}
    print(even2)
    guard let even3 = EvenInt(3) else {throw Error.Odd}
    print(even3)
} catch {print(error)}

//: Optionals as semaphores mimic Cocoa patterns
func doSomething() -> String? {
    let success = (arc4random_uniform(2) == 1) // flip a coin
    if success {return "success"} // succeed
    return nil // fail
}

if let result = doSomething() {
    // use result here
}

//: With Swift, use error handling instead
/// - Throws: Error.cranky: Bad day for Xcode, 
/// - Throws: Error.failure: On fail
/// - Returns: Nothing
func betterDoSomething() throws -> String {
    let success = (arc4random_uniform(2) == 1) // flip a coin
    if success {return "success"} // succeed
    throw Error.Failure // fail
}

do {
    let result = try betterDoSomething()
} catch {print(error)}

struct FailStruct {
    let x = 0
    init() throws {
        let success = (arc4random_uniform(2) == 1) // flip a coin
        if !success {throw Error.Failure}
    }
}

do {
    let test = try FailStruct()
} catch {print("Construction failed \(error)")}

//: [Next](@next)
