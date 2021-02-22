//
//  ClassView.swift
//  Homeworkr IV (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct ClassView: View {

    @Environment(\.managedObjectContext)  var viewContext
    @FetchRequest(fetchRequest: Course.fetchRequest(.all)) var classes: FetchedResults<Course>

    

    @State private var action: Int? = 0
//    @ObservedObject private var course: Course
    @State private var showingSheetTask: Bool = false
    @State private var showingSheetClass: Bool = false


    var body: some View {
        NavigationView {
            List {
                ForEach(classes, id: \.self) { course in
                    NavigationLink(destination: ClassInfoView(
                        course: course
                    )) {
                        HStack {
                            Text((course.title))
                            Spacer()
                            Image(systemName: "circle.fill").foregroundColor(Color(UIColor(hex: course.tagColor!)!))
                        }}

                }
                        .onDelete(perform: deleteItems)
            }
                    .navigationBarItems(trailing:
                    Button(action: {
                        self.showingSheetClass = true
                    }) {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $showingSheetClass) {
                        NavigationView {
                            AddClassView(isPresented: $showingSheetClass)
                        }
                    })
        }
    }


    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                classes[$0]
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
