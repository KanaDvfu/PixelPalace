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
    @Query(sort: \Item.icon, order: .reverse) private var items: [Item]
    @State private var doDeleteAllAlertS = false
    @State private var doUndoAlertS = false
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        SidebarItemUI(item: item)
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 250, ideal: 260)
            .toolbar {
                ToolbarContentUI(items: items, doDeleteAllAlertS: $doDeleteAllAlertS, doUndoAlertS: $doUndoAlertS)
            }
        } detail: {
            Text("Select an item")
        }
    }
}
