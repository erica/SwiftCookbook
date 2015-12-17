//: [Previous](@previous)

import Foundation

// Minimum conformance for collection type
struct UpTo {var count: Int}

extension UpTo: CollectionType {
    var startIndex: Int {return 0}
    var endIndex: Int {return count}
    subscript(idx: Int) -> Int? {return idx < count ? idx : nil}
}

let f = UpTo(count: 2)
for idx in f {print(idx)}

//: [Next](@next)
