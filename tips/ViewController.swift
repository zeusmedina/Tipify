//
//  ViewController.swift
//  tips
//
//  Created by zeus medina on 12/11/15.
//  Copyright © 2015 Zeus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var personsLabel: UILabel!
    @IBOutlet weak var numberOfPeople: UISlider!
    //Instance of SettingsViewController class used to call methods
    var mySettings = SettingsViewController()
    
    //View controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tipify"
       
        numberOfPeople.value = 1
        
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"

        //Keyboard opens on app launch
        billField.becomeFirstResponder()
        
        if let previousBillAmount = mySettings.getPreviousBillAmount() {
            billField.text = previousBillAmount
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = mySettings.getDefaultIndex()
        onEditingChanged(tipControl)
    }
    
    
    //Action Methods
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        var tipPercent = [0.15, 0.2, 0.25]
        let selectedPercent = tipPercent[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        mySettings.setPreviousBillAmount(NSString(string: billField.text!) as String)
        let tip = billAmount * selectedPercent
        print("test")
        let total = (billAmount + tip)/(Double(numberOfPeople.value))
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func numberOfPeopleChanged(sender: AnyObject) {
        let persons = Double(numberOfPeople.value)
        personsLabel.text = "Persons: \(persons)"
        
        var tipPercent = [0.15, 0.2, 0.25]
        let selectedPercent = tipPercent[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        mySettings.setPreviousBillAmount(NSString(string: billField.text!) as String)
        let tip = billAmount * selectedPercent
        print("test")
        let total = (billAmount + tip)/(Double(numberOfPeople.value))
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
}

