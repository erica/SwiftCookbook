import Foundation
import UIKit

public typealias FunctionType = (CGFloat) -> CGFloat

//: Use currying to partially apply function to the
//: coordinate system established between two points
//: Recipe 4-7
public func projectFunctionToCoordinateSystem(function f: FunctionType)(p0: CGPoint, p1: CGPoint)(x: CGFloat) -> CGPoint {
    let dx = p1.x - p0.x
    let dy = p1.y - p0.y
    let magnitude = sqrt(dy * dy + dx * dx)
    let theta = atan2(dy, dx)
    
    var outPoint = CGPoint(x: x * magnitude, y: f(x) * magnitude)
    outPoint = CGPointApplyAffineTransform(outPoint, CGAffineTransformMakeRotation(theta))
    outPoint = CGPointApplyAffineTransform(outPoint, CGAffineTransformMakeTranslation(p0.x, p0.y))
    return CGPoint(x: outPoint.x, y: outPoint.y)
}

//: Build path using f(x)
public func buildPath(f: (CGFloat) -> CGPoint) -> UIBezierPath {
    let path = UIBezierPath(); path.moveToPoint(f(0.0))
    let dx = 0.01
    for value in 0.0.stride(to: 1.01, by: dx) {
        path.addQuadCurveToPoint(f(CGFloat(value)), controlPoint: f(CGFloat(value - dx / 2.0)))
        
    }
    return path
}
