//
//  ClassEditView.swift
//  Homeworkr IV (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct ClassEditView: View {
    @ObservedObject var course: Course
    @State var tagColor = Color(red: 0.8, green: 0.1, blue: 0.5)
    @State var isPresented: Bool = false
    
//    @State private var courseDraft: Course
    
//    init(course: Binding<Course>) {
//        _courseDraft = State(wrappedValue: course.wrappedValue())
//    }

    var body: some View {
        Form {
            HStack {
                TextField("Title", text: $course.title).foregroundColor(Color(UIColor(hex: course.tagColor ?? "#FFF")!)).font(Font.title)
                Spacer()
                ColorPicker("Change color", selection: $tagColor, supportsOpacity: false).labelsHidden()
//                Label {
//                    Text("color")
//                } icon: {
//                Image(systemName: "circle.fill").foregroundColor(Color(UIColor(hex: course.tagColor)!))
//                }.labelStyle(IconOnlyLabelStyle())
            }
//                TextField("Schedule", text: $course.schedule)
        }
    }
    }

