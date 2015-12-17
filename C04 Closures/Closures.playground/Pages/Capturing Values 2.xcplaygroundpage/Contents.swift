//: [Previous](@previous)

import Foundation
import XCPlayground
XCPSetExecutionShouldContinueIndefinitely()

//: ### Capturing Values

public func dispatchQueue() -> dispatch_queue_t {
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)}

public func dispatch_after(delay: NSTimeInterval,
    queue:dispatch_queue_t = dispatch_get_main_queue(),
    block: dispatch_block_t) {
        let delay = Int64(delay * Double(NSEC_PER_SEC))
        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW, delay),
            queue, block)
}

class Bumpable {
    var unownedBumpValueClosure: () -> Void = {}
    var weakBumpValueClosure: () -> Void = {}
    
    private var value = 0
    func showValue() {print("Value is now \(value)")}
    init() {
        self.weakBumpValueClosure = {
            [weak self] in
            if let strongSelf = self {
                strongSelf.value++
                strongSelf.showValue()
            }
        }
        self.unownedBumpValueClosure = {
            [unowned self] in
            self.value++
            self.showValue()
        }
    }
}

var bumper = Bumpable()
dispatch_after(2.0, block: bumper.unownedBumpValueClosure)
bumper.showValue()

//: [Next](@next)
