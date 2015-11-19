//
//  SpeechBubbleCellAnimator.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit

class SpeechBubbleTableViewCellAnimator {
    
    // From a Ray Wenderlich tutorial:
    // http://www.raywenderlich.com/76024/swift-table-view-animations-tutorial-drop-cards
    // and Adam
    class func animateCell(cell: UITableViewCell, withDelayConstant constant: Double, multiplier: Int) {
        let view = cell.contentView
        view.layer.opacity = 0
        UIView.animateWithDuration(0.4, delay: constant * Double(multiplier), options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            view.layer.opacity = 1
            }, completion: { (finished) -> Void in
        })
    }
}
