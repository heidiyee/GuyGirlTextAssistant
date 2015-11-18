//
//  ViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Heidi Yee on 11/16/15.
//
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {

    var answers = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Donec a diam lectus.", "Sed sit amet ipsum mauris.", "Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit."]// [String]()
    
    let cornerRadius: CGFloat = 18
    
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var phraseElementsContainer: UIView!
    
    class func identifier() -> String {
        return "MainViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.answersTableView.dataSource = self
        self.answersTableView.delegate = self
        self.answersTableView.layer.cornerRadius = 10
        self.answersTableView.estimatedRowHeight = 44
        self.answersTableView.rowHeight = UITableViewAutomaticDimension
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(white: 0.9, alpha: 1.0).CGColor, UIColor.whiteColor().CGColor]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
//        self.phraseElementsContainer.backgroundColor = UIColor.clearColor()
        
//        let lightBlurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
//        lightBlurView.frame = self.phraseElementsContainer.bounds
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

    @IBAction func textFieldEditingChanged(textField: UITextField) {
//        if let phraseText = textField.text, phraseLabel = self.phraseLabel {
//            phraseLabel.text = "“\(phraseText)”"
//        }
    }
    
    @IBAction func textFieldDidEndOnExit(textField: UITextField) {
        if let phraseText = textField.text {
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
        cell.backgroundColor = UIColor.clearColor()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = self.answersTableView.dequeueReusableCellWithIdentifier(LeftSpeechBubbleTableViewCell.identifier()) as! LeftSpeechBubbleTableViewCell
            cell.configureWithColor(UIColor.whiteColor(), text: answers[indexPath.row], cornerRadius: self.cornerRadius)
            return cell
        }
        let cell = self.answersTableView.dequeueReusableCellWithIdentifier(RightSpeechBubbleTableViewCell.identifier()) as! RightSpeechBubbleTableViewCell
        cell.configureWithColor(UIColor.darkGrayColor(), text: answers[indexPath.row], cornerRadius: self.cornerRadius)
        return cell
    }
    
    
    
}

