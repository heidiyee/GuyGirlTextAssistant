//
//  File.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit

protocol SpeechBubbleTableViewCell {
    weak var speechBubbleView: UIView! { get set }
    weak var speechTextLabel: UILabel! { get set }
    weak var tail: UIView! { get set }
}

extension SpeechBubbleTableViewCell {
 
    func configureWithColor(color: UIColor, text: String, cornerRadius: CGFloat) {
        self.speechBubbleView.layer.cornerRadius = cornerRadius
        self.speechBubbleView.backgroundColor = color
        self.tail.backgroundColor = color
        self.speechTextLabel.text = text
    }
    
    /*
    func configureSpeechBubbleTableViewCell(cell: SpeechBubbleTableViewCell, withGrayscaleGradientBetween first: CGFloat, andSecond second: CGFloat, text: String) {
    cell.speechBubbleView.layer.cornerRadius = self.cornerRadius
    cell.speechTextLabel.text = text
    
    let bubbleGradientLayer = CAGradientLayer()
    bubbleGradientLayer.cornerRadius = self.cornerRadius
    bubbleGradientLayer.colors = [UIColor(white: first, alpha: 1).CGColor, UIColor(white: second, alpha: 1).CGColor]
    bubbleGradientLayer.frame = cell.speechBubbleView.bounds
    cell.speechBubbleView.layer.insertSublayer(bubbleGradientLayer, atIndex: 0)
    
    //        let tailGradientLayer = CAGradientLayer()
    //        let difference = abs(first - second)
    //        if first < second {
    //            tailGradientLayer.colors = [UIColor(white: first, alpha: 1).CGColor, UIColor(white: first + difference, alpha: 1).CGColor]
    //        } else {
    //            tailGradientLayer.colors = [UIColor(white: second + difference, alpha: 1).CGColor, UIColor(white: second, alpha: 1).CGColor]
    //        }
    //        tailGradientLayer.frame = cell.tail.bounds
    //        cell.tail.layer.insertSublayer(tailGradientLayer, atIndex: 0)
    }
    */
    
}