//
//  AddressTableViewController.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 7/3/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit
import CoreData

class AddressTableViewController: UITableViewController {

    var date: Date? = nil
    var address = [Locatable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddress()
    }
    
    func loadAddress() {
        address = date?.atLocations?.allObjects as! [Locatable]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if date == nil {
            return 0
        }else{
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return address.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("address")!
        cell.textLabel?.text = address[indexPath.row].address!
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = self.tableView.indexPathForSelectedRow!
        let controller = segue.destinationViewController as! MapDataViewController
        
        controller.addressObj = address[indexPath.row]
        controller.dateObj = date!
    }
    
    
    
}
