//: [Previous](@previous)

import Cocoa

struct Point: CustomPlaygroundQuickLookable {
    var x = 0.0
    var y = 0.0
    var description: String {return "(\(x), \(y))"}
    var theta: Double {return atan2(y, x)}
    var degrees: Double {return theta * 180.0 / Double(M_PI)}
    var debugDescription: String {
        let places = pow(10.0, 3)
        let trunc = round(theta * places) / places
        return "(\(x), \(y)) \(degrees)°, \(trunc)"
    }
    
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return PlaygroundQuickLook.Point(x, y)
    }
}

let p = Point(x: -3, y: 6)

//: [Next](@next)
