/*
 
 Erica Sadun, http://ericasadun.com
 
 */

import Foundation

func BasicStringPrinting() {
    var s = ""
    print("Hello World", toStream: &s)
    print(s) // "Hello World\n" plus second newline
    
    s = ""
    print("Hello ", terminator: "", toStream: &s)
    print("World", terminator: "", toStream: &s)
    print(s) // "Hello World" plus newline
    
    var log = ""
    print("\(NSDate()): Hello World", toStream: &log)
    print("\(NSDate()): Hello World", toStream: &log)
    print("\(NSDate()): Hello World", toStream: &log)
    print(log, terminator: "")

    // Carriage return to separate examples
    print("")
}
