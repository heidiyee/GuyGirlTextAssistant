//
//  AnswerRetriever.swift
//  ChatbotBrain
//
//  Created by Alberto Vega Gonzalez on 11/17/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class AnswerRetriever {
    
    class func answersforText(keywordMatches: [String]?) -> [String] {
        let cannedAnswers = ["Thank you!", "Awesome!", "Hey, Hi!", "You too"]
        
        if let keywordMatches = keywordMatches {
            if keywordMatches.contains("hi") || keywordMatches.contains("hello") {
                let suggestedAnswers = ["Hi, Pretty", "Hi, There I was thinking about you", "Hello, it's so great to hear from you", "Doing great, what about yourself"]
                return suggestedAnswers
            }
        }
        return cannedAnswers
    }
}
// Answers will be a singleton with an Array 

struct AnswerGreeting {
    var suggestedAnswers = ["Hi, Pretty", "Hi, There I was thinking about you", "Hello, it's so great to hear from you", "Doing great, what about yourself"]
    var cannedAnswers = ["Thank you!", "Awesome!", "Hey, Hi!", "You too"]
    var tag = "hi"
    var tagTwo = "hello"
}

struct GoodByeAnswers {
    var suggestedAnswers = ["Hi, Pretty", "Hi, There I was thinking about you", "Hello, it's so great to hear from you", "Doing great, what about yourself"]
    var cannedAnswers = ["Thank you!", "Awesome!", "Hey, Hi!", "You too"]
    var tag = "hi"
    var tagTwo = "hello"
}
