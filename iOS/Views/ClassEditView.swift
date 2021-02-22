//
//  ClassEditView.swift
//  Homeworkr IV (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct ClassEditView: View {
    @ObservedObject var course: Course
    @State var tagColor: Color
    @State var isPresented: Bool
    
//    @State private var courseDraft: Course
    
    init(course: ObservedObject<Course>) {
        _course = ObservedObject(wrappedValue: course.wrappedValue)
//        _tagColor = State(initialValue: Color(UIColor(hex: course.tagColor.wrappedValue!)!))
        _tagColor = State(initialValue: Color(UIColor(hex: course.wrappedValue.tagColor!)!))
        _isPresented = State(initialValue: false)
    }

    var body: some View {
        Form {
            HStack {
                TextField("Title", text: $course.title)
                Spacer()
                ColorPicker("Change color", selection: $tagColor, supportsOpacity: false).labelsHidden()
//                TextField("Schedule", text: $course.schedule.)
        }
    }
    }
}

