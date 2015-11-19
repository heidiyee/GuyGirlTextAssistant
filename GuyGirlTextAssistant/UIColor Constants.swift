//
//  UIColor Extensions.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit

enum ColorScheme {
    case Q, A
}


let kQColorSchemeBackgroundGradientCGColorArray = [kQColorSchemeBackgroundGradientTopColor.CGColor, kQColorSchemeBackgroundGradientBottomColor.CGColor]
let kQColorSchemeBackgroundGradientTopColor = UIColor(white: 0.9, alpha: 1.0)
let kQColorSchemeBackgroundGradientBottomColor = UIColor.whiteColor()

let kQColorSchemeLeftSpeechBubbleColor = UIColor(white: 0.85, alpha: 1.0)
let kQColorSchemeLeftHighlightColor = UIColor(white: 0.75, alpha: 1.0)
let kQColorSchemeLeftTextColor = UIColor.blackColor()

let kQColorSchemeRightSpeechBubbleColor = UIColor(white: 0.5, alpha: 1.0)
let kQColorSchemeRightHighlightColor = UIColor(white: 1.5, alpha: 1.0)
let kQColorSchemeRightTextColor = UIColor.whiteColor()


let kAColorSchemeBackgroundGradientCGColorArray = [kAColorSchemeBackgroundGradientTopColor.CGColor, kAColorSchemeBackgroundGradientBottomColor.CGColor]
let kAColorSchemeBackgroundGradientTopColor = UIColor(white: 0.2, alpha: 1.0)
let kAColorSchemeBackgroundGradientBottomColor = UIColor(white: 0.3, alpha: 1.0)

let kAColorSchemeLeftSpeechBubbleColor = UIColor(white: 0.15, alpha: 1.0)
let kAColorSchemeLeftHighlightColor = UIColor(white: 0.25, alpha: 1.0)
let kAColorSchemeLeftTextColor = UIColor.whiteColor()

let kAColorSchemeRightSpeechBubbleColor = UIColor(white: 0.85, alpha: 1.0)
let kAColorSchemeRightHighlightColor = UIColor(white: 0.75, alpha: 1.0)
let kAColorSchemeRightTextColor = UIColor.blackColor()
