//
//  AppDelegate.swift
//  Improved Unit Converter
//
//  Created by Sami Ahmad Khan on 6/18/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var categoriesArray: [String] = [String]()
    var eachUnit: String = String()
    var unitsInEachCategory: [String] = [String]()
    var eachUnitNameForCategories: [String: [String]] = [String: [String]]()
    var keyValuePairForEachUnit: [String: [String]] = [String: [String]]()
    var a: [String] = [String]()
    var stylesheet : NSMutableDictionary?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
       // window = UIWindow(frame: UIScreen.mainScreen().bounds)
       // window?.makeKeyAndVisible()
        
        //let controller = TableViewController()
        //let navigatioController = UINavigationController(rootViewController: controller)
        //window?.rootViewController = navigatioController
        
        
        let filePath = NSBundle.mainBundle().pathForResource("ConversionInfo", ofType: "plist")!
        stylesheet = NSMutableDictionary(contentsOfFile:filePath)
        let categoriesInPlist = stylesheet?.objectForKey("Categories")
        
        if let categ = categoriesInPlist {
            categoriesArray = categ as! [String]
        }
        
        for i in categoriesArray {
            
            let unit = stylesheet!.valueForKey(i)
            let element = unit!.allKeys
            
            if let e = element{
                
                a = e as! [String]
                a = a.reverse()
                unitsInEachCategory += a
                unitsInEachCategory.append(";")
            }
        }
        
        
        var str: [String] = [String]()
        var n: Int = 0
        //print(categoriesArray)
        for j in unitsInEachCategory {
            
            if(j == ";"){
                eachUnitNameForCategories.updateValue(str, forKey: categoriesArray[n])
                str.removeAll()
                n += 1
            }
            else{
                str.append(j)
            }
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

