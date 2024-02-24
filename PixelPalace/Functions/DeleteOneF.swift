//
//  DeleteOneF.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 24.02.2024.
//

import SwiftUI
import SwiftData

/// Deletes [Item] from [Model]
func deleteOneF(modelContext: ModelContext, item: Item) {
    withAnimation {
        modelContext.delete(item)
    }
}
