//
//  TextDisplay.swift
//  Ams Tel
//
//  Created by makrowave on 29/03/2025.
//

import SwiftUI

struct TextDisplay: View {
    var title: String
    var text: String
    var placeholder: String = "Brak"
    let borderColor = Color(UIColor(named: "Border")!)
    let textColor = Color(UIColor(named: "Text")!)
    var body: some View {
        VStack {
            //Login
            Text(title).multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(borderColor),
                    alignment: .bottom
                )
                .padding(.top, 10)
                .padding(.horizontal, 15)
                .font(.headline)
            Text(text == "" ? placeholder : text)
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(text == "" ? .secondary : textColor)
            
        }
        .border(borderColor)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(borderColor, lineWidth: 1)
        )
    }
}

#Preview {
    TextDisplay(title: "Tytuł", text: "", placeholder: "Brak")
}
