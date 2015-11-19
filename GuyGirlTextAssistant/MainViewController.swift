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

    var answers = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Donec a diam lectus.", "Sed sit amet ipsum mauris.", "Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.", "Donec a diam lectus.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Donec a diam lectus.", "Sed sit amet ipsum mauris.", "Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.", "Donec a diam lectus."]// [String]()
    
    var chatbotAnswer:Response? {
        didSet {
            self.answersTableView.reloadData()
        }
    }
    
    //var question: String?
    
    var chatbotAnswer:Response? 
    
    let cornerRadius: CGFloat = 18
    
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var phraseElementsContainer: UIView!
    
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
        gradientLayer.colors = kQuestionBackgroundCGColorGradientArray
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        self.answersTableView.registerNib(UINib(nibName: LeftSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: LeftSpeechBubbleTableViewCell.identifier())
        self.answersTableView.registerNib(UINib(nibName: RightSpeechBubbleTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: RightSpeechBubbleTableViewCell.identifier())
        self.answersTableView.registerNib(UINib(nibName: StatusTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: StatusTableViewCell.identifier())

        
//        self.phraseElementsContainer.backgroundColor = UIColor.clearColor()
        
        self.phraseElementsContainer.backgroundColor = UIColor.clearColor()

//        let lightBlurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
//        lightBlurView.frame = self.phraseElementsContainer.bounds
//        self.phraseElementsContainer.backgroundColor = UIColor.clearColor()
//        self.phraseElementsContainer.insertSubview(lightBlurView, atIndex: 0)
        // OR
//        self.phraseElementsContainer.backgroundColor = UIColor.whiteColor()
        
        
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
    
    // MARK: Text field actions
    
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
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = self.answersTableView.dequeueReusableCellWithIdentifier(LeftSpeechBubbleTableViewCell.identifier()) as! LeftSpeechBubbleTableViewCell
            cell.configureWithColor(UIColor(white: 0.85, alpha: 1), text: answers[indexPath.row], cornerRadius: kSpeechBubbleCornerRadius)
            return cell
        }
        if indexPath.row % 2 == 0 {
            let cell = self.answersTableView.dequeueReusableCellWithIdentifier(StatusTableViewCell.identifier()) as! StatusTableViewCell
                cell.statusLabel.text = "Status Text FTW!"
            return cell
        }
        let cell = self.answersTableView.dequeueReusableCellWithIdentifier(RightSpeechBubbleTableViewCell.identifier()) as! RightSpeechBubbleTableViewCell
        cell.configureWithColor(UIColor(white: 0.5, alpha: 1), text: answers[indexPath.row], cornerRadius: kSpeechBubbleCornerRadius)
        return cell
    }
}

