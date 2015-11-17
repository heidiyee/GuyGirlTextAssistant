//
//  ViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Heidi Yee on 11/16/15.
//
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {

    var answers = ["Ayylmao", "Lorem ipsum dolor sit amet", "Sed sit amet", "Ipsum mauris"]
    
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
        
        let gradientLayer = CAGradientLayer()
        let lightPinkColor = UIColor(red: 1, green: 182/255, blue: 193/255, alpha: 1)
        gradientLayer.colors = [lightPinkColor.CGColor, UIColor.whiteColor().CGColor]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        let lightBlurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        lightBlurView.frame = self.phraseElementsContainer.bounds
        self.phraseElementsContainer.insertSubview(lightBlurView, atIndex: 0)
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
        if let phraseText = textField.text, phraseLabel = self.phraseLabel {
            phraseLabel.text = "“\(phraseText)”"
        }
    }
    
    @IBAction func textFieldDidEndOnExit(textField: UITextField) {
        self.phraseTextField.text = nil
//        self.phraseTextField.hidden = true
    }
    
    // MARK: Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.answersTableView.dequeueReusableCellWithIdentifier(AnswerTableViewCell.identifier()) as! AnswerTableViewCell
        cell.answerTextLabel.text = answers[indexPath.row]
        cell.textParentView.layer.cornerRadius = 16.0
//        cell.textParentView.backgroundColor = UIColor.whiteColor()
        return cell
    }
}

