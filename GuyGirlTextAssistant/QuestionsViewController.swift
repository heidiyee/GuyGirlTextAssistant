//
//  QuestionsViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit
import Parse

class QuestionsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var questionTableView: UITableView!
    var questions = [PFObject]() {
        didSet {
            self.questionTableView.reloadData()
        }
    }
    
    class func identifier() -> String {
        return "QuestionsViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionTableView.dataSource = self
        getParseObjects()
    }
    
    func getParseObjects() {
        ParseService.getParseData(kClassName) { (array, error) -> Void in
            if let error = error {
                print(error.description)
                return
            }
            if let array = array {
                self.questions = array
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = questionTableView.dequeueReusableCellWithIdentifier(QuestionTableViewCell.identifier(), forIndexPath: indexPath) as! QuestionTableViewCell
        cell.question = self.questions[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
}
