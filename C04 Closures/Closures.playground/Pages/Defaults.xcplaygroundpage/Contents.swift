//: [Previous](@previous)

import Foundation

//: ### Default argument values

enum Coin {
    case Heads, Tails
    mutating func flip(times: Int = 1) {
        if times % 2 == 0 {return} // even means no flip
        switch self {
            case Heads: self = Tails
            case Tails: self = Heads
        }
    }
}

var coin = Coin.Heads
coin.flip() // tails
coin.flip(50) // tails

// Varies by random value
let random = {return Int(arc4random_uniform(100))}
for _ in 1...5 {
    coin.flip(random())
    print(coin)
}

extension Coin {
    // Defaults provided
    func prettyPrint(lhs lhs: String = "[", rhs: String = "]") {
        print("\(lhs)\(self)\(rhs)")
    }
    
    // No defaults provided
    func justPrintIt(lhs lhs: String, rhs: String) {
        print("\(lhs)\(self)\(rhs)")
    }
}

coin = Coin.Tails
coin.prettyPrint() // [Coin.Tails]
coin.prettyPrint(rhs: ">") // [Coin.Tails>
coin.prettyPrint(lhs: "<") // <Coin.Tails]
coin.prettyPrint(lhs: ">", rhs: "<") // >Coin.Tails<
coin.prettyPrint(rhs: ">", lhs: "<") // <Coin.Tails> / labels are flipped
print("")

// coin.justPrintIt(rhs: "XX", lhs: "XX") // fails because non-default arguments must be ordered
// print("")

extension Coin {
    func prettyPrintNoLabel(lhs: String = "[", rhs: String = "]") {
        print("\(lhs)\(self)\(rhs)")
    }
}

coin = Coin.Tails
coin.prettyPrintNoLabel() // [Coin.Tails]
coin.prettyPrintNoLabel(rhs: ">") // [Coin.Tails>
coin.prettyPrintNoLabel("<") // <Coin.Tails]
coin.prettyPrintNoLabel(">", rhs: "<") // >Coin.Tails<
coin.prettyPrintNoLabel(rhs: ">", "<") // <Coin.Tails>
print("")

extension Coin {
    func prettyPrintNoLabelsAtAll(lhs: String = "[", _ rhs: String = "]") {
        print("\(lhs)\(self)\(rhs)")
    }
}

coin = Coin.Tails
coin.prettyPrintNoLabelsAtAll() // [Coin.Tails]
coin.prettyPrintNoLabelsAtAll("<") // <Coin.Tails]
coin.prettyPrintNoLabelsAtAll(">", "<") // >Coin.Tails<
print("")

// Swift cannot use type inference to guess at parameter ordering
//extension Coin {
//    func prettyPrintWithTypes(lhs: Int = 0, _ rhs: String = "]") {
//        print("\(lhs)\(self)\(rhs)")
//    }
//}
// coin.prettyPrintWithTypes("X", 3) // type matching will not work


//: [Next](@next)
