//
//  Task+CoreDataProperties.swift
//  Homeworkr IV
//
//  Created by Nicolas Legros on 2021-02-14.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var course: String
    @NSManaged public var due: Date
    @NSManaged public var start: Date
    @NSManaged public var status: String
    @NSManaged public var title: String
    @NSManaged public var taskType: String

}

extension Task : Identifiable {

}
