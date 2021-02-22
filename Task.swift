//
//  Task+CoreDataProperties.swift
//  Homeworkr IV
//
//  Created by Nicolas Legros on 2021-02-19.
//
//

import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject {
}


extension Task {

    @nonobjc public class func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Task> {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.sortDescriptors = [NSSortDescriptor(key: "due", ascending: true)]
        request.predicate = predicate
        return request
    }
    func updateTask(context: NSManagedObjectContext) {
        try? context.save()
    }
    

    @NSManaged public var due: Date
    @NSManaged public var start: Date
    @NSManaged public var status: String
    @NSManaged public var taskType: String
    @NSManaged public var title: String
    @NSManaged public var course: Course
    @NSManaged public var isCompleted: Bool

}

extension Task : Identifiable {
    @discardableResult
    static func update(from updatedTask: Task, in context: NSManagedObjectContext) -> Task {
        let request = fetchRequest(NSPredicate(format: "title = %@", updatedTask.title as CVarArg))
        let results = (try? context.fetch(request)) ?? []
        let task = results.first ?? Task(context: context)
        task.title = updatedTask.title
        task.start = updatedTask.start
        task.due = updatedTask.due
        task.status = updatedTask.status
        task.taskType = updatedTask.taskType
        task.isCompleted = updatedTask.isCompleted
        task.objectWillChange.send()
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return task
    }

}

func addTask(title: String, course: Course, start: Date, due: Date, status: String, taskType: String, isCompleted: Bool = false, in context: NSManagedObjectContext) {
        let newTask = Task(context: context)
        newTask.start = start
        newTask.title = title
        newTask.course = course
        newTask.due = due
        newTask.status = status
        newTask.taskType = taskType
        newTask.isCompleted = isCompleted
    Task.update(from: newTask,in: context)
}
