//
//  Date+CoreDataProperties.swift
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

extension Date {

    @NSManaged var violationDate: String?
    @NSManaged var atLocations: NSSet?
    @NSManaged var violations: Violations?

}
