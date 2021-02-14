//
//  Homeworkr_IVApp.swift
//  Shared
//
//  Created by Nicolas Legros on 2021-02-14.
//

import SwiftUI

@main
struct Homeworkr_IVApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
