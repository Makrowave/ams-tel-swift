//
//  CameraViewModel.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import SwiftUI

class CameraViewModel: ObservableObject {
    @Published var bikeName: String = ""
    @Published var bikeCode: String = ""
    @Published var salePrice: Float?
    @Published var userPlace: ListItem? = UserSettings.GetUserSettings().defaultUserLocation
    @Published var destinationPlace: ListItem?
    @Published var bikeStatus: ListItem?
}
