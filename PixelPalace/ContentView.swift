//
//  ContentView.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 22.02.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.undoManager) var undoManager
    @Query private var items: [Item]
    
    @State private var doDeleteAllAlert = false
    
    private func deleteAll() {
        deleteAllF(modelContext: modelContext, items: items)
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 250, ideal: 260)
            .toolbar {
                ToolbarContentUI(items: items, doDeleteAllAlert: $doDeleteAllAlert)
            }
        } detail: {
            Text("Select an item")
        }
        
        // on DeleteAll
        .alert("Delete All?",
            isPresented: $doDeleteAllAlert
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
