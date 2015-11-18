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