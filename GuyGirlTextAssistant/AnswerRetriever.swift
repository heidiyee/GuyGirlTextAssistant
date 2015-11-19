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
        
        for answer in StoredAnswers.taggedAnswers {
        
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





