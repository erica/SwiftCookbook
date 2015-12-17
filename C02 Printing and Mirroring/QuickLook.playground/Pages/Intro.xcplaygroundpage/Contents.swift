import Cocoa

class QPrintable: NSObject {
    var debugQuickLookObject: NSBezierPath {
        return QPath() // Bezier path of letter Q
    }
}

let q = QPrintable()
print(q)



// This playground contains multiple pages.
//: [Next](@next)
