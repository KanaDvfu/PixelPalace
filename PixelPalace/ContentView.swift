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
    @Query private var items: [Item]
    
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
            .navigationSplitViewColumnWidth(min: 210, ideal: 230)
            .toolbar {
                ToolbarItem {
                    AddItemB(modelContext: modelContext)
                }
                ToolbarItem {
                    Button(action: deleteAllItemsF) {
                        Label("Delete All Items", systemImage: "bolt.trianglebadge.exclamationmark.fill")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    private func deleteAllItemsF() {
        withAnimation {
            for item in items {
                modelContext.delete(item)
            }
        }
    }
}
