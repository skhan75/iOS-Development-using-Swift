//
//  AppDelegate.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 6/29/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        NSThread.sleepForTimeInterval(1); // For delaying launch screen
        
        //loadIntoCoredata()
        return true
    }
    
    func fetchRequest(entity: String, attribute: String ,value: String) -> [AnyObject] {
        let fetchObj = NSFetchRequest(entityName: entity)
        let predicate = NSPredicate(format: "\(attribute) == %@", value)
        fetchObj.predicate = predicate
        
        var array = [AnyObject]()
        
        do{
            try array = self.managedObjectContext.executeFetchRequest(fetchObj)
            
        }catch{
            print("Unable to fetch object from Core Data")
        }
        
        return array
    }
    
    //Function to load SQLite Database into Core Data
    func loadIntoCoredata() {
        
        let dictForEntities: NSMutableDictionary = NSMutableDictionary()
        var dbPath: String!
        var db: COpaquePointer = nil
        dbPath = NSBundle.mainBundle().pathForResource("CameraViolations", ofType: "db")!
       
        
        // OPEN DATABASE
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            print("Database opened")
        }
        else {
            print("Database Not Found !")
        }
        
        
        let queryStatementString = "SELECT * FROM CameraViolations;"
        
        
        //QUERY A DATABASE
        
        var queryStatement: COpaquePointer = nil
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
        
            let managedObjectContext = self.managedObjectContext
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                let address = sqlite3_column_text(queryStatement, 0)
                let addressText = String.fromCString(UnsafePointer<CChar>(address))!
                
                let cameraID = sqlite3_column_text(queryStatement, 1)
                let cameraIDText = String.fromCString(UnsafePointer<CChar>(cameraID))!
                
                let violationDate = sqlite3_column_text(queryStatement, 2)
                let violationDateText = String.fromCString(UnsafePointer<CChar>(violationDate))!
                
                let violations = sqlite3_column_text(queryStatement, 3)
                let violationsText = String.fromCString(UnsafePointer<CChar>(violations))!
                
                let latitude = sqlite3_column_text(queryStatement, 6)
                let latText = String.fromCString(UnsafePointer<CChar>(latitude))!
                
                let longitude = sqlite3_column_text(queryStatement, 7)
                let longText = String.fromCString(UnsafePointer<CChar>(longitude))!
                
                let arrayLoc = fetchRequest("Locatable", attribute: "cameraID", value: cameraIDText)
                
                if (arrayLoc.isEmpty){
                
                    let locate = NSEntityDescription.insertNewObjectForEntityForName("Locatable", inManagedObjectContext: managedObjectContext) as! Locatable
                    locate.address = addressText
                    locate.cameraID = cameraIDText
                    locate.latitude = NSNumber(double: Double(latText)!)
                    locate.longitude = NSNumber(double: Double(longText)!)
                    dictForEntities["Location"] = locate
                
                }else{
                    dictForEntities["Location"] = arrayLoc[0]
                }
                
                let arrayDate = fetchRequest("Date", attribute: "violationDate", value: violationDateText)
                if (arrayDate.isEmpty){
                    
                    let date = NSEntityDescription.insertNewObjectForEntityForName("Date", inManagedObjectContext: managedObjectContext) as! Date
                    date.violationDate = violationDateText
                    dictForEntities["Date"] = date
                    
                }else{
                    dictForEntities["Date"] = arrayDate[0]
                }
                
                let arrayViolations = fetchRequest("Violations", attribute: "noOfViolations", value: violationsText)
                if (arrayViolations.isEmpty){
                    
                    let violationsObj = NSEntityDescription.insertNewObjectForEntityForName("Violations", inManagedObjectContext: managedObjectContext) as! Violations
                    violationsObj.noOfViolations = NSNumber(int: Int32(violationsText)!)
                    dictForEntities["Violations"] = violationsObj
                    
                }else{
                    dictForEntities["Violations"] = arrayViolations[0]
                }
                
                (dictForEntities["Location"] as! Locatable).addDates(dictForEntities["Date"] as! Date)
                (dictForEntities["Violations"] as! Violations).forDate = dictForEntities["Date"] as? Date
                (dictForEntities["Location"] as! Locatable).addViolations((dictForEntities["Violations"] as? Violations)! )
                
                dictForEntities["Location"] = nil
                dictForEntities["Date"] = nil
                dictForEntities["Violations"] = nil
                
                do{
                    try managedObjectContext.save()
                }catch{
                    print("Cannot Save to core data")
                }
                
            }
        }
        sqlite3_finalize(queryStatement)
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "sami.iit.edu.Hackathon" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("Hackathon", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

