//
//  TaskEditView.swift
//  Homeworkr IV
//
//  Created by Nicolas Legros on 2021-02-14.
//
//

import SwiftUI

struct TaskEditView: View {
    @FetchRequest(entity: Course.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Course.title, ascending: true)])

    var classes: FetchedResults<Course>
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var task: Task
    @State var isPresented: Bool = false
    
//    @State var draft: Task
    

    var body: some View {
        Form {
            TextField("Title", text: $task.title)
            HStack {
                Text("Class")
                Spacer()
                Picker("\(task.course.title)", selection: $task.course) {
                    ForEach(classes, id: \.self) { course in
                        Text(course.title).tag(course.title)
                    }
                }.pickerStyle(MenuPickerStyle())
            }
            DatePicker("Start date", selection: $task.start).datePickerStyle(CompactDatePickerStyle())
            DatePicker("Due date", selection: $task.due)
            TextField("Status", text: $task.status)
            Picker("\(task.taskType)", selection: $task.taskType) {
                ForEach(TaskTypeModel.allCases, id: \.typeId) {value in
                    Text(value.typeId).tag(value.typeId)
                }
            }.pickerStyle(SegmentedPickerStyle())
        }
//                .pickerStyle(MenuPickerStyle())
    }
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

}
