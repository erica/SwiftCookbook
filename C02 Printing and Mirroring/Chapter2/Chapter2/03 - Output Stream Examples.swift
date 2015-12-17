/*
 
 Erica Sadun, http://ericasadun.com
 
 */

import Foundation

extension String { var ns: NSString {return self as NSString}}

public func OutputStreamExamples() {
    print("Testing error output", toStream: &errStream)
    print("Hello ", terminator: "", toStream: &errStream)
    print("World", toStream: &errStream)
    
    print("Testing std output", toStream: &errStream)
    print("Hello ", terminator: "", toStream: &stdStream)
    print("World", toStream: &stdStream)
    
// WARNING: Swift 3.0 will remove if var construction. (nwm)
// Break out testStream assignment, per the following re-design
//    if var testStream = OutputStream(path: "~/Desktop/output.txt".ns.stringByExpandingTildeInPath) {
//        print("Testing custom output", toStream: &testStream)
//        print("Hello ", terminator: "", toStream: &testStream)
//        print("World", toStream: &testStream)
//        print("Output sent to \(testStream.path)")
//    } else {
//        print("Failed to create custom output")
//    }
    
    if let outputStream = OutputStream(path: "~/Desktop/output.txt".ns.stringByExpandingTildeInPath) {
        var outputStream = outputStream
        print("Testing custom output", toStream: &outputStream)
        print("Hello ", terminator: "", toStream: &outputStream)
        print("World", toStream: &outputStream)
        print("Output sent to \(outputStream.path)")
    } else {
        print("Failed to create custom output")
    }
}

public func CustomLogExamples() {
    SWLog("Hello world") // no args
    SWLog("Formatted double: %2.3f", 5.2) // one arg
    SWLog("Double plus string %2.3f, %@", 5.2, "Hello world") // multiple args
    
    // Fail
//     SWLog("Struct: %@, Int: %03zd", CGPoint(x: 50, y: 20), 5) // Swift struct - won't work
    
    // Succeed
    SWLog("Struct: \(CGPoint(x: 50, y: 20)), Int: %03zd", 5)
}
