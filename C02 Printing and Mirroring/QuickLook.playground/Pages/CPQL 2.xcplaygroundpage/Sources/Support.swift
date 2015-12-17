import Cocoa

// Produce an arrow to a point
public func ArrowFromPoint(p: CGPoint) -> NSBezierPath {
    let theta = Double(atan2(p.y, p.x))
    var transform = NSAffineTransform()
    
    // Construct path
    let path = NSBezierPath(); path.moveToPoint(.zero); path.lineToPoint(p)
    
    // Scale down to 200 points
    let scaleFactor = 100.0 / max(path.bounds.size.width, path.bounds.size.height)
    transform.scaleBy(scaleFactor); path.transformUsingAffineTransform(transform)
    
    // Transform the point in question
    let cgtransform = CGAffineTransformMakeScale(CGFloat(scaleFactor), CGFloat(scaleFactor))
    let tpt = CGPointApplyAffineTransform(p, cgtransform)
    
    // Create arrow head
    let arrow = NSBezierPath()
    let amount = 10.0
    arrow.moveToPoint(CGPoint(x:-amount, y:-amount / 2.0))
    arrow.lineToPoint(.zero)
    arrow.lineToPoint(CGPoint(x:-amount, y:amount / 2.0))
    
    // Rotate the arrow head
    transform = NSAffineTransform()
    transform.rotateByRadians(CGFloat(theta))
    arrow.transformUsingAffineTransform(transform)
    
    // Move arrow head into place
    transform = NSAffineTransform()
    transform.translateXBy(CGFloat(tpt.x), yBy: CGFloat(tpt.y))
    arrow.transformUsingAffineTransform(transform)
    path.appendBezierPath(arrow)
    
    return path
}
