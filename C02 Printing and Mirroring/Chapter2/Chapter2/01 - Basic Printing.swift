/*
 
 Erica Sadun, http://ericasadun.com
 
 */

import Foundation

/// Basic Printing Routines
/// - Throws: Error.failure: Could not complete request
/// - Throws: Error.cranky: Bad day for Xcode
public func BasicPrinting() {
    // Outputs "Hello World" with carriage return
    print("Hello ", terminator:"")
    print("World")
    print("")
    
    // Create star output
    for n in 1...5 {
        print("\(n): ", terminator: "")
        print(String(count: n, repeatedValue: Character("*")))
    }
    print("")
    
    // Custom output stream
    struct StderrStream: OutputStreamType {
        static var shared = StderrStream()
        func write(string: String) {
            fputs(string, stderr)
        }
    }
    
    print("Hello ", terminator: "", toStream: &StderrStream.shared)
    print("World", toStream: &StderrStream.shared)
    print("", toStream: &StderrStream.shared)
    
    let value = 23
    print("Value: \(value)") // prints Value: 23
    print("The square of \(value) is \(value * value)")
    // prints The square of 23 is 529
    
    let count = "hello".characters.count
    print("\(count)")
//    print("\("hello".characters.count)") // cannot escape " in expression interpolation
}
