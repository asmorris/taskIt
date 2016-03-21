//
//  TaskModel+CoreDataProperties.swift
//  taskIt
//
//  Created by Andrew Morrison on 2016-03-20.
//  Copyright © 2016 Andrew Morrison. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension TaskModel {

    @NSManaged var completed: NSNumber?
    @NSManaged var date: NSDate?
    @NSManaged var subtask: String?
    @NSManaged var task: String?

}
