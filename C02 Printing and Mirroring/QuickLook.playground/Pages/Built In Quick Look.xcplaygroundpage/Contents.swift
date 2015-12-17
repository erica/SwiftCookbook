//: [Previous](@previous)

import Foundation
import Cocoa

NSColor.blueColor()
CGRect(x: 0, y: 0, width: 200, height: 100)

var attributes: [String: AnyObject] = [:]
attributes[NSFontAttributeName] = NSFont(name: "Georgia", size: 64.0)
attributes[NSStrokeWidthAttributeName] = 2
NSAttributedString(string: "Hello World", attributes: attributes)

//: [Next](@next)
