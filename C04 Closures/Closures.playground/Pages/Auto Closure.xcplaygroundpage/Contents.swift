//: [Previous](@previous)

import Foundation
import UIKit

//: ### Auto Closure

func Wait(@autoclosure closure: () -> Void) {
    print("Happens first")
    closure() // Executes now
    print("Happens last")
}

Wait(print("This goes in the middle"))

func simpleAssert(@autoclosure condition: () -> Bool, _ message: String) {
    if !condition() {print(message)}
}

//: Recipe 4-6
extension UIView {
    class func animate(duration: NSTimeInterval, @autoclosure(escaping) _ animations: () -> Void) {
        UIView.animateWithDuration(duration, animations: animations)
    }
}

//: [Next](@next)
