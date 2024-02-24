//
//  DeleteAllF.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 24.02.2024.
//

import SwiftUI
import SwiftData

/// Deletes all [Item] from [Model]
func deleteAllF(modelContext: ModelContext, items: [Item]) {
    withAnimation {
        for item in items {
            deleteOneF(modelContext: modelContext, item: item)
        }
    }
}
