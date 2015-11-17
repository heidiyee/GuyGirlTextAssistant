//
//  ViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Heidi Yee on 11/16/15.
//
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {

    var persons = ["Jane", "Sally", "Bob", "Suzie", "Sandra"]
    var answers = ["Ayylmao", "Lorem ipsum dolor sit amet", "Sed sit amet", "Ipsum mauris"]
    
    @IBOutlet weak var personsCollectionView: UICollectionView!
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var phraseElementsContainer: UIView!
    
    class func identifier() -> String {
        return "MainViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.personsCollectionView.dataSource = self
        self.personsCollectionView.delegate = self
        self.personsCollectionView.backgroundColor = UIColor.clearColor()
        
        self.answersTableView.dataSource = self
        self.answersTableView.delegate = self
        self.answersTableView.layer.cornerRadius = 10
        
        let gradientLayer = CAGradientLayer()
        let lightPinkColor = UIColor(red: 1, green: 182/255, blue: 193/255, alpha: 1)
        gradientLayer.colors = [lightPinkColor.CGColor, UIColor.whiteColor().CGColor]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
//        let lightBlurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
//        lightBlurView.frame = self.phraseElementsContainer.bounds
//        self.phraseElementsContainer.insertSubview(lightBlurView, atIndex: 0)
        self.phraseElementsContainer.backgroundColor = UIColor.whiteColor()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: self.view.frame.width, height: 49)
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.scrollDirection = .Horizontal
        self.personsCollectionView.collectionViewLayout = flowLayout
        self.personsCollectionView.showsHorizontalScrollIndicator = false
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
    
    // MARK: Collection view data source
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return persons.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.personsCollectionView.dequeueReusableCellWithReuseIdentifier(PersonCollectionViewCell.identifier(), forIndexPath: indexPath) as! PersonCollectionViewCell
        cell.nameTextLabel.text = persons[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        return cell
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

