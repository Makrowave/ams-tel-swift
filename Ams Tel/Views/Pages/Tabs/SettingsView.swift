//
//  SettingsView.swift
//  Ams Tel
//
//  Created by makrowave on 27/03/2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var userSettings = UserSettings.GetUserSettings()
    var body: some View {
        NavigationView {
            VStack {
                NavSelectionButton(
                    text: userSettings.defaultUserLocation?.value,
                    title: "Miejsce",
                    icon: "building.fill",
                    placeholder: "Status",
                    hasBorder: true,
                    destination: AnyView(
                        SelectionPage<ListItem, UserSettings>(
                            viewModel: userSettings,
                            options: samplePlaces,
                            keyPath: \.defaultUserLocation)
                    )
                )
                NavSelectionButton(
                    text: userSettings.serverURL,
                    title: "Adres serwera",
                    icon: "globe",
                    placeholder: "https://bikes.com",
                    hasBorder: true,
                    destination: AnyView(
                        TextFieldPage<String, UserSettings>(
                            viewModel: userSettings,
                            keyPath: \.serverURL,
                            title: "Adres serwera",
                            placeholder: "https://bikes.com"
                        )
                    )
                )
                Button(action: {}) {
                    Text("Wyloguj").font(.headline).foregroundColor(.red).frame(height: 40)
                }
            }
            .navigationTitle("Ustawienia")
            .padding(.horizontal)
        }
    }
}

#Preview {
    SettingsView()
}
