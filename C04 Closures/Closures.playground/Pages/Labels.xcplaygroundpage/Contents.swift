//: [Previous](@previous)

import Foundation

//: ### Argument labels

func f1(x: Int) {}
f1(1) // no label

func f2(x x: Int) {}
f2(x: 1) // label

struct s1{let x: Int}
s1(x: 1) // label in constructor


//: ### By convention, initializers use explicit labels

struct MyStruct{
    let x: Int
    init(x: Int) {self.x = x}
    func myMethod(y: Int, z: Int){}
}

let s = MyStruct(x: 1)
// let s = MyStruct.init(x: 1)
s.myMethod(2, z: 3)


//: You can use an external _ to skip labels
func testEquality(x: Int, _ y: Int) -> Bool {
    return x == y
}
print(testEquality(1, 2)) // false

//: [Next](@next)
