//
//  AddTaskView.swift
//  Homeworkr IV (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(fetchRequest: Course.fetchRequest(.all)) var courses: FetchedResults<Course>
    
    
    @State var title = ""
    @State var course : Course = Course()
    @State var status = "Open"
    @State var start = Date()
    @State var due = Date()
    @State var taskType : String = "Type"
    
    @Binding var isPresented: Bool
    
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                DatePicker("Start date", selection: $start)
                DatePicker("Due date", selection: $due)
                HStack {
                    Picker("Class",
                           selection: $course) {
                        ForEach(courses, id: \.self) { course in
                            HStack {
                                Image(systemName: "circle.fill").foregroundColor(Color(UIColor(hex: course.tagColor!)!))
                                Text("\(course.title)").tag(course.title)

                            }
                        }
                    }
                }
                Picker("\(taskType)", selection: $taskType) {
                    ForEach(TaskTypeModel.allCases, id: \.typeId) {value in
                        Text(value.typeId).tag(value.typeId)
                    }
                }
            }
        }
        .navigationBarTitle("New Task")
        .navigationBarItems(trailing: Button("add") {
            withAnimation {
                addTask(title: title, course: course, start: start, due: due, status: status, taskType: taskType, in: viewContext)
                self.isPresented.toggle()
                
            }
        })
    }
    //    }
    
    }

//struct AddView_Previews: PreviewProvider {
//
//
//
//    static var previews: some View {
//
//
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//        AddView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
