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
    //var managedObjectContext: NSManagedObjectContext? = nil
    var defaultContext: Date?
    let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    var objectsToShown:String? = nil
    
    var fetchResultController:NSFetchedResultsController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest(entityName: "Locatable")
        print(objectsToShown)
        let sortDescriptor = NSSortDescriptor(key: "\(objectsToShown!)", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do{
            try locatables = managedObjectContext?.executeFetchRequest(fetchRequest) as! [NSManagedObject]
        }catch{
            print("Cannot load data into table")
        }
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
        print(locatables.count)
        return locatables.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        //cell.days.text = "11/11/2016"//menuItems[indexPath.row].cameraID
       /// cell.date!.text = "12.11.2016"//menuItems[indexPath.row].violationDate
        //cell.violations!.text = "11"//"$\(menuItems[indexPath.row].violations) as! Double)"
        cell.textLabel?.text = locatables[indexPath.row].valueForKey("\(objectsToShown!)") as? String
        return cell
    }
    
   

}
