//
//  PersonCollectionViewCell.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/16/15.
//
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameTextLabel: UILabel!
    
    class func identifier() -> String {
        return "PersonCollectionViewCell"
    }
    
}
