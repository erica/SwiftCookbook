//: [Previous](@previous)

import UIKit

//: ### No-Escape

extension UIView {
    class func animate(duration: NSTimeInterval,
        @autoclosure(escaping) _ animations: () -> Void) {
            UIView.animateWithDuration(duration, animations: animations)
    }
}

typealias VoidBlockType = () -> Void

func callEscape(closure: VoidBlockType) {
    closure() // call the escape closure
}

func callNoEscape(@noescape closure: VoidBlockType) {

    // Using @noescape means closure ends its lifetime when its scope ends its lifetime and closure will not be stored or used at a later time
    
    // Invalid uses:
    
    // Non-escaping function in escaping context
    // Cannot pass as escaping parameter
    // dispatch_async(dispatch_get_main_queue(), closure)
    // let observer = NSNotificationCenter.defaultCenter()
    //    .addObserverForName(nil, object: nil, 
    //    queue: NSOperationQueue.mainQueue(), usingBlock: closure)
    
    // Non-escaping function in escaping context
    // Cannot store as escaping param
    // let holdClosure: VoidBlockType = closure

    // Closure use of @noescape parameter 'closure' may allow it to escape
    // Cannot use in normal escaping scope
    // let otherClosure  = {closure()}
    
    closure() // call the no-escape closure
}

class MyClass {
    var value = 0
    func testNoEscape() {
        callNoEscape{value += 1; print(value)}
    }
    
    func testEscape() {
        // reference to property 'value' in closure requires explicit 'self.' to make capture semantics explicit
        // callEscape{value += 1; print(value)} // error
        callEscape{self.value += 1; print(self.value)}
    }
}

MyClass().testNoEscape()
MyClass().testEscape()


//: [Next](@next)
