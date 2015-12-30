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
    @IBOutlet weak var alrightServiceImage: UIImageView!
    @IBOutlet weak var goodServiceImage: UIImageView!
    @IBOutlet weak var excellentServiceImage: UIImageView!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        let now = NSDate.timeIntervalSinceReferenceDate()
        let ten_min = 600.0
        
        print(userDefaults.doubleForKey("previous_bill_time"))
        print(userDefaults.floatForKey("previous_bill_amount"))
        
        if ((now - userDefaults.doubleForKey("previous_bill_time")) < ten_min && userDefaults.floatForKey("previous_bill_amount") > 0.0) {
            
            billField.text = String(userDefaults.floatForKey("previous_bill_amount"))
            tipControl.selectedSegmentIndex = userDefaults.integerForKey("current_index")
            calculate()
            
        } else {
        
            tipControl.selectedSegmentIndex = userDefaults.integerForKey("default_index")
            tipLabel.text = "0.00"
            totalLabel.text = "0.00"
        }
        
        let image1 : UIImage = UIImage (named: "alright_service.gif")!
        var data1:NSData = try! AnimatedGIFImageSerialization.animatedGIFDataWithImage(image1, duration:0, loopCount:0)
        alrightServiceImage.image = UIImage(data:data1)
        
        let image2 : UIImage = UIImage (named: "good_service.gif")!
        var data2:NSData = try! AnimatedGIFImageSerialization.animatedGIFDataWithImage(image2, duration:0, loopCount:0)
        goodServiceImage.image = UIImage(data:data2)
        
        let image3 : UIImage = UIImage (named: "excellent_service.gif")!
        var data3:NSData = try! AnimatedGIFImageSerialization.animatedGIFDataWithImage(image3, duration:0, loopCount:0)
        excellentServiceImage.image = UIImage(data:data3)
        
        
        billField.becomeFirstResponder()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        billField.becomeFirstResponder()
        tipControl.selectedSegmentIndex = userDefaults.integerForKey("current_index")
        calculate()
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
        
//        let tipPercentages = [userDefaults.floatForKey("alright_service"), userDefaults.floatForKey("good_service"), userDefaults.floatForKey("excellent_service")]
//        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        calculate()
        
        if (billField.text == "") {
            userDefaults.setFloat(0.0, forKey: "previous_bill_amount")
            
        }
        userDefaults.setDouble(NSDate.timeIntervalSinceReferenceDate(), forKey: "previous_bill_time")
        selectImage(tipControl.selectedSegmentIndex)
        
        
        
    }
    
    func calculate() {
        
        let tipPercentages = [userDefaults.floatForKey("alright_service"), userDefaults.floatForKey("good_service"), userDefaults.floatForKey("excellent_service")]
        let tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
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

