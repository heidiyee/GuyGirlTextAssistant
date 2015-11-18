//
//  QuestionsViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit
import Parse

class QuestionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        self.questionTableView.delegate = self
        
        self.questionTableView.registerNib(UINib(nibName: LeftSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: LeftSpeechBubbleTableViewCell.identifier())
        
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
    
    // MARK: Table view data source

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = questionTableView.dequeueReusableCellWithIdentifier(LeftSpeechBubbleTableViewCell.identifier(), forIndexPath: indexPath) as! LeftSpeechBubbleTableViewCell
        cell.configureWithColor(UIColor.blueColor(), text: self.questions[indexPath.row]["questionString"] as! String, cornerRadius: kSpeechBubbleCornerRadius)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    // MARK: Table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(AnswererViewController.identifier(), sender: self)
    }
    
    // MARK: Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == AnswererViewController.identifier() {
            let answererViewController = segue.destinationViewController as! AnswererViewController
            answererViewController.question = self.questions[self.questionTableView.indexPathForSelectedRow!.row]
        }
    }
}
