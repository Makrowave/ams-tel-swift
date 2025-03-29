//
//  BikeTable.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import SwiftUI

let bikeData: [BikeModelDto] = [
    BikeModelDto(
        modelId: 34,
        productCode: "KREK7Z28X19U008526",
        eanCode: nil,
        modelName: "KR Esker 7.0 U 28 S per_bra_bra p",
        frameSize: 19,
        wheelSize: 28,
        manufacturerId: 1,
        price: 9999,
        isWoman: false,
        isElectric: false,
        bikeCount: 0,
        primaryColor: "#FFFFFF",
        secondaryColor: "#000000",
        categoryId: 2,
        colorId: nil,
        link: nil,
        favorite: false,
        placeBikeCount: []
    ),
    BikeModelDto(
        modelId: 35,
        productCode: "KREK7Z28X20U008527",
        eanCode: nil,
        modelName: "KR Esker 7.0 U 28 M per_bra_bra p",
        frameSize: 20,
        wheelSize: 28,
        manufacturerId: 1,
        price: 9999,
        isWoman: false,
        isElectric: false,
        bikeCount: 0,
        primaryColor: nil,
        secondaryColor: nil,
        categoryId: 2,
        colorId: nil,
        link: nil,
        favorite: false,
        placeBikeCount: []
    ),
    BikeModelDto(
        modelId: 36,
        productCode: "KREK7Z28X20M006571",
        eanCode: nil,
        modelName: "KR Esker 7.0 M 28 M fio_cza p",
        frameSize: 20,
        wheelSize: 28,
        manufacturerId: 1,
        price: 9999,
        isWoman: false,
        isElectric: false,
        bikeCount: 0,
        primaryColor: nil,
        secondaryColor: nil,
        categoryId: 2,
        colorId: nil,
        link: nil,
        favorite: false,
        placeBikeCount: []
    ),
    BikeModelDto(
        modelId: 37,
        productCode: "KRRR1Z28X19M007142",
        eanCode: nil,
        modelName: "KR Esker RS 1.0 M 28 M gra_cza p",
        frameSize: 19,
        wheelSize: 28,
        manufacturerId: 1,
        price: 12999,
        isWoman: false,
        isElectric: false,
        bikeCount: 0,
        primaryColor: nil,
        secondaryColor: nil,
        categoryId: 2,
        colorId: nil,
        link: nil,
        favorite: false,
        placeBikeCount: []
    ),
    BikeModelDto(
        modelId: 38,
        productCode: "KRRR1Z28X20M006686",
        eanCode: nil,
        modelName: "KR Esker RS 1.0 M 28 L sza_bra p",
        frameSize: 20,
        wheelSize: 28,
        manufacturerId: 1,
        price: 12999,
        isWoman: false,
        isElectric: false,
        bikeCount: 0,
        primaryColor: nil,
        secondaryColor: nil,
        categoryId: 2,
        colorId: nil,
        link: nil,
        favorite: false,
        placeBikeCount: []
    ),
    BikeModelDto(
        modelId: 39,
        productCode: "KRRR2Z28X20M006690",
        eanCode: nil,
        modelName: "KR Esker RS 2.0 M 28 L sza_zie p",
        frameSize: 20,
        wheelSize: 28,
        manufacturerId: 1,
        price: 14999,
        isWoman: false,
        isElectric: false,
        bikeCount: 0,
        primaryColor: nil,
        secondaryColor: nil,
        categoryId: 2,
        colorId: nil,
        link: nil,
        favorite: false,
        placeBikeCount: []
    ),
    BikeModelDto(
        modelId: 40,
        productCode: "KRRR2Z28X20M007147",
        eanCode: nil,
        modelName: "KR Esker RS 2.0 M 28 L nie_cza p",
        frameSize: 20,
        wheelSize: 28,
        manufacturerId: 1,
        price: 14999,
        isWoman: false,
        isElectric: false,
        bikeCount: 0,
        primaryColor: nil,
        secondaryColor: nil,
        categoryId: 2,
        colorId: nil,
        link: nil,
        favorite: false,
        placeBikeCount: []
    ),
    BikeModelDto(
        modelId: 41,
        productCode: "KREV1Z28X17W004203",
        eanCode: nil,
        modelName: "KR Evado 1.0 D 28 M grf_mal m",
        frameSize: 17,
        wheelSize: 28,
        manufacturerId: 1,
        price: 1699,
        isWoman: true,
        isElectric: false,
        bikeCount: 0,
        primaryColor: nil,
        secondaryColor: nil,
        categoryId: 4,
        colorId: nil,
        link: nil,
        favorite: false,
        placeBikeCount: []
    ),
    BikeModelDto(
        modelId: 42,
        productCode: "KREV1Z28X19W004199",
        eanCode: nil,
        modelName: "KR Evado 1.0 D 28 L bia_tur p",
        frameSize: 19,
        wheelSize: 28,
        manufacturerId: 1,
        price: 1699,
        isWoman: true,
        isElectric: false,
        bikeCount: 0,
        primaryColor: nil,
        secondaryColor: nil,
        categoryId: 4,
        colorId: nil,
        link: nil,
        favorite: false,
        placeBikeCount: []
    ),
    BikeModelDto(
        modelId: 43,
        productCode: "KREV1Z28X19M200003",
        eanCode: nil,
        modelName: "KR Evado 1.0 M 28 M grf_cze m",
        frameSize: 19,
        wheelSize: 28,
        manufacturerId: 1,
        price: 1699,
        isWoman: false,
        isElectric: false,
        bikeCount: 0,
        primaryColor: nil,
        secondaryColor: nil,
        categoryId: 4,
        colorId: nil,
        link: nil,
        favorite: false,
        placeBikeCount: []
    )
]


struct ModelTableView: View {
    var body: some View {
        List {
            ForEach(bikeData, id: \.modelId) {
                model in
                NavigationLink(destination: {}) {
                    ModelRecordView(model: model)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ModelTableView()
    }
}
