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
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = kAColorSchemeBackgroundGradientCGColorArray
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        self.questionTableView.registerNib(UINib(nibName: LeftSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: LeftSpeechBubbleTableViewCell.identifier())
        
        getParseObjects()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
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

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        SpeechBubbleTableViewCellAnimator.animateCell(cell, withDelayConstant: 0.005, multiplier: indexPath.row)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = questionTableView.dequeueReusableCellWithIdentifier(LeftSpeechBubbleTableViewCell.identifier(), forIndexPath: indexPath) as! LeftSpeechBubbleTableViewCell
        cell.configureWithColorScheme(ColorScheme.A, text: self.questions[indexPath.row]["questionString"] as! String)

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
