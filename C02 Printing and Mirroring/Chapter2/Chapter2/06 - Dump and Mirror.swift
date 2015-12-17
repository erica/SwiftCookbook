/*

Erica Sadun, http://ericasadun.com

*/

import Foundation

/// Base structure
/// - See also: [Attempt To Link](05%20-%20Quick%20Look.swift) // does not work, even with workspace
public struct Point {
    var x = 0.0
    var y = 0.0
    var theta: Double {return atan2(y, x)}
    var degrees: Double {return theta * 180.0 / M_PI}
}

// Support for custom description / debugDescription
extension Point: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {return "(\(x), \(y))"}
    public var debugDescription: String {
        let places = pow(10.0, 3)
        let trunc = round(theta * places) / places
        return "(\(x), \(y)) \(degrees)°, \(trunc)"
    }
}

/// Custom mirror
extension Point: CustomReflectable {
    public func customMirror() -> Mirror {
        return Mirror(self, children: [
            "point": description,
            "theta": theta,
            "degrees": "\(degrees)°"
            ])
    }
}

// This alternative groups the angles together
//extension Point: CustomReflectable {
//    public func customMirror() -> Mirror {
//        return Mirror(self, children: [
//            "point": description,
//             "angles": [
//                "theta": theta,
//                "degrees": "\(degrees)°"
//                ]
//        ])
//    }
//}

func DumpExamples() {
    let p = Point(x:-3.0, y: 6.0)
    dump(p)
    
    // <-- add break here and po p
}
