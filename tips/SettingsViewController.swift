//
//  SettingsViewController.swift
//  tips
//
//  Created by zeus medina on 12/13/15.
//  Copyright © 2015 Zeus. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultPercent: UISegmentedControl!
    
    let defaultIndexKey = "default_index_key"
    let timeKey = "time_key"
    let lastBillKey = "bill_key"
    
    //Set to 10 minutes, tested using smaller vallues such as 10 seconds.
    let timeBeforeReset = NSTimeInterval(60 * 10)
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPercent.selectedSegmentIndex = getDefaultIndex()
    }

    @IBAction func valueChanged(sender: AnyObject) {
        setDefaultIndex(defaultPercent.selectedSegmentIndex)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //
    
    func setDefaultIndex(index: Int) {
        defaults.setInteger(index, forKey: defaultIndexKey)
        defaults.synchronize()
    }
    func getDefaultIndex() -> Int {
        return defaults.integerForKey(defaultIndexKey)
    }
    
    func setPreviousBillAmount(currentBill: String) {
        defaults.setObject(currentBill, forKey: lastBillKey)
        //NSDate() will return the current. Used to compare against timeBeforeReset
        defaults.setObject(NSDate(), forKey: timeKey)
        defaults.synchronize()
    }
    
    func getPreviousBillAmount() -> String? {
        let current = NSDate()
        let previousTimeStamp = defaults.objectForKey(timeKey) as! NSDate?
        
        let expired = previousTimeStamp == nil || current.timeIntervalSinceDate(previousTimeStamp!) > timeBeforeReset
        
        if expired {
            return nil
        } else {
            return defaults.objectForKey(lastBillKey) as! String?
        }
       
    }
    
}
