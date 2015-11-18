//
//  SettingsViewController.swift
//  GuyGirlTextAssistant
//
//  Created by Heidi Yee on 11/16/15.
//
//

import UIKit

typealias SettingsViewControllerCompletion = (success: Bool) -> ()

class SettingsViewController: UIViewController {
    
    var completion: SettingsViewControllerCompletion?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderOptionsButton: UISegmentedControl!
    @IBOutlet weak var relationshipOptionsButton: UISegmentedControl!
    @IBOutlet weak var goalOptionsButton: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dismissButtonSelected(sender: AnyObject) {
        if let completion = self.completion {
            completion(success: true)
        }
    }

    @IBAction func saveButton(sender: AnyObject) {
        //saves settings
        print("save")
    }
    

    @IBAction func genderOptions(sender: AnyObject) {
        if(genderOptionsButton.selectedSegmentIndex == 0)
        {
            print("First Segment Selected")
        }
        else if (genderOptionsButton.selectedSegmentIndex == 1)
        {
            print("Second Segment Selected")
        }

    }

    @IBAction func relationshipOptions(sender: AnyObject) {
        
        if(relationshipOptionsButton.selectedSegmentIndex == 0)
        {
            print("First Segment Selected")
        }
        else if (relationshipOptionsButton.selectedSegmentIndex == 1)
        {
            print("Second Segment Selected")
        }
        else if (relationshipOptionsButton.selectedSegmentIndex == 2)
        {
            print("Third Segment Selected")
        }
    }
    
    @IBAction func goalOptions(sender: AnyObject) {
        
        if(goalOptionsButton.selectedSegmentIndex == 0)
        {
            print("First Segment Selected")
        }
        else if (goalOptionsButton.selectedSegmentIndex == 1)
        {
            print("Second Segment Selected")
        }
        else if (goalOptionsButton.selectedSegmentIndex == 2)
        {
            print("Third Segment Selected")
        }
    }
    
    @IBAction func createNew(sender: AnyObject) {
        print("add new person")
    }
    
    
    
}
