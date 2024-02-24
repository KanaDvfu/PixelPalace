//
//  ToolbarContentUI.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 24.02.2024.
//

import SwiftUI

/// ToolbarGroup which contains buttons.
struct ToolbarContentUI: ToolbarContent {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.undoManager) var undoManager
    
    var items : [Item]
    
    @Binding var doDeleteAllAlert : Bool
    
    //
    
    private func addOne() {
        addOneF(modelContext: modelContext)
    }
    
    private func undo() {
        undoF(undoManager: undoManager)
    }
    
    private func toggleDoDeleteAllAlert() {
        doDeleteAllAlert.toggle()
    }
    
    //
    
    var body: some ToolbarContent {
        ToolbarItemGroup {
            Button(action: addOne) {
                Label("Add Item", systemImage: "plus")
            }
            Button(action: undo) {
                Label("Undo", systemImage: "arrow.uturn.left")
            }
            Button(action: toggleDoDeleteAllAlert) {
                Label("Delete All", systemImage: "bolt.trianglebadge.exclamationmark.fill")
            }
        }
    }
}
