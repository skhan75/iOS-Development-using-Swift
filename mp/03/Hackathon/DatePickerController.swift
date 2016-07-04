//
//  DatePickerController.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 7/3/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit
import CoreData

class DatePickerController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    var date = [Date]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let cal = NSCalendar.currentCalendar()
        let components = cal.components([.Day , .Month , .Year], fromDate: (datePicker.date))
        
        
        let dateString = "\(components.month)/\(components.day)/\(components.year % 100)"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let oldDate = dateFormatter.dateFromString(dateString)!
        dateFormatter.dateFormat = "MM/dd/yy"
        let newDate = dateFormatter.stringFromDate(oldDate)
        print("New Date Format ", newDate)
        
        let controller = segue.destinationViewController as! AddressTableViewController
        
        let newDateString = newDate

        let fetchRequest = NSFetchRequest(entityName: "Date")
        let sortDescriptor = NSSortDescriptor(key: "violationDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let predicate = NSPredicate(format: "violationDate == %@", dateString)
        fetchRequest.predicate = predicate
        
        do{
            try date = managedObjectContext?.executeFetchRequest(fetchRequest) as! [Date]
        }catch{
            print("ERROR: Cannot load data into table")
        }
        
        if date.count != 0 {
            controller.date = date[0]
        }else{
            print("Nothing")
        }

    }
    
}
