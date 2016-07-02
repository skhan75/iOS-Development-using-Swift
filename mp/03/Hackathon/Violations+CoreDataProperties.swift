//
//  Violations+CoreDataProperties.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 7/2/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Violations {

    @NSManaged var noOfViolations: NSNumber?
    @NSManaged var forDate: Date?
    @NSManaged var atLocation: Locatable?

}
