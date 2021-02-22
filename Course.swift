//
//  Course+CoreDataProperties.swift
//  Homeworkr IV
//
//  Created by Nicolas Legros on 2021-02-19.
//
//

import Foundation
import CoreData

@objc(Course)
public class Course: NSManagedObject {
}

extension Course {

    @nonobjc public class func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Course> {
        let request = NSFetchRequest<Course>(entityName: "Course")
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = predicate
        return request
    }

    @NSManaged public var schedule: Schedule?
    @NSManaged public var tagColor: String?
    @NSManaged public var title: String
    @NSManaged public var tasks: NSSet?

}

// MARK: Generated accessors for tasks
extension Course {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}

extension Course : Identifiable {
    
    public var taskArray: [Task] {
        let set = tasks as? Set<Task> ?? []
        return set.sorted {
            $0.title < $1.title
        }
    }
    
    @discardableResult
    static func update(from updatedCourse: Course, in context: NSManagedObjectContext) -> Course {
        let request = fetchRequest(NSPredicate(format: "title = %@", updatedCourse.title as CVarArg))
        let results = (try? context.fetch(request)) ?? []
        let course = results.first ?? Course(context: context)
        course.title = updatedCourse.title
        course.schedule = updatedCourse.schedule
        course.tagColor = updatedCourse.tagColor
        course.tasks = updatedCourse.tasks
        course.objectWillChange.send()
        
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return course
    }
    
    static func withString(_ title: String, context: NSManagedObjectContext) -> Course {
        let course = Course(context: context)
        course.title = title
        course.objectWillChange.send()
        try? context.save()
        return course
    }
    
}

func addClass(title: String, schedule: Schedule, tagColor: String, in context: NSManagedObjectContext) {
    let newClass = Course(context: context)
        newClass.title = title
        newClass.schedule = schedule
        newClass.tagColor = tagColor
    Course.update(from: newClass, in: context)
    }
