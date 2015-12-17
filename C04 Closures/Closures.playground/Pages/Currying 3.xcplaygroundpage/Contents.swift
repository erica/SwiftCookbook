//: [Previous](@previous)

import Foundation
import UIKit
import SpriteKit
import XCPlayground

// NOTE: CURRYING TO BE REMOVED IN SWIFT 3.0

//: ### Curried Path Creation (part 3 of Currying sequence)
//: **Open the assistant (View > Assistant Editor > Show Assistant Editor) to view the animation.**
//: Actual currying is in Sources/Utility.swift for speed and optimization
//: Make sure to run the playground using Editor > Execute Playground

//: Recipe 4-8 is found in the Sources folder for this playground page

//: Select two random positions
public let randomPosition = {CGFloat(arc4random_uniform(320))}
public var p0 = CGPoint(x: randomPosition() + 40.0, y: randomPosition() + 40.0)
public var p1 = CGPoint(x: randomPosition() + 40.0, y: randomPosition() + 40.0)
public let tuple = (p0: p0, p1: p1)

// Establish scene
public let skview = SKView(frame:CGRect(x: 0, y: 0, width: 400, height: 400))
public let skscene = SKScene(size:skview.frame.size)
skscene.backgroundColor = .whiteColor()
skview.presentScene(skscene)

// Select a random function
public let fSoftSin: FunctionType = {CGFloat(0.5 * sin($0 * CGFloat(2.0 * M_PI)))}
public let fSin: FunctionType = {CGFloat(sin($0 * CGFloat(M_PI)))}
public let fSawTooth: FunctionType = {($0 * 5) % 1}
public let fToApply = withExtendedLifetime([fSoftSin, fSin, fSawTooth]){$0[Int(arc4random_uniform(numericCast($0.count)))]}

//: Sin function example
let projectableSinFunction = projectFunctionToCoordinateSystem(function: fSin)
let (pA, pB) = (CGPoint.zero, CGPoint(x:100, y:100))
let xequalySin = projectableSinFunction(p0: pA, p1: pB)
let xequalyPath = buildPath(xequalySin)

//: Live animation example
//: Choose Editor > Execute Playground to run with new random points

// Establish path
public let projectedFunction = projectFunctionToCoordinateSystem(function: fToApply)
public let path = buildPath(projectedFunction(tuple))

// Show path
public var pathSprite = SKShapeNode(path: path.CGPath)
pathSprite.strokeColor = .blackColor(); pathSprite.lineWidth = 2
skscene.addChild(pathSprite)

// Show sprite actor
public var sprite = SKShapeNode(circleOfRadius: 40)
sprite.position = p1; sprite.lineWidth = 8
sprite.strokeColor = .redColor()
skscene.addChild(sprite)

// Animate
XCPlaygroundPage.currentPage.liveView = skview
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
sprite.runAction(SKAction.followPath(path.CGPath, asOffset:false, orientToPath: false, duration: 2.0))

//: [Next](@next)
