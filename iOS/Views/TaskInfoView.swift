//
//  TaskInfoView.swift
//  Homeworkr IV (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct TaskInfoView: View {

    @Environment(\.managedObjectContext)  var viewContext
    @Environment(\.editMode) var editMode

    @ObservedObject var task: Task

    var body: some View {
        ZStack {
            if editMode?.wrappedValue == .active {
                TaskEditView(task: task).onDisappear(perform: updateTask)
            } else {
                Form {
                    Section(header: Text("Title")) {
                        Text("\(task.title)")
                    }
                    Section(header: Text("Class")) {
                        HStack {
                        Text("\(task.course.title)")
                        Image(systemName: "circle.fill").foregroundColor(Color(UIColor(hex: task.course.tagColor!)!))
                        }
                    }
                    Section(header: Text("Start date")) {
                        Text("\(task.start, formatter: itemFormatter)")
                    }
                    Section(header: Text("Due date")) {
                        Text("\(task.due, formatter: itemFormatter)")
                    }
                    Section(header: Text("Status")) {
                        Text("\(task.status)")
                    }
                    Section(header: Text("Type")) {
                        Text("\(task.taskType)")
                    }
                }

            }
        }
                .navigationBarItems(trailing: EditButton())
    }
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    private func updateTask() {
        try? viewContext.save()
    }
}
