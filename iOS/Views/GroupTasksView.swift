//
//  GroupTaskView.swift
//  Homeworkr (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct GroupTasksView: View {
    @FetchRequest(fetchRequest: Task.fetchRequest(.all)) var tasks: FetchedResults<Task>
    
    @Environment(\.managedObjectContext)  var viewContext
    @ObservedObject var course : Course
    
    
    var body: some View {
            ForEach(course.taskArray, id:\.self) { task in
                NavigationLink(destination: TaskInfoView(task: task)) {
                    HStack {
                        Text(task.title)
                        Spacer()
                        Text(getTypeEmoji(task.taskType))
                        
                    }
                }
            }.onDelete(perform: deleteItems)
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                tasks[$0]
            }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

