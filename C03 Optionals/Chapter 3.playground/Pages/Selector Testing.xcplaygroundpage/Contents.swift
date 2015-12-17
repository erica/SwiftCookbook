//: [Previous](@previous)

import Foundation

class Root {func rootFunc() {}}
class Sub1: Root {func sub1Func() {print("sub1")}}
class Sub2: Root {func sub2Func() {print("sub2")}}

var items: [Root] = [Sub1(), Sub2()]
(items[0] as? Sub1)?.sub1Func() // runs
(items[0] as? Sub2)?.sub2Func() // nil


import UIKit
let colorClass: AnyClass = UIColor.self
let noncolorClass: AnyClass = NSString.self
colorClass.blueColor?() // returns a blue color instance
noncolorClass.blueColor?() // returns nil

//: [Next](@next)
