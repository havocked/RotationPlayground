//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground

extension NSView {
    
    ///The less is the timeToRotate, the more fast the animation is !
    func spinClockwise(timeToRotate: Double) {
        startRotate(CGFloat(M_PI_2), speed: timeToRotate)
    }
    
    ///The less is the timeToRotate, the more fast the animation is !
    func spinAntiClockwise(timeToRotate: Double) {
        startRotate(CGFloat(-M_PI_2), speed: timeToRotate)
    }
    
    func startRotate(angle: CGFloat, speed: Double) {
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = speed
        rotateAnimation.repeatCount = .infinity
        
        self.layer?.addAnimation(rotateAnimation, forKey: nil)
        
        Swift.print("Start rotating")
    }
    
    func stopAnimations() {
        self.layer?.removeAllAnimations()
        Swift.print("Stop rotating")
    }
}

let containerView = NSView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
let view = NSView(frame: NSRect(x: 0, y: 0, width: 150, height: 150))
containerView.wantsLayer = true
view.wantsLayer = true

containerView.layer?.backgroundColor = NSColor.blueColor().CGColor
view.layer?.backgroundColor = NSColor.redColor().CGColor


let containerFrame = containerView.frame
let center = CGPointMake(CGRectGetMidX(containerFrame), CGRectGetMidY(containerFrame))
containerView.addSubview(view)

//You have to set the positon and the anchor point so that the rotation is at center
view.layer?.position = center
view.layer?.anchorPoint = CGPointMake(0.5, 0.5)

view.spinClockwise(3)

let time: NSTimeInterval = 5.0
let delay = dispatch_time(DISPATCH_TIME_NOW,
                          Int64(time * Double(NSEC_PER_SEC)))
dispatch_after(delay, dispatch_get_main_queue()) {
    view.stopAnimations()
}

XCPlaygroundPage.currentPage.liveView = containerView
