//
//  AnswerTableViewCell.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/17/15.
//
//

import UIKit

class RightSpeechBubbleTableViewCell: UITableViewCell, SpeechBubbleTableViewCell {

    @IBOutlet weak var speechBubbleView: UIView!
    @IBOutlet weak var speechTextLabel: UILabel!
    @IBOutlet weak var tail: UIView!
    
    class func identifier() -> String {
        return "RightSpeechBubbleTableViewCell"
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
            self.configureWithColor(kQColorSchemeRightSpeechBubbleColor, textColor: kQColorSchemeRightTextColor, text: text, cornerRadius: kSpeechBubbleCornerRadius)
        } else { // ColorScheme.A
            self.configureWithColor(kAColorSchemeRightSpeechBubbleColor, textColor: kAColorSchemeRightTextColor, text: text, cornerRadius: kSpeechBubbleCornerRadius)
        }
    }
}
