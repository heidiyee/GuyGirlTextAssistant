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
    
}
