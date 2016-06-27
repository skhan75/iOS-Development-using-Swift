//
//  DetailTableViewController.swift
//  Improved Unit Converter
//
//  Created by Sami Ahmad Khan on 6/19/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let conversionObject = UnitConverter()
    var convertedUnits: [Double] = [Double]()
    var printUnits: [Double] = [Double]()
    
    var CellTitle = String()
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = CellTitle
        self.hideKeyboardWhenTappedAround()

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
        return appDelegate.eachUnitNameForCategories[CellTitle]!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("category", forIndexPath: indexPath) as! TableViewCell
        
        var m: Int = 0
        for (_, value) in appDelegate.eachUnitNameForCategories {
            for _ in value {
                if(CellTitle == appDelegate.categoriesArray[m] ){
                    cell.unitName!.text = appDelegate.eachUnitNameForCategories[CellTitle]![indexPath.row]
                    cell.value.placeholder = "0.0"
                }
            }
            m += 1
        }
        return cell
    }

    @IBAction func textChanged(sender: UITextField) {
        let currentCell = sender.superview!.superview! as! TableViewCell
        let table = currentCell.superview!.superview! as! UITableView
        let row = table.indexPathForCell(currentCell)!.row
        convertedUnits = conversionObject.valueCalculation(row, category: self.title!, enteredValueByUser: sender.text!, tableView : table)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
