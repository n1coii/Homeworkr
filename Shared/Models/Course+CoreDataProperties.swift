//
//  Course+CoreDataProperties.swift
//  Homeworkr IV
//
//  Created by Nicolas Legros on 2021-02-14.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var schedule: String
    @NSManaged public var tagColor: String
    @NSManaged public var title: String

}

extension Course : Identifiable {

}
