//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Jennifer Kwan on 12/13/15.
//  Copyright © 2015 Jennifer Kwan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        defaultTipControl.selectedSegmentIndex = userDefaults.integerForKey("default_index")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        
        if (defaultTipControl.selectedSegmentIndex == 0){
            
            userDefaults.setFloat(userDefaults.floatForKey("alright_service"), forKey: "default_tip")
            userDefaults.setInteger(0, forKey: "default_index")
            userDefaults.setBool(true, forKey: "default_tip_changed")
            
        }
        
        else if (defaultTipControl.selectedSegmentIndex == 1){
            
            userDefaults.setFloat(userDefaults.floatForKey("good_service"), forKey: "default_tip")
            userDefaults.setInteger(1, forKey: "default_index")
            userDefaults.setBool(true, forKey: "default_tip_changed")
        }
        
        else if (defaultTipControl.selectedSegmentIndex == 2){
            
            userDefaults.setFloat(userDefaults.floatForKey("excellent_service"), forKey: "default_tip")
            userDefaults.setInteger(2, forKey: "default_index")
            userDefaults.setBool(true, forKey: "default_tip_changed")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
