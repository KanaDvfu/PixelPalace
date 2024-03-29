//
//  ToolbarContentUI.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 24.02.2024.
//

import SwiftUI

/// ToolbarGroup which contains buttons. Needs access to [items] for deleteAllItems button.
struct ToolbarContentUI: ToolbarContent {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.undoManager) var undoManager
    
    var items : [Item]
    
    @Binding var doDeleteAllAlertS : Bool
    @Binding var doUndoAlertS : Bool
    
    var body: some ToolbarContent {
        ToolbarItemGroup {
            Button(action: addOne) {
                Label("Add Item", systemImage: "plus")
            }
            
            Button(action: toggleDoUndoAlert) {
                Label("Undo", systemImage: "arrow.uturn.left")
            }
            .alert("Undo Last Change?",
                isPresented: $doUndoAlertS
            ) {
                Button(role: .destructive, action: undo) {
                    Text("Undo")
                }
                Button(role: .cancel, action: {}) {
                    Text("Cancel")
                }
            } message: {
                Text("Undo may work not as expected. It may cause an error. Use it on your own risk.")
            }
            
            Button(action: toggleDoDeleteAllAlert) {
                Label("Delete All", systemImage: "bolt.trianglebadge.exclamationmark.fill")
            }
            .alert("Delete All?",
                isPresented: $doDeleteAllAlertS
            ) {
                Button(role: .destructive, action: deleteAll) {
                    Text("Delete All")
                }
                Button(role: .cancel, action: {}) {
                    Text("Cancel")
                }
            } message: {
                Text("Are you sure you want to delete all?")
            }
        }
    }
}

extension ToolbarContentUI {
    private func addOne() {
        addOneF(modelContext: modelContext)
    }
    
    private func toggleDoUndoAlert() {
        doUndoAlertS.toggle()
    }
    
    private func undo() {
        undoF(undoManager: undoManager)
    }
    
    private func toggleDoDeleteAllAlert() {
        doDeleteAllAlertS.toggle()
    }
    
    private func deleteAll() {
        deleteAllF(modelContext: modelContext, items: items)
    }
}
