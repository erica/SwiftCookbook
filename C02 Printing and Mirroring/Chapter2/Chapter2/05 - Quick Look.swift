/*

Erica Sadun, http://ericasadun.com

*/

import Foundation
import Cocoa

// Basic QuickLookable
class QPrintable: NSObject {
    var debugQuickLookObject: NSBezierPath {
        return QPath() // Bezier path of letter Q
    }
}

public func QuickLookableExample() {
    let q = QPrintable()
    print(q, terminator: "")
    
// <-- BREAK POINT AROUND HERE
}
