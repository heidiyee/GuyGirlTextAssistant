//
//  StatusTextTableViewCell.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit

class StatusTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    class func identifier() -> String {
        return "StatusTableViewCell"
    }
}
