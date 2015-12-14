//
//  AppDelegate.swift
//  TipCalculator
//
//  Created by Jennifer Kwan on 12/13/15.
//  Copyright © 2015 Jennifer Kwan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var firstLoad = userDefaults.boolForKey("is_First_Load")
        
        firstLoad = false
        
        if (!firstLoad){
            userDefaults.setFloat(0.18, forKey: "alright_service")
            userDefaults.setFloat(0.20, forKey: "good_service")
            userDefaults.setFloat(0.22, forKey: "excellent_service")
            userDefaults.setBool(true, forKey: "is_first_load")
            userDefaults.setFloat(0, forKey: "default_tip")
            userDefaults.setInteger(0, forKey: "default_index")
            userDefaults.setBool(false, forKey: "default_tip_changed")
            userDefaults.setDouble(0.0, forKey: "previous_bill_time")
            userDefaults.setFloat(0.0, forKey: "previous_bill_amount")
            userDefaults.synchronize()
        }
        
        
        return true
    
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

