//
//  FilterTaskView.swift
//  Homeworkr (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import SwiftUI

struct FilterTaskView: View {
    @Binding var isPresented: Bool
    @Binding var sortBy: Int
    @Binding var groupBy: Int
    @Binding var isGrouped: Bool
    @Binding var showCompleted: Bool
    
    var sorted = ["Priority", "Due Date", "Start Date"]
    var grouped = ["Type", "Class"]
    

    var body: some View {
        Form {
//            Picker("Sort by", selection: $sortBy) {
//                ForEach(0..<sorted.count) {
//                    Text(sorted[$0]).tag(sorted[$0])
//                }
//            }.pickerStyle(SegmentedPickerStyle())
            Toggle("Group by", isOn: $isGrouped).toggleStyle(SwitchToggleStyle(tint: .accentColor))
            Toggle("Display completed", isOn: $showCompleted).toggleStyle(SwitchToggleStyle(tint: .accentColor))
//            if (isGrouped) {
//                Picker("Group by", selection: $groupBy) {
//                    ForEach(0..<grouped.count) {
//                        Text(grouped[$0]).tag(grouped[$0])
//                    }
//                }.pickerStyle(SegmentedPickerStyle())
//            }
        }
    }
}

//struct FilterTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterTaskView()
//    }
//}
