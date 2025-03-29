//
//  BikeRecord.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import SwiftUI

struct ModelRecordView: View {
    var model: BikeModelDto
    var body: some View {
        HStack {
            if(model.primaryColor != nil && model.secondaryColor != nil)
            {
                ZStack {
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: 40, y: 0))
                        path.addLine(to: CGPoint(x: 0, y: 40))
                        path.closeSubpath()
                    }
                    .fill(Color(model.primaryColor!))
                    
                    Path { path in
                        path.move(to: CGPoint(x: 40, y: 40))
                        path.addLine(to: CGPoint(x: 40, y: 0))
                        path.addLine(to: CGPoint(x: 0, y: 40))
                        path.closeSubpath()
                    }
                    .fill(Color(model.secondaryColor!))
                }
                
                .cornerRadius(10)
                .frame(width: 40, height: 40)
            }
            else {
                Image(systemName: "nosign.app.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Text(model.modelName)
                .lineLimit(1)
                .truncationMode(.tail)
            Spacer()
            Text("\(model.frameSize)x\(model.wheelSize)")
                .padding(.trailing, 12)
            Image(systemName: "chevron.right")
        }
        
    }
}

#Preview {
    ModelRecordView(model: bikeData[0])
}
