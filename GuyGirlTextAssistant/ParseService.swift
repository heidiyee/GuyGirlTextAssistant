//
//  ParseService.swift
//  ParseStarterProject-Swift
//
//  Created by Heidi Yee on 11/18/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class ParseService {
    
    class func uploadObjectToQuestionClass(question: String, completion: (success: Bool, error: NSError?) -> Void ){
        
            let object = PFObject(className: kClassName )
            object["questionString"] = question
            object["hasAnswer"] = false
            object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("Object has been saved.")
                completion(success: success, error: error)
            
        }
    }
    
    class func getParseData(className: String, completion: (array: [PFObject]?, error: NSError?) -> Void) {
        
        let parseQuery = PFQuery(className: className)
        parseQuery.findObjectsInBackgroundWithBlock { (parseObjects, error) -> Void in
            if let parseObjects = parseObjects {
                completion(array: parseObjects,error: nil)
            }
        }
        
    }
    
    class func updateParseObjectAnswer(objectId: String, answer: String, completion: (success: Bool, error: NSError?) -> Void) {
        let query = PFQuery(className: kClassName)
        query.getObjectInBackgroundWithId(objectId) { (object: PFObject?, error: NSError?) -> Void in
            if let error = error {
                print(error.description)
                completion(success: false, error: error)
            } else if let object = object {
                object["answerString"] = answer
                object["hasAsnwer"] = true
                object.incrementKey("answerCount", byAmount: 1)
                object.saveInBackground()
            }
        }
    }
}