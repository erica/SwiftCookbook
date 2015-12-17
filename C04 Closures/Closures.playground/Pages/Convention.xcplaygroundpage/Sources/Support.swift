import UIKit

public func QPath() -> UIBezierPath {
    let path = UIBezierPath()
    
    path.moveToPoint(CGPoint(x:23.080078125, y:0.0))
    path.addLineToPoint(CGPoint(x:19.810546875, y:4.763671875))
    path.addCurveToPoint(CGPoint(x:24.064453125, y:15.240234375), controlPoint1:CGPoint(x:22.552734375, y:6.943359375), controlPoint2:CGPoint(x:24.064453125, y:10.6171875))
    path.addCurveToPoint(CGPoint(x:12.041015625, y:28.353515625), controlPoint1:CGPoint(x:24.064453125, y:23.291015625), controlPoint2:CGPoint(x:19.423828125, y:28.353515625))
    path.addCurveToPoint(CGPoint(x:0.0, y:15.240234375), controlPoint1:CGPoint(x:4.640625, y:28.353515625), controlPoint2:CGPoint(x:0.0, y:23.291015625))
    path.addCurveToPoint(CGPoint(x:12.041015625, y:2.14453125), controlPoint1:CGPoint(x:0.0, y:7.13671875), controlPoint2:CGPoint(x:4.640625, y:2.14453125))
    path.addCurveToPoint(CGPoint(x:16.505859375, y:2.865234375), controlPoint1:CGPoint(x:13.658203125, y:2.14453125), controlPoint2:CGPoint(x:15.15234375, y:2.373046875))
    path.addLineToPoint(CGPoint(x:18.509765625, y:0.0))
    path.closePath()
    
    path.moveToPoint(CGPoint(x:12.041015625, y:5.9765625))
    path.addCurveToPoint(CGPoint(x:4.640625, y:15.240234375), controlPoint1:CGPoint(x:7.505859375, y:5.9765625), controlPoint2:CGPoint(x:4.640625, y:9.580078125))
    path.addCurveToPoint(CGPoint(x:12.041015625, y:24.521484375), controlPoint1:CGPoint(x:4.640625, y:20.900390625), controlPoint2:CGPoint(x:7.505859375, y:24.521484375))
    path.addCurveToPoint(CGPoint(x:19.44140625, y:15.240234375), controlPoint1:CGPoint(x:16.55859375, y:24.521484375), controlPoint2:CGPoint(x:19.44140625, y:20.900390625))
    path.addCurveToPoint(CGPoint(x:17.0859375, y:8.47265625), controlPoint1:CGPoint(x:19.44140625, y:12.322265625), controlPoint2:CGPoint(x:18.580078125, y:9.984375))
    path.addLineToPoint(CGPoint(x:15.591796875, y:10.51171875))
    path.addLineToPoint(CGPoint(x:11.25, y:10.51171875))
    path.addLineToPoint(CGPoint(x:14.16796875, y:6.29296875))
    path.addCurveToPoint(CGPoint(x:12.041015625, y:5.9765625), controlPoint1:CGPoint(x:13.517578125, y:6.099609375), controlPoint2:CGPoint(x:12.796875, y:5.9765625))
    path.closePath()
    
    return path
}
