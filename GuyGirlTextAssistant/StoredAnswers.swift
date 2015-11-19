//
//  StoredAnswers.swift
//  GuyGirlTextAssistant
//
//  Created by Roman Salazar Lopez on 11/19/15.
//
//

import Foundation



class StoredAnswers {

	static var taggedAnswers = [greeting, invitation, goodbye, actions, fightingWithGirl, girlAtClub, gettingSerious, whatsYourGirlType, whatsYourGuyType, thinkIsPretty, thinkImUgly, dontBeMad, datingOrMore, loveMe, loveYou, likeMovies, sports, compliment, complimentTwo, complimentThree, dinner, invite, inviteTwo, inviteThree, inviteFour, bustedOne, bustedTwo, getCoffee, getDrinks, movingIn]

}

struct AnswersWithTag {
	var tag: String
	var tagTwo: String
	var suggestedAnswers: [String]
	static let cannedAnswers = ["It's so nice to hear from you", "Thank you!", "Awesome!", "Hey, Hi!", "You too", "That sounds great", "Right back at you", "Sorry, I'm super busy right now"]
	
	
}

var greeting = AnswersWithTag(tag: "hi", tagTwo: "hello",
	suggestedAnswers: ["Hi Pretty", "Hi There, I was just thinking about you", "Hello, it's so great to hear from you", "Doing great, what about yourself"])
var invitation = AnswersWithTag(tag: "go", tagTwo: "out",
	suggestedAnswers: ["I would love to", "That sounds like a great idea", "Sorry, I have something to do", "I'm not sure"])
var goodbye = AnswersWithTag(tag: "bye", tagTwo: "later",
	suggestedAnswers: ["Looking forward to hear back from you", "See you soon?", "GoodBye", "Seeya"])
var actions = AnswersWithTag(tag: "run", tagTwo: "hike",
	suggestedAnswers: ["Lets do it today", "I hope you are ready to loose"])

var sports = AnswersWithTag(tag: "football", tagTwo: "soccer",
	
	suggestedAnswers: ["I love football", "I love soccer", "I hate football", "I hate soccer", "Whats your favorite team?", "what is your favorite sport?", "you should do more exercise once in a while"])

var fightingWithGirl = AnswersWithTag(tag: "hate", tagTwo: "jerk",
	
	suggestedAnswers: ["Why are you mad at me?", "I'm not a jerk, jerk.", "Stop being a baby", "Awwww, please don't be mad at me :pensive:"])

var girlAtClub = AnswersWithTag(tag: "bar", tagTwo: "club",
	
	suggestedAnswers: ["What girl?", "She's an old girlfriend. She's super hot right?", "oh no one", "A crazy ex of mine", "My friend's girlfriend"])

var gettingSerious = AnswersWithTag(tag: "marriage", tagTwo: "love",
	
	suggestedAnswers: ["I can see that happening one day", "I'm not sure...", "That's a weird question to ask over text... :flushed:", "I don't see my self getting married"])

var whatsYourGirlType = AnswersWithTag(tag: "girl", tagTwo: "type",
	
	suggestedAnswers: ["A lady in the streets, freak in the sheets", "I'm not sure...let me think about that", "Anything that has a pulse", "Cute girls like you :wink:", "Girls who look like Taylor Swift"])

var whatsYourGuyType = AnswersWithTag(tag: "guy", tagTwo: "type",
	
	suggestedAnswers: ["Meatheads", "Someone who likes girls for their brains rather than their body.", "Someone who is down to earth and can make me laugh", "I'm just looking for a sugar daddy", "Anyone who looks like David Beckham"])

var thinkIsPretty = AnswersWithTag(tag: "I'm", tagTwo: "pretty",
	
	suggestedAnswers: ["You're pretty", "Of course I think you're pretty", "You aight :stuck_out_tongue_winking_eye:"])

var thinkImUgly = AnswersWithTag(tag: "I'm", tagTwo: "ugly",
	
	suggestedAnswers: ["You're pretty", "Of course I think you're pretty", "You aight :stuck_out_tongue_winking_eye:"])

var dontBeMad = AnswersWithTag(tag: "I'm", tagTwo: "mad",
	
	suggestedAnswers: ["Don't be mad", "I understand...", "Don't be so sensitive", "I don't have time for this"])

