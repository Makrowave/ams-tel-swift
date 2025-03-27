//
//  ActionButton.swift
//  Ams Tel
//
//  Created by makrowave on 27/03/2025.
//

import SwiftUI

struct ActionButton: View {
    let borderColor = Color(UIColor(named: "Border")!)
    let destination: AnyView
    let img: String
    let text: String
    let color: Color
    var hasBorder: Bool = false
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color)
                        .frame(width: 40, height: 40)
                    Image(systemName: img)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .padding(8)
                        
                }
                .frame(width: 40, height: 40)
                Text(text)
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(.top, 10)
            .overlay(
                hasBorder
                ? Rectangle()
                    .frame(height: 1)
                    .foregroundColor(borderColor)
                : nil,
                alignment: .top
            )
            
        }
    }
}

#Preview {
    ActionButton(
        destination: AnyView(AddView()),
        img: "arrow.right",
        text: "Przenieś rower",
        color: .blue,
        hasBorder: true
    )
}
