//
//  TabView.swift
//  Ams Tel
//
//  Created by makrowave on 27/03/2025.
//

import SwiftUI

struct TabLayout: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Strona główna")
                }
            BikesView()
                .tabItem {
                    Image(systemName: "bicycle")
                    Text("Rowery")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Ustawienia")
                }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    TabLayout()
}
