//
//  AnswerRetriever.swift
//  ChatbotBrain
//
//  Created by Alberto Vega Gonzalez on 11/17/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class AnswerRetriever {
    
    class func answersforText(keywordMatches: [String]?, answersToChoose: [AnswersWithTag]) -> [String] {
        let cannedAnswers = AnswersWithTag.cannedAnswers
        
        for answer in taggedAnswers {
        
        if let keywordMatches = keywordMatches {
            if keywordMatches.contains(answer.tag) || keywordMatches.contains(answer.tagTwo) {
                let suggestedAnswers = answer.suggestedAnswers
                return suggestedAnswers
            }
        }
  }
        return cannedAnswers
}
}

// Answers will be a singleton with an Array

struct AnswersWithTag {
    var tag: String
    var tagTwo: String
    var suggestedAnswers: [String]
    static let cannedAnswers = ["It's so nice to hear from you", "Thank you!", "Awesome!", "Hey, Hi!", "You too", "That sounds great", "Right back at you", "Sorry, I'm super busy right now"]
}

var greeting = AnswersWithTag(tag: "hi", tagTwo: "hello", suggestedAnswers: ["Hi, Pretty", "Hi There, I was just thinking about you", "Hello, it's so great to hear from you", "Doing great, what about yourself"])
var invitation = AnswersWithTag(tag: "Go", tagTwo: "Out", suggestedAnswers: ["I would love to", "That sounds like a great idea", "Sorry, I have something to do", "I'm not sure"])
var goodbye = AnswersWithTag(tag: "bye", tagTwo: "later", suggestedAnswers: ["Looking forward to hear back from you", "See you soon?", "GoodBye", "Seeya"])

var taggedAnswers = [greeting, invitation, goodbye]


//struct AnswerGreeting {
//    var suggestedAnswers = ["Hi, Pretty", "Hi, There I was thinking about you", "Hello, it's so great to hear from you", "Doing great, what about yourself"]
//    var cannedAnswers = ["Thank you!", "Awesome!", "Hey, Hi!", "You too"]
//    var tag = "hi"
//    var tagTwo = "hello"
//}
//
//struct GoodByeAnswers {
//    var suggestedAnswers = ["Hi, Pretty", "Hi, There I was thinking about you", "Hello, it's so great to hear from you", "Doing great, what about yourself"]
//    var cannedAnswers = ["Thank you!", "Awesome!", "Hey, Hi!", "You too"]
//    var tag = "hi"
//    var tagTwo = "hello"
//}
