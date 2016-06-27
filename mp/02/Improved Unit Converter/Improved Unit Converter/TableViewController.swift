//
//  TableViewController.swift
//  Improved Unit Converter
//
//  Created by Sami Ahmad Khan on 6/18/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //let objects = ["Area","Length", "Temperature","Time","Volume"]
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
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
        return appDelegate.categoriesArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell

        cell.cellText!.text = appDelegate.categoriesArray[indexPath.row]

        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "segueIdentifier"){
            let destination = segue.destinationViewController as! DetailTableViewController
            let cell = sender as! UITableViewCell
            let selectedRow = tableView.indexPathForCell(cell)!.row
            destination.CellTitle = appDelegate.categoriesArray[selectedRow]
        }
    }

    
}
