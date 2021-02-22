//
//  AddClassView.swift
//  Homeworkr IV (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct AddClassView: View {
            @Environment(\.managedObjectContext) var viewContext

            @State var title = ""
            @State var schedule = Schedule()
            @State var day = ""
            @State private var tagColor = Color(red: 0.8, green: 0.1, blue: 0.5)

            @Binding var isPresented: Bool

            var body: some View {
                NavigationView{
                    Form {
                        Section {
                            TextField("Title", text: $title)
                            TextField("Schedule", text: $day)
                            ColorPicker("Tag color", selection: $tagColor, supportsOpacity: false)
                        }

                    }
                }
                        .navigationBarTitle("New Class")
                        .navigationBarItems(trailing: Button("add") {
                            addClass(title: title, schedule: schedule, tagColor: UIColor(tagColor).toHex(alpha: false)!, in: viewContext)
                            self.isPresented.toggle()
                        })
            }

            private func addItem(title: String, schedule: Schedule, tagColor: Color) {
                withAnimation {
                    let newClass = Course(context: viewContext)
                    let uiColor = UIColor(tagColor)
                    newClass.title = title
                    newClass.schedule = schedule
                    newClass.tagColor = uiColor.toHex(alpha: false)!

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
