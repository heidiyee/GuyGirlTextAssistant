//
//  AnswererViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Work on 11/18/15.
//
//

import UIKit
import Parse

class AnswererViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var question: PFObject?
    
    var answers = [String]() {
        didSet {
            let oldCount = oldValue.count
            let newCount = answers.count
            if oldCount < newCount {
                var newIndexPaths = [NSIndexPath]()
                for i in oldCount...newCount {
                    newIndexPaths.append(NSIndexPath(forRow: i, inSection: 0))
                }
                self.indexPathsToAnimate = newIndexPaths
            } else {
                self.indexPathsToAnimate = [NSIndexPath]()
            }
            self.answersTableView.reloadData()
        }
    }
    
    var indexPathsToAnimate = [NSIndexPath]()
    
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var phraseElementsContainer: UIView!

    class func identifier() -> String {
        return "AnswererViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.answersTableView.dataSource = self
        self.answersTableView.delegate = self
        self.answersTableView.estimatedRowHeight = 44
        self.answersTableView.rowHeight = UITableViewAutomaticDimension
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardWillHideNotification, object: nil)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = kAColorSchemeBackgroundGradientCGColorArray
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        self.answersTableView.registerNib(UINib(nibName: LeftSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: LeftSpeechBubbleTableViewCell.identifier())
        self.answersTableView.registerNib(UINib(nibName: RightSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: RightSpeechBubbleTableViewCell.identifier())
        
        self.phraseElementsContainer.backgroundColor = kAColorSchemeBackgroundGradientBottomColor
        getAnswers()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController!.tabBar.barStyle = UIBarStyle.Black
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAnswers() {
        if let question = self.question {
            if let questionString = question["questionString"] as? String {
                self.answers = [questionString]
            }
            if let array = question["answers"] as? [String] {
                self.answers.appendContentsOf(array)
            }
        }
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition(duration: 2.0)
    }
    
    // MARK: Keyboard handling methods
    
    func keyboardWasShown(notification: NSNotification) {
        let info: [NSObject: AnyObject] = notification.userInfo!
        let tabBarHeight = self.tabBarController!.tabBar.frame.size.height
        let keyboardHeight = info[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size.height

        var newSize = self.view.frame.size
        newSize.height -= keyboardHeight - tabBarHeight
        
        UIView.animateWithDuration(0.4) { () -> Void in
            self.view.frame.size = newSize
            self.view.layoutSubviews()
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        let info: [NSObject: AnyObject] = notification.userInfo!
        let tabBarHeight = self.tabBarController!.tabBar.frame.size.height
        let keyboardHeight = info[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size.height
        
        var newSize = self.view.frame.size
        newSize.height += keyboardHeight - tabBarHeight
        
        UIView.animateWithDuration(0.4) { () -> Void in
            self.view.frame.size = newSize
            self.view.layoutSubviews()
        }
    }
    
    // MARK: Text field actions
    
    @IBAction func textFieldDidEndOnExit(textField: UITextField) {
        guard let question = self.question else {return}
        guard let parseObjectId = question.objectId else {return}
        print(parseObjectId)
        if let phraseText = textField.text {
            ParseService.updateParseObjectAnswer(parseObjectId, answer: phraseText, completion: { (success, error) -> Void in
                if let error = error {
                    print("error here \(error.description)")
                    return
                }
                self.getAnswers()
                
            })
            //self.answers.append(phraseText)
            //self.answersTableView.reloadData()
            //            let matchesInTextMessage = KeyWordFinder.searchForAllPatterns(phraseText)
            //            self.answers = AnswerRetriever.answersforText(matchesInTextMessage)
            //            self.answersTableView.reloadData()
        }
    }
    
    // MARK: Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if self.indexPathsToAnimate.contains(indexPath) {
            SpeechBubbleTableViewCellAnimator.animateCell(cell, withDelayConstant: 0.1, multiplier: indexPath.row)
        }
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = self.answersTableView.dequeueReusableCellWithIdentifier(LeftSpeechBubbleTableViewCell.identifier()) as! LeftSpeechBubbleTableViewCell
            cell.configureWithColorScheme(ColorScheme.A, text: answers[indexPath.row])
            return cell
        }
        let cell = self.answersTableView.dequeueReusableCellWithIdentifier(RightSpeechBubbleTableViewCell.identifier()) as! RightSpeechBubbleTableViewCell
        cell.configureWithColorScheme(ColorScheme.A, text: answers[indexPath.row])
        return cell
    }
}

