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
}
