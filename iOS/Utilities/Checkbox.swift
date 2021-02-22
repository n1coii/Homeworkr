//
//  Checkbox.swift
//  Homeworkr (iOS)
//
//  Created by Nicolas Legros on 2021-02-22.
//

import Foundation
import SwiftUI


struct CheckboxStyle: ToggleStyle {
    var color: Color
    init(tint: Color) {
        color = tint
    }
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(color)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
