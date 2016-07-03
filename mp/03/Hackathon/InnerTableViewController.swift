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

    var datesSet: NSSet = NSSet()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let arr = datesSet.allObjects
        print ("Hello", arr.count)
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
        //var arr = datesArray.allObjects
       // cell.textLabel?.text = datesArray as? String
        return cell
    }

    
    
}
