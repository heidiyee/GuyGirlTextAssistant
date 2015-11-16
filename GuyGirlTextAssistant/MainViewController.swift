//
//  ViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Heidi Yee on 11/16/15.
//
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var persons = ["Jane Doe", "John Doe"]
    
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
        flowLayout.itemSize = CGSize(width: self.view.frame.width, height: 37.0)
        self.personsCollectionView.collectionViewLayout = flowLayout
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
        return cell
    }
}

