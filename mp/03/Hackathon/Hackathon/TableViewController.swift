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
    
    //private var menuItems:[MenuItems] = []
    var managedObjectContext: NSManagedObjectContext? = nil
    var fetchResultController:NSFetchedResultsController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        //print(menuItems.count)
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.days.text = "11/11/2016"//menuItems[indexPath.row].cameraID
       /// cell.date!.text = "12.11.2016"//menuItems[indexPath.row].violationDate
        //cell.violations!.text = "11"//"$\(menuItems[indexPath.row].violations) as! Double)"
        return cell
    }


}
