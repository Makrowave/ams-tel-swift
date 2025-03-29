//
//  SimpleModels.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import Foundation

struct ManufacturerDto: Codable {
    var manufacturerId: Int
    var manufacturerName: String
}

struct CategoryDto: Codable {
    var categoryId: Int
    var CategoryName: String
}

struct ColorDto: Codable {
    var colorId: Int
    var colorName: String
    var hexCode: String
}

struct StatusDto: Codable {
    var statusId: Int
    var statusName: String
    var hexCode: String
}

struct PlaceDto: Codable {
    var placeId: Int
    var placeName: String
}

protocol DataItem: Identifiable & Equatable {
    var id: Int {get set}
    var value: String {get set}
}

struct ListItem: DataItem {
    var id: Int
    var value: String
}

protocol ColorDataItem: Identifiable & Equatable {
    var id: Int {get set}
    var value: String {get set}
    var hexCode: String {get set}
}

struct ColorListItem {
    var id: Int
    var value: String
    var hexCode: String
}

struct BikeModelDto: Codable {
    var modelId: Int
    var productCode: String?
    var eanCode: String?
    var modelName: String
    var frameSize: Int16
    var wheelSize: Int16
    var manufacturerId: Int16
    var price: Int
    var isWoman: Bool
    var isElectric: Bool
    var bikeCount: Int
    var primaryColor: String?
    var secondaryColor: String?
    var categoryId: Int16
    var colorId: Int16?
    var link: String?
    var favorite: Bool
    var placeBikeCount: [PlaceBikeCountDto]
}

struct PlaceBikeCountDto: Codable {
    var placeId: Int
    var count: Int
    var isAvailable: Bool
}
