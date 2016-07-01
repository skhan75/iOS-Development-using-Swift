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

class TableViewController: UITableViewController {

    var locatables = [NSManagedObject]()
    //let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    var fetchResultController:NSFetchedResultsController!
    
    
//    lazy var fetchedResultsController: NSFetchedResultsController = {
//        let locatablesFetchRequest = NSFetchRequest(entityName: "Locatable")
//        let dateFetchRequest = NSFetchRequest(entityName: "Date")
//        let violationsFetchRequest = NSFetchRequest(entityName: "Violations")
//        
//        //let frc = NSFetchedResultsController(fetchRequest: locatablesFetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: , cacheName: <#T##String?#>)
//        
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        //print(locatables.count)
        return 3 //locatables.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.days.text = "11/11/2016"//menuItems[indexPath.row].cameraID
       /// cell.date!.text = "12.11.2016"//menuItems[indexPath.row].violationDate
        //cell.violations!.text = "11"//"$\(menuItems[indexPath.row].violations) as! Double)"
        return cell
    }
    
//    func saveItem(itemToSave : String){
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext
//        let locatableEntity = NSEntityDescription.entityForName("Locatable", inManagedObjectContext: managedContext)
//        let item = NSManagedObject(entity: locatableEntity!, insertIntoManagedObjectContext: managedContext)
//        do{
//            try managedContext.save()
//            locatables.append(item)
//            print("Save Successfull")
//        }
//        catch{
//            print("Error")
//        }
//    }

}
