//: [Previous](@previous)

import Foundation
import UIKit

//: ### Casting

//: Type casting
var dict: [String: Any] = [:]
dict["Three"] = 3

var test = dict["Three"] is Any // true, will warn (ignore warning)
test = dict["Three"] is Int // true
test = dict["Three"] is String // false

let value = 3
value is Any // true
value is Int // true
value is String // false

let optionalValue = value as? Int // Int?

if let result = dict["Three"] as? Int {
    print("\(result + 3) is 6") // 6 is 6
}

//: Recipe 3-1
//: Conditionally cast to test typing
public func fetchViewWithType<T>(type t: T.Type, contentView: UIView) -> T? {
    for eachView in contentView.subviews {
        if let view = eachView as? T {return view}
        if let subview = fetchViewWithType(type: t.self, contentView:eachView) {
            return subview
        }
    }
    return nil
}

//: Test Recipe 3-1 by finding an image view in a UISwitch instance
let foo = UISwitch()
print(foo.subviews.first?.subviews)
fetchViewWithType(type: UIImageView.self, contentView: foo)

//: [Next](@next)
