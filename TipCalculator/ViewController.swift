//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jennifer Kwan on 12/13/15.
//  Copyright © 2015 Jennifer Kwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
    {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var animationImage: UIImageView!
    @IBOutlet weak var alrightServiceImage: UIImageView!
    @IBOutlet weak var goodServiceImage: UIImageView!
    @IBOutlet weak var excellentServiceImage: UIImageView!
    
    var tipPecent: Float!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipPecent = userDefaults.floatForKey("default_tip")
        tipControl.selectedSegmentIndex = userDefaults.integerForKey("default_index")

        
        
        let now = NSDate.timeIntervalSinceReferenceDate()
        let ten_min = 600.0
        
        print(userDefaults.doubleForKey("previous_bill_time"))
        print(userDefaults.floatForKey("previous_bill_amount"))
        
        if ((now - userDefaults.doubleForKey("previous_bill_time")) < ten_min ) {
            
            billField.text = String(userDefaults.floatForKey("previous_bill_amount"))
            calculate(userDefaults.floatForKey("default_tip"))
            
        } else {
        
            tipLabel.text = "0.00"
            totalLabel.text = "0.00"
        }
        
        billField.becomeFirstResponder()
        
        
        //billField.enabled = true
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        billField.becomeFirstResponder()
        
        if(userDefaults.boolForKey("default_tip_changed")) {
            tipControl.selectedSegmentIndex = userDefaults.integerForKey("default_index")
            calculate(userDefaults.floatForKey("default_tip"))
            userDefaults.setBool(false, forKey: "default_tip_changed")
        }
        selectImage(tipControl.selectedSegmentIndex)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let tipPercentages = [userDefaults.floatForKey("alright_service"), userDefaults.floatForKey("good_service"), userDefaults.floatForKey("excellent_service")]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        calculate(tipPercentage)
        
        userDefaults.setDouble(NSDate.timeIntervalSinceReferenceDate(), forKey: "previous_bill_time")
        selectImage(tipControl.selectedSegmentIndex)
        
        
        
//        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
//        let billAmount = NSString(string: billField.text!).floatValue
//        let tip = billAmount * tipPercentage
//        let total = billAmount + tip
//        
//        let currencyFormatter = NSNumberFormatter()
//        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
//        currencyFormatter.locale = NSLocale.currentLocale()
//        
//        tipLabel.text = currencyFormatter.stringFromNumber(tip)
//        totalLabel.text = currencyFormatter.stringFromNumber(total)
        
        
        
        
//        tipLabel.text = String(format: "$%.2f", tip)
//        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    func calculate(tipPercent: Float) {
        
        let billAmount = NSString(string: billField.text!).floatValue
        print(billAmount)
        userDefaults.setFloat(billAmount, forKey: "previous_bill_amount")
        print(userDefaults.floatForKey("previous_bill_amount"))
        let tip = billAmount * tipPercent
        let total = billAmount + tip
        
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = NSLocale.currentLocale()
        
        tipLabel.text = currencyFormatter.stringFromNumber(tip)
        totalLabel.text = currencyFormatter.stringFromNumber(total)
        
        
        
    }
    
    func selectImage(index : Int) {
        
        if (index == 0) {
            alrightServiceImage.hidden = false
            goodServiceImage.hidden = true
            excellentServiceImage.hidden = true
//            let image:UIImage = UIImage(named: "Pusheen_content_gif.gif")!
//            var data:NSData = try!
//                AnimatedGIFImageSerialization.animatedGIFDataWithImage(image, duration: 0, loopCount: 0)
//            alrightServiceImage.image = UIImage(data: data)
            
            
            
        }
        
        else if (index == 1) {
            alrightServiceImage.hidden = true
            goodServiceImage.hidden = false
            excellentServiceImage.hidden = true
            
        }
        
        else if (index == 2) {
            alrightServiceImage.hidden = true
            goodServiceImage.hidden = true
            excellentServiceImage.hidden = false
            
        }
        
        
    }

    @IBAction func onTap(sender: AnyObject) {
    
    view.endEditing(true)
    
    }
    
}

