// The MIT License (MIT)
//
// Copyright (c) 2015-2016 litt1e-p ( https://github.com/litt1e-p )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import Foundation

public enum WindowRootVcTransitionStyle: UInt
{
    case None,
         ZoomOut,
         ZoomIn,
         Dissolve,
         SliceVertical,
         SliceHorizontal,
         FlipFromLeft,
         FlipFromRight,
         FlipFromTop,
         FlipFromBottom,
         CurlUp,
         CurlDown,
         Random
}

public extension UIWindow
{
    public func transitRootVc(rootVc: UIViewController, style: WindowRootVcTransitionStyle?, duration: NSTimeInterval?) {
        var finalStyle: WindowRootVcTransitionStyle = style != nil ? style! : .Random
        if finalStyle == .Random {
            var randomInt: UInt = 0
            arc4random_buf(&randomInt, 11)
            finalStyle = WindowRootVcTransitionStyle(rawValue: UInt(randomInt % 11))!
        }
        transitAnimation(rootVc, style: finalStyle, duration: duration)
    }
    
    public func transitRootVc(identifier: String, style: WindowRootVcTransitionStyle?, duration: NSTimeInterval?) {
        var finalStyle: WindowRootVcTransitionStyle = style != nil ? style! : .Random
        if finalStyle == .Random {
            var randomInt: UInt = 0
            arc4random_buf(&randomInt, 11)
            finalStyle = WindowRootVcTransitionStyle(rawValue: UInt(randomInt % 11))!
        }
        if let rootVc = rootViewController?.storyboard?.instantiateViewControllerWithIdentifier(identifier) {
            transitAnimation(rootVc, style: finalStyle, duration: duration)
        } else {
            fatalError("Instantiate viewController failed")
        }
    }
    
    private func transitAnimation(toVc: UIViewController, style: WindowRootVcTransitionStyle, duration: NSTimeInterval?) {
        let durationMin: NSTimeInterval = duration != nil ? duration! : 0.25
        let durationMax: NSTimeInterval = duration != nil ? duration! : 0.50
        switch style {
        case .ZoomOut:
            let snapshot:UIView = snapshotViewAfterScreenUpdates(true)!
            toVc.view.addSubview(snapshot)
            rootViewController = toVc
            UIView.animateWithDuration(durationMin, animations: {() in
                snapshot.layer.opacity = 0.00
                snapshot.layer.transform = CATransform3DMakeScale(1.50, 1.50, 1.50)
                }, completion: {
                    (value: Bool) in
                    snapshot.removeFromSuperview()
            })
        case .ZoomIn:
            let snapshot:UIView = snapshotViewAfterScreenUpdates(true)!
            toVc.view.addSubview(snapshot)
            rootViewController = toVc
            UIView.animateWithDuration(durationMax, animations: {() in
                snapshot.layer.opacity = 0.00
                snapshot.layer.transform = CATransform3DMakeScale(0.01, 0.01, 1.00)
                }, completion: {
                    (value: Bool) in
                    snapshot.removeFromSuperview()
            })
        case .Dissolve:
            let snapshot:UIView = snapshotViewAfterScreenUpdates(true)!
            toVc.view.addSubview(snapshot)
            rootViewController = toVc
            UIView.animateWithDuration(durationMin, animations: {
                snapshot.layer.opacity = 0.00
                }, completion: { (value: Bool) in
                    snapshot.removeFromSuperview()
            })
        case .SliceVertical:
            let halfH        = toVc.view.frame.size.height * 0.50
            let aboveRect    = CGRectMake(0.00, 0.00, toVc.view.frame.size.width, halfH)
            let belowRect    = CGRectMake(0.00, halfH, toVc.view.frame.size.width, halfH)
            let aboveImgView = UIImageView(image: clipImage(self, rect: aboveRect))
            let belowImgView = UIImageView(image: clipImage(self, rect: belowRect))
            toVc.view.addSubview(aboveImgView)
            toVc.view.addSubview(belowImgView)
            rootViewController   = toVc
            toVc.view.layer.transform = CATransform3DMakeScale(0.98, 0.98, 1.00)
            UIView.animateWithDuration(durationMax, animations: {
                aboveImgView.layer.transform = CATransform3DMakeTranslation(0.00, -halfH, 0.00)
                belowImgView.layer.transform = CATransform3DMakeTranslation(0.00, halfH, 0.00)
                toVc.view.layer.transform    = CATransform3DIdentity
                }, completion: { (value: Bool) in
                    aboveImgView.removeFromSuperview()
                    belowImgView.removeFromSuperview()
            })
        case .SliceHorizontal:
            let halfW        = toVc.view.frame.size.width * 0.50
            let wholeH       = toVc.view.frame.size.height
            let leftRect     = CGRectMake(0.00, 0.00, halfW, wholeH)
            let rightRect    = CGRectMake(halfW, 0.00, halfW, wholeH)
            let leftImgView  = UIImageView(image: clipImage(self, rect: leftRect))
            let rightImgView = UIImageView(image: clipImage(self, rect: rightRect))
            toVc.view.addSubview(leftImgView)
            toVc.view.addSubview(rightImgView)
            rootViewController   = toVc
            toVc.view.layer.transform = CATransform3DMakeScale(0.98, 0.98, 1.00)
            UIView.animateWithDuration(durationMax, animations: {
                leftImgView.layer.transform = CATransform3DMakeTranslation(-halfW, 0.00, 0.00)
                rightImgView.layer.transform = CATransform3DMakeTranslation(halfW * 2.00, 0.00, 0.00)
                toVc.view.layer.transform = CATransform3DIdentity
                }, completion: { (value: Bool) in
                    leftImgView.removeFromSuperview()
                    rightImgView.removeFromSuperview()
            })
        case .FlipFromLeft:
            UIView.transitionWithView(self, duration: durationMin, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        case .FlipFromRight:
            UIView.transitionWithView(self, duration: durationMin, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        case .CurlUp:
            UIView.transitionWithView(self, duration: durationMin, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        case .CurlDown:
            UIView.transitionWithView(self, duration: durationMin, options: UIViewAnimationOptions.TransitionCurlDown, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        case .FlipFromTop:
            UIView.transitionWithView(self, duration: durationMin, options: UIViewAnimationOptions.TransitionFlipFromTop, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        case .FlipFromBottom:
            UIView.transitionWithView(self, duration: durationMin, options: UIViewAnimationOptions.TransitionFlipFromBottom, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        default:
            rootViewController = toVc
            break
        }
    }
    
    private func clipImage(view: UIView, rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context!)
        UIRectClip(rect)
        view.layer.renderInContext(context!)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return output!
    }
}
