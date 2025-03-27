//
//  SelectionButton.swift
//  Ams Tel
//
//  Created by makrowave on 27/03/2025.
//

import SwiftUI

struct SelectionButton: View {
    let borderColor = Color(UIColor(named: "Border")!)
    @State var value: Int = 0
    @State var text: String = "Sample text"
    let title: String
    let icon: String
    var hasBorder: Bool = false
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Image(systemName: icon)
                    Text(title)
                }
                .padding(.bottom, 4)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(borderColor),
                    alignment: .bottom
                )
                Text(text)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.bottom, 10)
        .overlay(
            hasBorder
            ? Rectangle()
                .frame(height: 1)
                .foregroundColor(borderColor)
            : nil,
            alignment: .bottom
        )
        
    }
}

#Preview {
    SelectionButton(title: "Rower", icon: "bicycle", hasBorder: false)
}
