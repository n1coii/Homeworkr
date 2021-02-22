//
//  GroupsTaskView.swift
//  Homeworkr (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct GroupsTaskView: View {
    @Environment(\.managedObjectContext)  var viewContext
    @FetchRequest(fetchRequest: Course.fetchRequest(.all)) var courses: FetchedResults<Course>
    
    var body: some View {
//        NavigationView {
//            VStack {
                List {
                    ForEach(courses, id:\.self) { course in
                        Section(header: ClassHeader(course: course)) {
                            GroupTasksView(course: course)
                        }
                    }
//                }
//            }
        }
    }
    
    struct ClassHeader: View {
        @ObservedObject var course: Course
        var body: some View {
            HStack {
                Text("\(course.title)").foregroundColor(.black)
                Spacer()
                Image(systemName: "circle.fill").foregroundColor(Color(UIColor(hex: course.tagColor!)!))
            }
            
        }
    }
}

