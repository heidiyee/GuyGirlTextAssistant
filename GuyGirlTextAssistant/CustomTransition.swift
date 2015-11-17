//
//  CustomTransition.swift
//  GuyGirlTextAssistant
//
//  Created by Heidi Yee on 11/16/15.
//
//

import UIKit



class CustomTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration = 1.0
    //var showShadow = false
    
    init(duration: NSTimeInterval) {
        self.duration = duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {return}
        guard let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) else {return}
        guard let containerView = transitionContext.containerView() else {return}
        
        let finalFrame = transitionContext.finalFrameForViewController(toViewController)
        let screenBounds = UIScreen.mainScreen().bounds
        
        toViewController.view.frame = CGRectOffset(finalFrame, 0.0, screenBounds.height)
        //toViewController.view.frame = CGRectMake(0.0, , screenBounds.width, screenBounds.height - 100)
        containerView.addSubview(fromViewController.view.snapshotViewAfterScreenUpdates(true))
        containerView.addSubview(toViewController.view)
        
        UIView.animateWithDuration(self.duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            toViewController.view.frame = CGRect(x: 0.0, y: screenBounds.height/3, width: finalFrame.width, height: 500.0)
            fromViewController.view.snapshotViewAfterScreenUpdates(true).layer.shadowOpacity = 0.8
            
            }) { (finished) -> Void in
                
                transitionContext.completeTransition(true)
        }
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return self.duration
    }
    
    
}