//
//  MapBarController.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 7/4/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class MapBarController: UIViewController {
    
    var locatables = [Locatable]()
    var addressObj: Locatable? = nil
    let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest(entityName: "Locatable")
        
        do{
            try locatables = managedObjectContext?.executeFetchRequest(fetchRequest) as! [Locatable]
        }catch{
            print("ERROR: Cannot load data into table")
        }
        
       // loadCompleteMap()
        print(addressObj?.latitude)
        
    }
    
    func loadCompleteMap() {
        addressObj?.latitude
    }
    
    
}
