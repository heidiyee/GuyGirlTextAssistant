//
//  PhraseTableViewCell.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit

class LeftSpeechBubbleTableViewCell: UITableViewCell, SpeechBubbleTableViewCell {
    
    @IBOutlet weak var speechBubbleView: UIView!
    @IBOutlet weak var speechTextLabel: UILabel!
    @IBOutlet weak var tail: UIView!
    
    var highlightColor = UIColor(white: 0.4, alpha: 1.0)

    class func identifier() -> String {
        return "LeftSpeechBubbleTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureWithColorScheme(colorScheme: ColorScheme, text: String) {
        if colorScheme == ColorScheme.Q {
            self.configureWithColor(kQColorSchemeLeftSpeechBubbleColor, textColor: kQColorSchemeLeftTextColor, text: text, cornerRadius: kSpeechBubbleCornerRadius)
        } else { // ColorScheme.A
            self.configureWithColor(kAColorSchemeLeftSpeechBubbleColor, textColor: kAColorSchemeLeftTextColor, text: text, cornerRadius: kSpeechBubbleCornerRadius)
        }
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        if highlighted {
            let originalColor = self.speechBubbleView.backgroundColor
            self.speechBubbleView.backgroundColor = self.highlightColor
            self.tail.backgroundColor = self.highlightColor
            UIView.animateWithDuration(0.4) { () -> Void in
                self.speechBubbleView.backgroundColor = originalColor
                self.tail.backgroundColor = originalColor
            }
        }
    }
}
