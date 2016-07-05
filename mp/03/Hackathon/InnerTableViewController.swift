//
//  InnerTableViewController.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 7/3/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit
import CoreData

class InnerTableViewController: UITableViewController {
    
    var location:Locatable? = nil
    
    var datesSet: [Date] = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datesSet.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("dateCell", forIndexPath: indexPath) as! TableViewCell
        cell.textLabel?.text = datesSet[indexPath.row].violationDate!
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = self.tableView.indexPathForSelectedRow!
        let controller = segue.destinationViewController as! MapDataViewController
        
        controller.dateObj = datesSet[indexPath.row]
        controller.addressObj = location
        controller.indexPath = self.tableView.indexPathForSelectedRow
    }

    
    
}
