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
            TaskView()
                    .tabItem {
                        Image(systemName: "scroll.fill")
                    }
            ClassView()
                    .tabItem {
                        Image(systemName: "calendar")

                    }
        }
    }
}
