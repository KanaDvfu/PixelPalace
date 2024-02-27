//
//  ReiconOneF.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 25.02.2024.
//

import SwiftUI
import SwiftData

/// Sets [item] icon to [icon]
func reiconOneF(modelContext: ModelContext, item: Item, icon: String) {
    withAnimation {
        item.icon = icon
        try? modelContext.save()
    }
}
