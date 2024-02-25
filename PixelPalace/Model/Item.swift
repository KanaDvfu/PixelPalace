//
//  Item.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 22.02.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var name: String?
    var icon: String?
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
