//
//  PixelPalaceApp.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 22.02.2024.
//

import SwiftUI
import SwiftData

@main
struct PixelPalaceApp: App {
    @Environment(\.undoManager) var undoManager
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self, isUndoEnabled: true)
    }
}
