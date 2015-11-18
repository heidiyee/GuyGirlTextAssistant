//
//  QuestionsViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit

class QuestionsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var questionTableView: UITableView!
    var questions = [String]() {
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
                for objects in array {
                    if let questionString = objects["questionString"] as? String {
                        self.questions.append(questionString)
                    }
                }
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
