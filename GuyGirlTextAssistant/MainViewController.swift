//
//  ViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Heidi Yee on 11/16/15.
//
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var persons = ["Jane", "Sally", "Bob", "Suzie", "Sandra"]
    var answers = ["Ayylmao", "Lorem ipsum dolor sit amet", "Sed sit amet", "Ipsum mauris"]
    
    @IBOutlet weak var personsCollectionView: UICollectionView!
    @IBOutlet weak var answersView: UIView!
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var phraseLabel: UILabel!
    
    class func identifier() -> String {
        return "MainViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.personsCollectionView.dataSource = self
        self.personsCollectionView.delegate = self
        self.personsCollectionView.backgroundColor = UIColor.whiteColor()
        
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
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    // MARK: Collection view delegate 
    
    // MARK: Text field actions

    @IBAction func textFieldEditingChanged(textField: UITextField) {
        if let phraseText = textField.text, phraseLabel = self.phraseLabel {
            phraseLabel.text = "“\(phraseText)”"
        }
    }
    
    @IBAction func textFieldDidEndOnExit(textField: UITextField) {
        self.phraseTextField.text = nil
    }
}

