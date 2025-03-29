//
//  ColorSelectionPage.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import SwiftUI

struct ColorSelectionPage: View {
    let data: [ColorListItem]
    @State var selection: ColorListItem = .init(id: 1, value: "Czarny", hexCode: "#000000")
    var body: some View {
        List(data, id: \.id) {
            item in HStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: item.hexCode))
                    .frame(width: 40, height: 40)
                Text(item.value)
                Spacer()
                if item.id == selection.id {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

#Preview {
    ColorSelectionPage(data: [
        ColorListItem(id: 1, value: "Czarny", hexCode: "#000000"),
        ColorListItem(id: 2, value: "Biały", hexCode: "#FFFFFF"),
        ColorListItem(id: 3, value: "Niebieski", hexCode: "#0000FF"),
        ColorListItem(id: 4, value: "Zielony", hexCode: "#00FF00"),
        ColorListItem(id: 5, value: "Czerwony", hexCode: "#FF0000"),
    ])
}
