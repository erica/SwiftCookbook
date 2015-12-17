/*

Erica Sadun, http://ericasadun.com

*/

import Foundation
import Cocoa

public func DebugPrintExamples() {
    let dict = ["a" : 1, "b" : 2]
    print(dict)
    debugPrint(dict)
    
    let lipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    let words = lipsum.characters.split(2, isSeparator:{$0 == " "}).map({String($0)})
    print(words)
    debugPrint(words)
    
    print(1...5)
    debugPrint(1...5)

    "Hello World"***
    let x = 5
    let y = 3
    let z = x*** + y // prints 5
    let w = 1 + z*** // prints 8
    w*** // prints 9
}


internal func HuntingDownDebugExamples() {
    //let x = "Snoop"
    //let x = 1...5
    //let x = ["a":1, "b":2]
    
    let grin = UnicodeScalar(0x1f601)
    let x = grin
    
    var a = ""; print(x, toStream: &a); print(a)
    var b = ""; debugPrint(x, toStream: &b); print(b)
    
    func ExitAfter(t: Double, _ status: Int32) {
        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW,
                numericCast(UInt64(t * Double(NSEC_PER_SEC)))),
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {exit(status)})
    }

    if a != b {
        print("YES!")
        NSSound(named: "Sosumi")?.play()
        ExitAfter(0.5, 0)
        CFRunLoopRun()
    } else {print("No")}
}
