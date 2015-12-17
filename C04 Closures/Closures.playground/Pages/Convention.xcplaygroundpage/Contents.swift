//: [Previous](@previous)

import UIKit

// Direct use of @convention
let myObjCCompatibleCallback: @convention(block) (CGPathElement) -> Void = {
    element in print(element)
}
let myCCompatibleCallback: @convention(c) (value: CGFloat) -> CGFloat = {
    (value: CGFloat) -> CGFloat in
    return value * 180.0 / CGFloat(M_PI)
}

// Typealias to build @convention(block) type
typealias CGPathApplierClosureType = @convention(block) (CGPathElement) -> Void

// Using that type alias for compatible closure argument
func CGPathApplyWithSwiftClosure(path: CGPath, closure: CGPathApplierClosureType) {
    CGPathApply(path, unsafeBitCast(closure, UnsafeMutablePointer<Void>.self)){
        info, element in
        let block = unsafeBitCast(info, CGPathApplierClosureType.self)
        block(element.memory)
    }
}

// Handy element enumeration
public enum BezierElement {
    case CloseSubpath
    case MoveToPoint(point: CGPoint)
    case AddLineToPoint(point: CGPoint)
    case AddQuadCurveToPoint(point: CGPoint, controlPoint1: CGPoint)
    case AddCurveToPoint(point: CGPoint, controlPoint1: CGPoint, controlPoint2: CGPoint)
}

// Decomposing a Bezier path to a Swift-based enumeration using CGPathApply
func decomposePath(path: UIBezierPath) -> [BezierElement] {
    var points: [BezierElement] = []
    CGPathApplyWithSwiftClosure(path.CGPath){
        element in
        switch element.type {
        case .CloseSubpath: points.append(.CloseSubpath)
        case .MoveToPoint: points.append(.MoveToPoint(point:element.points[0]))
        case .AddLineToPoint: points.append(.AddLineToPoint(point:element.points[0]))
        case .AddQuadCurveToPoint: points.append(.AddQuadCurveToPoint(point:element.points[1], controlPoint1: element.points[0]))
        case .AddCurveToPoint: points.append(.AddCurveToPoint(point:element.points[2], controlPoint1: element.points[0], controlPoint2: element.points[1]))
        }
    }
    return points
}

// Quicky for reconstructing path, to determine whether the Swift enumeration correctly captures the original
extension BezierElement {
    func appendToPath(path: UIBezierPath) {
        switch self {
        case .CloseSubpath: path.closePath()
        case .MoveToPoint(let point): path.moveToPoint(point)
        case .AddLineToPoint(let point): path.addLineToPoint(point)
        case .AddQuadCurveToPoint(let point, let controlPoint1): path.addQuadCurveToPoint(point, controlPoint: controlPoint1)
        case .AddCurveToPoint(let point, let controlPoint1, let controlPoint2): path.addCurveToPoint(point, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        }
    }
}

let path = UIBezierPath()
decomposePath(QPath()).forEach{$0.appendToPath(path)}
let qPath = QPath()
path // reconstructed, should match QPath

//: [Next](@next)
