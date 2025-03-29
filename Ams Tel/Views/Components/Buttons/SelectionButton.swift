//
//  SelectionButton.swift
//  Ams Tel
//
//  Created by makrowave on 27/03/2025.
//

import SwiftUI

struct SelectionLabel: View {
    let borderColor = Color(UIColor(named: "Border")!)
    var text: String?
    let title: String
    let icon: String
    let placeholder: String
    var hasBorder: Bool = false
    var hasChevron: Bool = true
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
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
                text == ""
                ? Text(placeholder)
                    .foregroundColor(.secondary)
                : Text("\(text == nil ? "Ładowanie..." : text!)")
                    
            }
            Spacer()
            if(hasChevron) {
                Image(systemName: "chevron.right")
            }
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

struct NavSelectionButton: View {
    let borderColor = Color(UIColor(named: "Border")!)
    var text: String?
    let title: String
    let icon: String
    let placeholder: String
    var hasBorder: Bool = false
    var destination: AnyView
    var body: some View {
        NavigationLink(destination: destination) {
            SelectionLabel(text: text, title: title, icon: icon, placeholder: placeholder, hasBorder: hasBorder)
        }
    }
}

struct SelectionButton: View {
    let borderColor = Color(UIColor(named: "Border")!)
    var text: String?
    let title: String
    let icon: String
    let placeholder: String
    var hasBorder: Bool = false
    var destination: AnyView
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            SelectionLabel(text: text, title: title, icon: icon, placeholder: placeholder, hasBorder: hasBorder)
        }
    }
}



#Preview {
    SelectionLabel(title: "Rower", icon: "bicycle", placeholder: "Tu pojawi się rower", hasBorder: false)
}
