//
//  FilterViewModel.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import SwiftUI

class FilterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var manufacturer: ListItem?
    @Published var categoryId: ListItem?
    @Published var colorId: ColorListItem?
    @Published var priceMin: Double?
    
}
