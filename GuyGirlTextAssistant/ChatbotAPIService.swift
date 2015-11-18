//
//  ChatbotAPIService.swift
//  GuyGirlTextAssistant
//
//  Created by Alberto Vega Gonzalez on 11/18/15.
//
//

import Foundation

class ChatbotAPIService {
    class func update(textMessage: String, completion: (Response)-> ()) {
        var textMessageWithoutSpaces = textMessage.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        guard let url = NSURL(string: "http://www.personalityforge.com/api/chat/?apiKey=\(kApiKey)&chatBotID=6526&message=\(textMessageWithoutSpaces)&externalID=0001") else {
            print("Error: cannot create URL")
            return
        }
        
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if let error = error {
                print("error calling GET:\(error)")
            }
            
            if let data = data {
//                print(data)
                if let object = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] {
//                    print(object)
                    if let message = object["message"] as? [String : AnyObject] {
//                        print("The parsed message object is \(message)")
                        if let response = message["message"] as? String {
//                            print("The parsed message is \(response)")
                            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                let parsedResponse = Response(message: response)
                                completion(parsedResponse)
//                                print("response from JSON value coming to main queue: \(parsedResponse)")
                            })
                        }
                    }
                    
                    // This is because NSURLSession comes back on a background q.
                    
                }
            }
            }.resume()
    }
}
