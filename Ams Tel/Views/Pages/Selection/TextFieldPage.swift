//
//  TextFieldPage.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import SwiftUI

struct TextFieldPage<T, V: ObservableObject>: View {
    @ObservedObject var viewModel: V
    var keyPath: ReferenceWritableKeyPath<V, String>
    var title: String
    var placeholder: String
    var body: some View {
        HStack {
            TextField(placeholder, text: Binding(
                get: { viewModel[keyPath: keyPath] },
                set: { viewModel[keyPath: keyPath] = $0 }
            )).padding(10)
        }.navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .overlay(content: {RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 1)})
            .padding(.horizontal)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    NavigationStack {
        TextFieldPage<String, UserSettings>(viewModel: UserSettings.GetUserSettings(), keyPath: \.serverURL, title: "Adres serwera", placeholder: "https://bikes.com")
    }
}
