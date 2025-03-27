//
//  Item.swift
//  Ams Tel
//
//  Created by makrowave on 27/03/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
