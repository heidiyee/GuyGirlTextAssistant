//
//  KeyWordFinder.swift
//  ChatbotBrain
//
//  Created by Alberto Vega Gonzalez on 11/17/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class KeyWordFinder {
    
    static let shared = KeyWordFinder()

    //MARK: ListMatches Looks for a single patern and returns the pattern back if matches.

    class func listMatches(pattern: String, inString string: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
            let range = NSMakeRange(0, string.characters.count)
            let matches = regex.matchesInString(string, options: .ReportCompletion, range: range) as [NSTextCheckingResult]
            if matches.count > 0 {
                return pattern
            }
            
        } catch  let error as NSError {
            print(error.localizedDescription)
            return nil
        }
        return nil
    }
    
    // MARK: Search for each pattern contained in an array of patterns
    
    class func listAllMatches(arrayOfStringPatterns : [String], originalString: String) -> [String]?{
        var result = [String]()
        for subString in arrayOfStringPatterns{
            if let match = listMatches(subString, inString: originalString.lowercaseString){
                result.append(match)
            }
        }
        
        if result.count > 0 {
            return result
        }
        return nil
    }
    
    class func searchForAllPatterns(inString:String) -> [String]? {
        var result = [String]()
        let prefixMatches = [String]()
        let subjectMatches = [String]()
        let activityMatches = [String]()
        let greetingMatches = [String]()
        if let prefixMatches = listAllMatches(prefixes, originalString: inString) {
            result += prefixMatches
            print(result)
        }
        if let subjectMatches = listAllMatches(subjects, originalString: inString) {
            result += subjectMatches
        }
        if let activityMatches = listAllMatches(activities, originalString: inString) {
            result += activityMatches
        }
        
        if let greetingMatches = listAllMatches(greetings, originalString: inString) {
            result += greetingMatches
        }
        return result
    }
}