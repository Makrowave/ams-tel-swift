//
//  AddView.swift
//  Ams Tel
//
//  Created by makrowave on 27/03/2025.
//

import SwiftUI


let samplePlaces = [
    ListItem(id: 1, value: "Sklep 1"),
    ListItem(id: 2, value: "Sklep 2"),
    ListItem(id: 3, value: "Sklep 3"),
    ListItem(id: 4, value: "Magazyn 1"),
    ListItem(id: 5, value: "Magazyn 2"),
]

let sampleStatuses = [
    ListItem(id: 1, value: "Złożony"),
    ListItem(id: 2, value: "Niezłożony"),
    ListItem(id: 4, value: "Gwarancja"),
    ListItem(id: 5, value: "Zadatek"),
    ListItem(id: 6, value: "Gaming"),
]



struct AddView: View {
    @StateObject var cameraViewModel = CameraViewModel()
    var body: some View {
            VStack {
                SelectionLabel(
                    text: cameraViewModel.bikeName,
                    title: "Rower",
                    icon: "bicycle",
                    placeholder: "Tu pojawi się rower",
                    hasBorder: true,
                    hasChevron: false
                )
                SelectionLabel(
                    text: cameraViewModel.bikeCode,
                    title: "Kod",
                    icon: "barcode",
                    placeholder: "Kod",
                    hasBorder: true
                )
                NavSelectionButton(
                    text: cameraViewModel.userPlace?.value,
                    title: "Miejsce",
                    icon: "building.fill",
                    placeholder: "Miejsce",
                    hasBorder: true,
                    destination: AnyView(
                        SelectionPage<ListItem, CameraViewModel>(
                            viewModel: cameraViewModel,
                            options: samplePlaces,
                            keyPath: \.userPlace)
                    )
                )
                NavSelectionButton(
                    text: cameraViewModel.bikeStatus?.value,
                    title: "Status",
                    icon: "info.circle.fill",
                    placeholder: "Status",
                    hasBorder: true,
                    destination: AnyView(
                        SelectionPage<ListItem, CameraViewModel>(
                            viewModel: cameraViewModel,
                            options: samplePlaces,
                            keyPath: \.bikeStatus)
                    )
                )
                Button(action: {}) {
                    Text("Dodaj")
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 44, alignment: .init(horizontal: .center, vertical: .center))
                }
            }
            .navigationTitle("Dodaj rower")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
