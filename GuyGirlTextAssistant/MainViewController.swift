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
            self.answersTableView.reloadData()
        }
    }
    
    //var question: String?
    
    var chatbotAnswer:Response? 
    
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
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = kQuestionBackgroundGradientCGColorArray
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        self.answersTableView.registerNib(UINib(nibName: LeftSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: LeftSpeechBubbleTableViewCell.identifier())
        self.answersTableView.registerNib(UINib(nibName: RightSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: RightSpeechBubbleTableViewCell.identifier())
        self.answersTableView.registerNib(UINib(nibName: StatusTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: StatusTableViewCell.identifier())

        self.phraseElementsContainer.backgroundColor = UIColor.clearColor()

//        let lightBlurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
//        lightBlurView.frame = self.phraseElementsContainer.bounds
//        self.phraseElementsContainer.backgroundColor = UIColor.clearColor()
//        self.phraseElementsContainer.insertSubview(lightBlurView, atIndex: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    // MARK: Text field actions
    
    @IBAction func textFieldEditingDidBegin(sender: UITextField) {
        self.fadeOutInstructionMessage()
    }
    
    @IBAction func textFieldDidEndOnExit(textField: UITextField) {
        if let phraseText = textField.text {
            self.answers.removeAll()
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
        
        //This function needs to get the text message from user as parameter
        ChatbotAPIService.update(self.answers[0]) { (response) -> () in
            self.chatbotAnswer = response
            if let chatbotAnswer = self.chatbotAnswer?.message {
                self.answers.append((chatbotAnswer))
                print("The chat bot message is:\(self.chatbotAnswer!.message)")
            }
        }
//            let matchesInTextMessage = KeyWordFinder.searchForAllPatterns(phraseText)
//            self.answers = AnswerRetriever.answersforText(matchesInTextMessage)
//            self.answersTableView.reloadData()
        
    }
    
    // MARK: Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        SpeechBubbleTableViewCellAnimator.animate(cell)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = self.answersTableView.dequeueReusableCellWithIdentifier(LeftSpeechBubbleTableViewCell.identifier()) as! LeftSpeechBubbleTableViewCell
            cell.configureWithColor(kQuestionLeftSpeechBubbleColor, textColor: kQuestionLeftTextColor, text: answers[indexPath.row], cornerRadius: kSpeechBubbleCornerRadius)
            return cell
        }
        let cell = self.answersTableView.dequeueReusableCellWithIdentifier(RightSpeechBubbleTableViewCell.identifier()) as! RightSpeechBubbleTableViewCell
        cell.configureWithColor(kQuestionRightSpeechBubbleColor, textColor: kQuestionRightTextColor, text: answers[indexPath.row], cornerRadius: kSpeechBubbleCornerRadius)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIPasteboard.generalPasteboard().string = answers[indexPath.row]
    }
}

