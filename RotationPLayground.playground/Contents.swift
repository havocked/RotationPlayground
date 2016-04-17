//: Playground - noun: a place where people can play

import UIKit
import XCPlayground


extension UIView {
    
    ///The less is the timeToRotate, the more fast the animation is !
    func spinClockwise(timeToRotate: Double) {
        startRotate(CGFloat(M_PI_2), speed: timeToRotate)
    }
    
    ///The less is the timeToRotate, the more fast the animation is !
    func spinAntiClockwise(timeToRotate: Double) {
        startRotate(CGFloat(-M_PI_2), speed: timeToRotate)
    }
    
    func startRotate(angle: CGFloat, speed: Double) {
        UIView.animateWithDuration(speed, delay: 0.0, options:[UIViewAnimationOptions.CurveLinear, UIViewAnimationOptions.Repeat], animations: {
            self.transform = CGAffineTransformMakeRotation(angle)
            }, completion: nil)
        print("Start rotating")
    }
    
    func stopAnimations() {
        self.layer.removeAllAnimations()
        print("Stop rotating")
    }
}

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
let animatedView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))

animatedView.backgroundColor = UIColor.greenColor()
containerView.backgroundColor = UIColor.purpleColor()

containerView.addSubview(animatedView)
animatedView.center = containerView.center

animatedView.spinClockwise(0.2)

let time: NSTimeInterval = 5.0
let delay = dispatch_time(DISPATCH_TIME_NOW,
                          Int64(time * Double(NSEC_PER_SEC)))
dispatch_after(delay, dispatch_get_main_queue()) {
    animatedView.stopAnimations()
}

XCPlaygroundPage.currentPage.liveView = containerView