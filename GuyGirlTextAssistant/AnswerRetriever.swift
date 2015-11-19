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

// Roman is working on this part: he will make more answers and make it modular so it can have it's own file. And also add the tags to the Patterns file so we can actually find the matches.

struct AnswersWithTag {
    var tag: String
    var tagTwo: String
    var suggestedAnswers: [String]
    static let cannedAnswers = ["It's so nice to hear from you", "Thank you!", "Awesome!", "Hey, Hi!", "You too", "That sounds great", "Right back at you", "Sorry, I'm super busy right now"]
}

var greeting = AnswersWithTag(tag: "hi", tagTwo: "hello", suggestedAnswers: ["Hi, Pretty", "Hi There, I was just thinking about you", "Hello, it's so great to hear from you", "Doing great, what about yourself"])
var invitation = AnswersWithTag(tag: "Go", tagTwo: "Out", suggestedAnswers: ["I would love to", "That sounds like a great idea", "Sorry, I have something to do", "I'm not sure"])
var goodbye = AnswersWithTag(tag: "bye", tagTwo: "later", suggestedAnswers: ["Looking forward to hear back from you", "See you soon?", "GoodBye", "Seeya"])


//var fightingWithGirl = AnswersWithTag(tag: "hate", tagTwo: "jerk", tagThree: "stupid", tagFour: "you're", tagFive: "ur", tagSix: "your", suggestedAnswers: ["Why are you mad at me?", "I'm not a jerk, jerk.", "Stop being a baby", "Awwww, please don't be mad at me 😔"])
//var girlAtClub = AnswersWithTag(tag: "girl", tagTwo: "club", tagThree: "who", suggestedAnswers: ["What girl?", "She's an old girlfriend. She's super hot right?", "oh no one, "A crazy ex of mine", "My friend's girlfriend"])
//var gettingSerious = AnswersWithTag(tag: "do", tagTwo: "you", tagThree: "marriage", tagFour: "marry", tagFive: "me", suggestedAnswers: ["I can see that happening one day", "I'm not sure...", "That's a weird question to ask over text... 😳"])
//var whatsYourGirlType= AnswersWithTag(tag: "what", tagTwo: "girl", tagThree: "type", tagFour: "you", suggestedAnswers: ["A lady in the streets, freak in the sheets", "I'm not sure...let me think about that", "Anything that has a pulse", "Cute girls like you 😉", "Girls who look like Taylor Swift"])
//var whatsYourGuyType= AnswersWithTag(tag: "what", tagTwo: "guy", tagThree: "type", tagFour: "you", suggestedAnswers: ["Meatheads", "Someone who likes girls for their brains rather than their body.", "Someone who is down to earth and can make me laugh", "I'm just looking for a sugar daddy", "Anyone who looks like David Beckham"])
//var thinkIsPretty= AnswersWithTag(tag: "do", tagTwo: "you", tagThree: "think", tagFour: "pretty", suggestedAnswers: ["You're pretty", "Of course I think you're pretty", "You aight 😜"])
//var thinkImUgly= AnswersWithTag(tag: "do", tagTwo: "you", tagThree: "think", tagFour: "ugly", suggestedAnswers: ["You're pretty", "Of course I think you're pretty", "You aight 😜"])






var taggedAnswers = [greeting, invitation, goodbye]



class GreetingMessages {
	
	class func greetingMessages () {
		
		struct Tags {
			let tag: String
			let tagTwo: String
			let tagthree: String
			let tagFour: String
			let tagFive: String?
			let tagSix: String?
			let tagSeven: String?
			let tagEight: String?
			let tagNine: String?
			let tagTen: String?
			let suggestedAnswer: [String]
			static let cannedAnswers = []
		}
		
		let greetingTag = Tags(tag: "hi", tagTwo: "hello", tagthree: "hey", tagFour: "what's up", tagFive: "hola",
			tagSix: "can we talk", tagSeven: "yo",tagEight: "morning", tagNine: "goodmorning", tagTen: "sup",
			
			suggestedAnswer: ["Hey, So glad to hear from you", "I was just thinking about you", "Sorry, I'm super busy right now","hello,hi,", "Hi there!", "I cant talk right now", "Let me call you"])
		
		let byeTag = Tags(tag: "bye", tagTwo: "ttyl", tagthree: "goodnight", tagFour: "later", tagFive: "goodbye",
			tagSix: "dont text me again", tagSeven: "seeya", tagEight: "nice meeting you", tagNine: "Im going to bed", tagTen: "",
			
			suggestedAnswer: ["GoodBye", "It was a pleassure talking with you", "I had fun today", "goodnight", "Sweet Dreams", "lets hang out again/lets hang out soon?"])
		
		let questionTags = Tags(tag: "what", tagTwo: "who", tagthree: "where", tagFour: "when", tagFive: "wat", tagSix: "will you", tagSeven: "can you", tagEight: "may I", tagNine: "would you", tagTen: "", suggestedAnswer: ["Why don't you tell me first", "that sounds interesting, tell me more about it", "I will love to do that", "why dont we try this _ "])

		let suggestionTags = Tags(tag: "", tagTwo: <#T##String#>, tagthree: <#T##String#>, tagFour: <#T##String#>, tagFive: <#T##String?#>, tagSix: <#T##String?#>, tagSeven: <#T##String?#>, tagEight: <#T##String?#>, tagNine: <#T##String?#>, tagTen: <#T##String?#>, suggestedAnswer: <#T##[String]#>)
		
		
		
		
		
	}
	
}





