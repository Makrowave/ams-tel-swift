//
//  HomeView.swift
//  Ams Tel
//
//  Created by makrowave on 27/03/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .frame(width: 20)
                        Text("Username")
                    }
                    HStack {
                        Image(systemName: "building.fill")
                            .frame(width: 20)
                        Text("Sklep 1")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 20)
                VStack {
                    ActionButton(destination: AnyView(AddView()), img: "plus", text: "Dodaj rower", color: .blue, hasBorder: true)
                    ActionButton(destination: AnyView(AddView()), img: "banknote.fill", text: "Sprzedaj rower", color: .green, hasBorder: true)
                    ActionButton(destination: AnyView(AddView()), img: "arrow.right", text: "Przenieś rower", color: .orange, hasBorder: true)
                    ActionButton(destination: AnyView(AddView()), img: "shippingbox", text: "Złóż rower", color: .yellow, hasBorder: true)
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Strona główna")
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }

}

#Preview {
    HomeView()
}
