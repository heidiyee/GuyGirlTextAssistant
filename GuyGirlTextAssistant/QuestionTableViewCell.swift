//
//  QuestionCell.swift
//  ParseStarterProject-Swift
//
//  Created by Heidi Yee on 11/18/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    var question: String? {
        didSet {
            questionLabel.text = question
        }
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    
    class func identifier() -> String {
        return "QuestionTableViewCell"
    }
    
    
}
