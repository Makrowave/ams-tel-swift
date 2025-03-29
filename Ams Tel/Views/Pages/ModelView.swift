//
//  ModelView.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import SwiftUI

struct ModelView: View {
    var model: BikeModelDto
    var body: some View {
        VStack {
            TextDisplay(title: "Model", text: model.modelName)
                .padding(.bottom)
            TextDisplay(title: "Kod EAN", text: model.eanCode ?? "")
                .padding(.bottom)
            TextDisplay(title: "Kod Producenta", text: model.productCode ?? "")
                .padding(.bottom)
            TextDisplay(title: "Typ Ramy", text: model.isWoman ? "Damska" : "Męska")
                .padding(.bottom)
            TextDisplay(title: "Rozmiar Ramy i Kół", text: "\(model.frameSize)x\(model.wheelSize)")
                .padding(.bottom)
            
        }.navigationTitle("Model")
            .toolbarTitleDisplayMode(.inline)
            .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        ModelView(model: bikeData[0])
    }
    
}
