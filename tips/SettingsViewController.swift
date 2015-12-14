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
    
}
