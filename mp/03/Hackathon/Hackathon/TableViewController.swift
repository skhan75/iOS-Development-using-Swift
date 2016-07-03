//
//  TableViewController.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 6/29/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class TableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var locatables = [NSManagedObject]()
    
    let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    var objectsToShown:String? = nil
    
    var fetchResultController:NSFetchedResultsController!
    
    var datesSet : NSSet = NSSet()
    var datesArray : [String] = [String]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest(entityName: "Locatable")
        //let fetchRequest1 = NSFetchRequest(entityName: "Date")
        let sortDescriptor = NSSortDescriptor(key: "\(objectsToShown!)", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do{
            try locatables = managedObjectContext?.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            //try dates = managedObjectContext?.executeFetchRequest(fetchRequest1) as! [NSManagedObject]
        }catch{
            print("ERROR: Cannot load data into table")
        }
        
        if (sortDescriptor.key! == "address"){
            self.title = "Address"
        }
        else{
            self.title = "Camera ID"
        }
    
        //For dynamic title printing, the following code can be used: 
        // self. title = self.objectsToShown?.capitalizedString
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return locatables.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.textLabel?.text = locatables[indexPath.row].valueForKey("\(objectsToShown!)") as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       //print(locatables[indexPath.row].valueForKey("atDates")?.valueForKey("violationDate")?.count)
        datesSet = (locatables[indexPath.row].valueForKey("atDates")?.valueForKey("violationDate"))! as! NSSet
        //self.mutableSetValueForKey("atDates").addObject(datesSet)
        datesArray = datesSet.allObjects as! [String]
        print(datesArray)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Locatable2"{
            let controller = segue.destinationViewController as! InnerTableViewController
            
            controller.datesSet = datesSet
            print (datesArray.count)
            
        }
    }
}
