//
//  Locatable+CoreDataProperties.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 7/3/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Locatable {

    @NSManaged var address: String?
    @NSManaged var cameraID: String?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var atDates: NSSet?
    @NSManaged var violations: NSSet?
    
    func addDates(date:Date) {
        self.mutableSetValueForKey("atDates").addObject(date)
    }
    
    func addViolations(violation:Violations) {
        self.mutableSetValueForKey("violations").addObject(violation)
    }

}
