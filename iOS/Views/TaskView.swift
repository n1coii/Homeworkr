//
//  TaskView.swift
//  Homeworkr IV (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct TaskView: View {
    
    @Environment(\.managedObjectContext)  var viewContext
    @ObservedObject var task: Task

    var body: some View {
        NavigationLink(destination: TaskInfoView(task: task)) {
            HStack{
                Text(getTypeEmoji(task.taskType))
                Text((task.title))
                Spacer()
                Toggle("", isOn: $task.isCompleted).toggleStyle(CheckboxStyle(tint: Color(UIColor(hex: task.course.tagColor!)!)))
                
            }
        }
    }
}



