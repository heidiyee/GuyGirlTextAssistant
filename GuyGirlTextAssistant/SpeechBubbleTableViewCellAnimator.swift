//
//  SpeechBubbleCellAnimator.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit

// From a Ray Wenderlich tutorial:
// http://www.raywenderlich.com/76024/swift-table-view-animations-tutorial-drop-cards

class SpeechBubbleTableViewCellAnimator {
    
    class func animate(cell: UITableViewCell) {
        let view = cell.contentView
        view.layer.opacity = 0
        UIView.animateWithDuration(0.5) { () -> Void in
            view.layer.opacity = 1
        }
    }
}
