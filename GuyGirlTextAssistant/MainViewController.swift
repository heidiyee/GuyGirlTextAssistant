//
//  ViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Heidi Yee on 11/16/15.
//
//

import UIKit
import Parse

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {

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
    
    //var question: String?
    var pfobjectId: String?
    var chatbotAnswer:Response?
    
    var userAnswers = 0
    
    //var viewHasLoadedbefore = 0
    var userAnswersAfterIndex: Int = 0
    
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var phraseElementsContainer: UIView!
    @IBOutlet weak var instructionMessageLabel: UILabel!
    
    class func identifier() -> String {
        return "MainViewController"
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
        gradientLayer.colors = kQColorSchemeBackgroundGradientCGColorArray
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        self.answersTableView.registerNib(UINib(nibName: LeftSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: LeftSpeechBubbleTableViewCell.identifier())
        self.answersTableView.registerNib(UINib(nibName: RightSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: RightSpeechBubbleTableViewCell.identifier())
        self.answersTableView.registerNib(UINib(nibName: StatusTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: StatusTableViewCell.identifier())

        self.phraseElementsContainer.backgroundColor = UIColor.clearColor()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController!.tabBar.barStyle = UIBarStyle.Default
        self.showUserAnswers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SettingsViewController" {
            guard let settingVC = segue.destinationViewController as? SettingsViewController else {return}
            settingVC.transitioningDelegate = self
            settingVC.completion = ({success in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition(duration: 2.0)
    }
    
    func fadeOutInstructionMessage() {
        UIView.animateWithDuration(1.0) { () -> Void in
            self.instructionMessageLabel.alpha = 0
        }
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
    
    @IBAction func textFieldEditingDidBegin(sender: UITextField) {
        self.fadeOutInstructionMessage()
    }
    
    @IBAction func textFieldDidEndOnExit(textField: UITextField) {
        if let phraseText = textField.text {
            self.answers.removeAll()
            //self.viewHasLoadedbefore = 0
            self.userAnswers = 0
            ParseService.uploadObjectToQuestionClass(phraseText, completion: { (success, error) -> Void in
                if let error = error {
                    print(error.description)
                }
                    self.answers.append(phraseText)
                    self.getAnswer()
            })
        }
    }
    
    func getAnswer() {
		var newArray = [String]()

        //This function needs to get the text message from user as parameter
		guard let text = phraseTextField.text else { return }
		ChatbotAPIService.update(text) { (response) -> () in
            self.chatbotAnswer = response
			
            if let chatbotAnswer = self.chatbotAnswer?.message {
                newArray.append((chatbotAnswer))
                print("The chat bot message is:\(self.chatbotAnswer!.message)")
            }
			let matchesInTextMessage = KeyWordFinder.searchForAllPatterns(text)
			newArray += AnswerRetriever.answersforText(matchesInTextMessage, answersToChoose: StoredAnswers.taggedAnswers)
			self.answers += newArray
            self.saveRobotAnswers(newArray)
            self.showUserAnswers()
            self.userAnswersAfterIndex = self.answers.count - 1
        }
		
		//self.answersTableView.reloadData()
    }
    
    func saveRobotAnswers(stringArray: [String]) {
        ParseService.getParseData(kClassName) { (array, error) -> Void in
            if let array = array {
                let object = array[0]
                if let id = object.objectId {
                    ParseService.updateParseObjectRobotAnswer(id, answer: stringArray, completion: { (success, error) -> Void in
                        if let error = error {
                            print(error.description)
                            return
                        }
                    })
//                    let userAnswersCount = object["answerCount"] as! Int
//                    print(userAnswersCount)
//                    if userAnswersCount > 0 {
//                        let userAnswerArray = object["answers"] as! [String]
//                        self.answers += userAnswerArray
//                    }
                }

            }
        }
    }
    
    func showUserAnswers() {
        ParseService.getParseData(kClassName) { (array, error) -> Void in
            if let array = array {
                let object = array[0]
                if let userAnswersCount = object["answerCount"] as? Int {
                    print("useranswercount\(userAnswersCount)")
                    if userAnswersCount > self.userAnswers {
                        self.userAnswers = userAnswersCount
                        if let userAnswerArray = object["answers"] as? [String] {
                            self.answers += userAnswerArray
                        }
                    }
                }
            }
        }
    }
    

    
    // MARK: Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = self.answersTableView.dequeueReusableCellWithIdentifier(LeftSpeechBubbleTableViewCell.identifier()) as! LeftSpeechBubbleTableViewCell
            cell.configureWithColorScheme(ColorScheme.Q, text: self.answers[indexPath.row])
            return cell
        }
        if indexPath.row > self.userAnswersAfterIndex {
            let cell = self.answersTableView.dequeueReusableCellWithIdentifier(RightSpeechBubbleTableViewCell.identifier()) as! RightSpeechBubbleTableViewCell
            cell.configureWithColor(UIColor(white: 0.4, alpha: 1.0), textColor: kQColorSchemeRightTextColor, text: self.answers[indexPath.row], cornerRadius: kSpeechBubbleCornerRadius)
            return cell
        }
        
        let cell = self.answersTableView.dequeueReusableCellWithIdentifier(RightSpeechBubbleTableViewCell.identifier()) as! RightSpeechBubbleTableViewCell
        cell.configureWithColorScheme(ColorScheme.Q, text: self.answers[indexPath.row])
        return cell
    }
    
    // MARK: Table view delegate

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if self.indexPathsToAnimate.contains(indexPath) {
            SpeechBubbleTableViewCellAnimator.animateCell(cell, withDelayConstant: 0.1, multiplier: indexPath.row)
        }
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIPasteboard.generalPasteboard().string = answers[indexPath.row]
    }
    
}

