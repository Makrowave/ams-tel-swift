//
//  ContentView.swift
//  Ams Tel
//
//  Created by makrowave on 27/03/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        NavigationStack {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
