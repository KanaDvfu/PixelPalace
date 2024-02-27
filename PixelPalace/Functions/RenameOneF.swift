//
//  RenameOneF.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 25.02.2024.
//

import SwiftUI
import SwiftData

/// Sets [item] name to [text]
func renameOneF(modelContext: ModelContext, item: Item, text: String) {
    withAnimation {
        item.name = text
        try? modelContext.save()
    }
}
