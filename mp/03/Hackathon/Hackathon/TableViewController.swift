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
    
    
    
    private var menuItems:[MenuItems] = []
    //private var database: FMDatabase!
    var fetchResultController:NSFetchedResultsController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // Load menu items from database
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            
            let fetchRequest = NSFetchRequest(entityName: "MenuItems")
            
            do {
                menuItems = try managedObjectContext.executeFetchRequest(fetchRequest) as! [MenuItems]
            }
            catch {
                print("Failed to retrieve record")
                print(error)
            }
        }
        
        // Make the cell self size
        tableView.estimatedRowHeight = 66.0
        tableView.rowHeight = UITableViewAutomaticDimension

        
        //let dirs = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .AllDomainsMask, true) as [NSString]
        //dbPath = NSBundle.mainBundle().pathForResource("CameraViolations", ofType: "db")!
        //dbPath = dirs.stringByAppendingPathComponent("CameraViolations.db")
       


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(menuItems.count)
        return menuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.cameraID!.text = menuItems[indexPath.row].cameraID
        cell.date!.text = menuItems[indexPath.row].violationDate
        cell.violations!.text = "$\(menuItems[indexPath.row].violations) as! Double)"
        return cell
    }


}
