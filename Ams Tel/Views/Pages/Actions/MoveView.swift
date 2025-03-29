//
//  MoveView.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import SwiftUI

struct MoveView: View {
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
                    title: "Z",
                    icon: "iphone.and.arrow.right.outward",
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
                    text: cameraViewModel.userPlace?.value,
                    title: "Do",
                    icon: "iphone.and.arrow.right.outward",
                    placeholder: "Miejsce",
                    hasBorder: true,
                    destination: AnyView(
                        SelectionPage<ListItem, CameraViewModel>(
                            viewModel: cameraViewModel,
                            options: samplePlaces,
                            keyPath: \.destinationPlace)
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
        MoveView()
    }
}
