//
//  ViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Heidi Yee on 11/16/15.
//
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {

    var persons = ["Jane", "Sally", "Bob", "Suzie", "Sandra"]
    var answers = ["Ayylmao", "Lorem ipsum dolor sit amet", "Sed sit amet", "Ipsum mauris"]
    
    @IBOutlet weak var personsCollectionView: UICollectionView!
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var answersTableView: UITableView!
    
    class func identifier() -> String {
        return "MainViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.personsCollectionView.dataSource = self
        self.personsCollectionView.delegate = self
        self.personsCollectionView.backgroundColor = UIColor.whiteColor()
        
        self.answersTableView.dataSource = self
        self.answersTableView.delegate = self
        
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
    
    // MARK: Collection view data source
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return persons.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.personsCollectionView.dequeueReusableCellWithReuseIdentifier(PersonCollectionViewCell.identifier(), forIndexPath: indexPath) as! PersonCollectionViewCell
        cell.nameTextLabel.text = persons[indexPath.row]
        cell.backgroundColor = UIColor.lightGrayColor()
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
    }
    
    // MARK: Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.answersTableView.dequeueReusableCellWithIdentifier(AnswerTableViewCell.identifier()) as! AnswerTableViewCell
        cell.answerTextLabel.text = answers[indexPath.row]
        cell.textParentView.layer.cornerRadius = 16.0
        cell.textParentView.backgroundColor = UIColor.whiteColor()
        return cell
    }
}

