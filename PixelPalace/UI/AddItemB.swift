//
//  AddItemB.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 22.02.2024.
//

import SwiftUI
import SwiftData

struct AddItemB: View {
    let modelContext: ModelContext
    
    private func addItem() {
        addItemF(modelContext: modelContext)
    }
    
    var body: some View {
        Button(action: addItem) {
            Label("Add Item", systemImage: "plus")
        }
    }
}
