//
//  ContentView.swift
//  Shared
//
//  Created by Nicolas Legros on 2021-02-14.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        TabView {
            AllTasksView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                    }
            ClassView()
                    .tabItem {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")

                    }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