var datingOrMore = AnswersWithTag(tag: "we", tagTwo: "exclusive",
	
	suggestedAnswers: ["I'm not seeing anyone else", "Is that what you want?", "I'm dating around still", "idk"])

var loveMe = AnswersWithTag(tag: "do you", tagTwo: "love",
	
	suggestedAnswers: ["Yes, I do", "I think we should talk in person about love", "maybe?", "idk"])

var loveYou = AnswersWithTag(tag: "i", tagTwo: "love you",
	
	suggestedAnswers: ["that's nice", "I love you too", "oh....", "cool", "I'm not sure I want to say that for the first time over text message"])

var likeMovies = AnswersWithTag(tag: "like", tagTwo: "movies",
	
	suggestedAnswers: ["Yes", "I see movies once in awhile", "Yes! What's your favorite movie?", "Nope"])

var compliment = AnswersWithTag(tag: "handsome", tagTwo: "pretty",
	
	suggestedAnswers: ["You are a beautiful woman :heart_eyes:", "Do you think?", "I'm not sure about that", "That is so nice from you"])

var complimentTwo = AnswersWithTag(tag: "good looking", tagTwo: "attractive",
	
	suggestedAnswers: ["You are really attractive:kissing_heart:", "Not as much as you are beautiful :blush:", "That is so sweet"])

var complimentThree = AnswersWithTag(tag: "like you", tagTwo: "awesome",
	
	suggestedAnswers: ["That's so sweet, You are such an amazing woman ", "You are my dreamgirl :kissing_heart:"])

var commitment = AnswersWithTag(tag: "love", tagTwo: "me",
	
	suggestedAnswers: ["I really do:rose:", "I love  you with all my heart :gift_heart:","I'm not confortable talking about that right now, it's too soon", "Does that really matter?", "I think we should see each other a little more."])

var dinner = AnswersWithTag(tag: "dinner", tagTwo: "restaurant",
	
	suggestedAnswers: ["You and me? I would go anywhere with you :rose:", "Dinner? I am really hungry right now", "I'm sorry, I'm afraid I'm too busy right now", "I can cook dinner for you, If you wan't to come over insted"])

var invite = AnswersWithTag(tag: "go", tagTwo: "out",
	
	suggestedAnswers: ["I would love to :two_hearts:", "Are you kidding me, I am dying to go out for you" ])

var inviteTwo = AnswersWithTag(tag: "come", tagTwo: "over",
	
	suggestedAnswers: ["I'll be there ASAP :smiley:", "I would love to, Should I bring anything?", "I "])

var inviteThree = AnswersWithTag(tag: "party", tagTwo: "drink",
	
	suggestedAnswers: ["I love parties", "That sounds fun", "I really enjoy your company so sure :wink:", "You bet, Would you like me to pick you up?"])

var inviteFour = AnswersWithTag(tag: "go", tagTwo: "dancing",
	
	suggestedAnswers: ["Dancing? I love dancing", "I will love it but I'm a terrible dancer :pensive: would you teach me some moves before then? :blush: Please?", "I would love going out with you, you are so fun"])

var cannedAnswers = ["I'm not sure", "Is that really important", "Hello, Sorry I'm busy right now"]

var bustedOne = AnswersWithTag(tag: "what", tagTwo: "girl",
	
	suggestedAnswers: ["Which girl? Do you mean my cousin Tracy?"])

var bustedTwo = AnswersWithTag(tag: "what", tagTwo: "girl",
	
	suggestedAnswers: ["Does that question really matter to you?", "I don't know what you are talking about", "really?", "I wish you could trust me more"])

var getCoffee = AnswersWithTag(tag: "you want", tagTwo: "coffee",
	
	suggestedAnswers: ["Yeah, that'd be great", "I don't drink coffee...", "Sure, where's do you like to go get coffee? :coffee:", "Yeah, I can meet you somewhere"])

var getDrinks = AnswersWithTag(tag: "you want", tagTwo: "drink\\s",
	
	suggestedAnswers: ["Yeah, that'd be great", "Yeah, where's your favorite place to go?", "No thank you.", ":cocktail::wine_glass::beer::tropical_drink::beers:"])

var movingIn = AnswersWithTag(tag: "move in", tagTwo: "with me",
	
	suggestedAnswers: ["We can talk about that in person", "Maybe one day", "I don't think so", "If one day we got more serious, I would ask you to move in with me."])



