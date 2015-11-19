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

    var question: PFObject!
    
    var answers = [String]() {
        didSet {
            self.answersTableView.reloadData()
        }
    }
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAnswers() {
        if let array = question["answers"] as? [String] {
            self.answers = array
        }
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition(duration: 2.0)
    }
    
    // MARK: Keyboard handling methods
    
    func keyboardWasShown(notification: NSNotification) {
        let info: [NSObject: AnyObject] = notification.userInfo!
//        let tabBarHeight = self.tabBarController!.tabBar.frame.size.height
        let keyboardHeight = info[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size.height

        var newFrame = self.view.frame.size
        newFrame.height -= keyboardHeight
        self.view.frame.size = newFrame
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        let info: [NSObject: AnyObject] = notification.userInfo!
//        let tabBarHeight = self.tabBarController!.tabBar.frame.size.height
        let keyboardHeight = info[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size.height
        
        var newFrame = self.view.frame.size
        newFrame.height += keyboardHeight
        self.view.frame.size = newFrame
    }
    
    // MARK: Text field actions
    
    @IBAction func textFieldDidEndOnExit(textField: UITextField) {
        guard let parseObjectId =  question.objectId else {return}
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
        return answers.count + 1
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        SpeechBubbleTableViewCellAnimator.animate(cell)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = self.answersTableView.dequeueReusableCellWithIdentifier(LeftSpeechBubbleTableViewCell.identifier()) as! LeftSpeechBubbleTableViewCell
            cell.configureWithColorScheme(ColorScheme.A, text: question["questionString"] as! String)
            return cell
        }
        let cell = self.answersTableView.dequeueReusableCellWithIdentifier(RightSpeechBubbleTableViewCell.identifier()) as! RightSpeechBubbleTableViewCell
        cell.configureWithColorScheme(ColorScheme.A, text: answers[indexPath.row - 1])
        return cell
    }
}

