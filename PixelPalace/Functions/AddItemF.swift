//
//  AddItem.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 22.02.2024.
//

import SwiftUI
import SwiftData

func addItemF(modelContext: ModelContext) {
    withAnimation {
        let newItem = Item(timestamp: Date())
        modelContext.insert(newItem)
    }
}
