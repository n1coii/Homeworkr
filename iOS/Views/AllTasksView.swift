//
//  AllTasksView.swift
//  Homeworkr (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct AllTasksView: View {
    
    @Environment(\.managedObjectContext)  var viewContext
    @FetchRequest(fetchRequest: Task.fetchRequest(.open)) var tasks: FetchedResults<Task>
    
    var viewController = TaskViewController()
    //    var tasks = viewController.getTasks()
    
    @State private var action: Int? = 0
    @State private var course: Course?
    @State private var showingSheetTask: Bool = false
    @State private var showingSheetFilter: Bool = false
    @State private var isPressed: Bool = false
    @State  var sortBy: Int = 1
    @State  var groupBy: Int = 3
    @State var isGrouped: Bool = false
    @State var showCompleted: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                if !isGrouped {
                    List {
                        ForEach(tasks, id: \.self) { task in
                            TaskView(task: task)
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
                else {
                    GroupsTaskView()
                }
                
            }
            .navigationBarItems(leading:
                                    HStack {
                                        Button(action: {
                                            self.showingSheetFilter = true
                                        }) {
                                            Image(systemName: "line.horizontal.3.decrease.circle")
                                            
                                        }.sheet(isPresented: $showingSheetFilter) {
                                            NavigationView {
                                                FilterTaskView(isPresented: $showingSheetFilter, sortBy: $sortBy, groupBy: $groupBy, isGrouped: $isGrouped, showCompleted: $showCompleted)
                                            }
                                        }
                                        
                                    },
                                trailing:
                                    HStack {
                                        Button(action: {
                                            self.showingSheetTask = true
                                        }) {
                                            Image(systemName: "plus")
                                        }.sheet(isPresented: $showingSheetTask) {
                                            NavigationView {
                                                AddTaskView(isPresented: $showingSheetTask)
                                            }
                                        }
                                        
                                    })
        }
                }
        
//    }
    
    
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


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()



