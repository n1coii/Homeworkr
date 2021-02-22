//
//  ClassInfoView.swift
//  Homeworkr IV (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct ClassInfoView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var editMode
    
    @ObservedObject var course : Course
    @State var isDisabled : Bool = true
    
    //    @State private var draft: Course
    //
    //    init(course: Binding<Course>) {
    //        _isDisabled = State(initialValue: true)
    //        _draft = State(wrappedValue: course.wrappedValue)
    //        _course = ObservedObject(wrappedValue: course.wrappedValue)
    //    }
    
    var body: some View {
        ZStack {
            if editMode?.wrappedValue == .active {
                ClassEditView(course: _course)
            }
            else {
                Form {
                    Section(header: Text("Title")) {
                        HStack {
                            TextField("title", text: $course.title).disabled(isDisabled)
                            Image(systemName: "circle.fill").foregroundColor(Color(UIColor(hex: course.tagColor!)!))
                        }
                    }
                    //                                   Section (header: Text("Schedule")){
                    ////                        TextField("Schedule", text:($course.schedule)).disabled(isDisabled)
                    //                    }
                    
                }
            }
        }
        .navigationBarItems(trailing: EditButton())
        
        
        
    }
}

