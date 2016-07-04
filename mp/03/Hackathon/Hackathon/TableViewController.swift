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
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let fetchRequest = NSFetchRequest(entityName: "Locatable")
        
        let sortDescriptor = NSSortDescriptor(key: "\(objectsToShown!)", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do{
            try locatables = managedObjectContext?.executeFetchRequest(fetchRequest) as! [NSManagedObject]
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(false, animated: animated)
            }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.setToolbarHidden(true, animated: animated)
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Locatable2"{
            let indexPath = self.tableView.indexPathForSelectedRow
            let locatableObj = locatables[indexPath!.row] as! Locatable
            let atDates = locatableObj.atDates!
            let array = atDates.allObjects as! [Date]
            //let datesSet = (locatables[indexPath!.row] as! Locatable).atDates?.allObjects as! [String]
            let controller = segue.destinationViewController as! InnerTableViewController
            controller.location = locatableObj
            controller.datesSet = array
            //print (datesArray.count)
            
        }
    }
}
