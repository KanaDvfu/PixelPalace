//
//  SidebarItemUI.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 25.02.2024.
//

import SwiftUI

/// Contains Label (icon) and a TextField (name) of an [item]
struct SidebarItemUI: View {
    @Environment(\.modelContext) private var modelContext
    var item: Item
    
    @State private var itemNameS: String
    @FocusState private var itemNameIsFocused: Bool
    
    init(item: Item) {
        self.item = item
        self.itemNameS = item.name ?? ""
        self.itemNameIsFocused = false
    }
    
    var body: some View {
        HStack {
            Label("Image", systemImage: item.icon)
                .labelStyle(.iconOnly)
            TextField(
                item.name ?? "No name",
                text: $itemNameS)
            .focused($itemNameIsFocused)
            .onSubmit {
                renameOne()
            }
            .contextMenu {
                Menu("Change Icon", systemImage: item.icon) {
                    Button {
                        reiconOne(icon: "folder")
                    } label: {
                        Label("folder", systemImage: "folder").labelStyle(.iconOnly)
                    }
                    
                    Button {
                        reiconOne(icon: "folder.fill")
                    } label: {
                        Label("folder.fill", systemImage: "folder.fill").labelStyle(.iconOnly)
                    }
                }
            }
        }
    }
}

extension SidebarItemUI {
    private func renameOne() {
        renameOneF(modelContext: modelContext, item: item, text: itemNameS)
    }
    
    private func reiconOne(icon: String) {
        reiconOneF(modelContext: modelContext, item: item, icon: icon)
    }
}
