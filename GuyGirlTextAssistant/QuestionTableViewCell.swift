//
//  QuestionCell.swift
//  ParseStarterProject-Swift
//
//  Created by Heidi Yee on 11/18/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class QuestionTableViewCell: UITableViewCell {
    
    var question: PFObject! {
        didSet {
            if let questionString = question["questionString"] as? String {
                questionLabel.text = questionString
            }
        }
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    
    class func identifier() -> String {
        return "QuestionTableViewCell"
    }
    
    
}
