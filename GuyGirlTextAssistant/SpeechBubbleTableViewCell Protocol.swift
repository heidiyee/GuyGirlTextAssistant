//
//  File.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit

let kSpeechBubbleCornerRadius: CGFloat = 18.0

protocol SpeechBubbleTableViewCell {
    weak var speechBubbleView: UIView! { get set }
    weak var speechTextLabel: UILabel! { get set }
    weak var tail: UIView! { get set }
}

extension SpeechBubbleTableViewCell {
 
    func configureWithColor(color: UIColor, textColor: UIColor, text: String, cornerRadius: CGFloat) {
        self.speechBubbleView.layer.cornerRadius = cornerRadius
        self.speechBubbleView.backgroundColor = color
        self.tail.backgroundColor = color
        self.speechTextLabel.textColor = textColor
        if text == "" || text == " " || text == "  " {
            self.speechTextLabel.text = "   "
        } else {
            self.speechTextLabel.text = text
        }
    }
}