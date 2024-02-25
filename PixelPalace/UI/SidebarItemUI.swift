//
//  SidebarItemUI.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 25.02.2024.
//

import SwiftUI

/// Contains Label (icon) and a TextField (name) of an [item]
struct SidebarItemUI: View {
    let item: Item
    
    @State private var itemNameS: String
    @FocusState private var itemNameIsFocused: Bool
    
    init(item: Item) {
        self.item = item
        self.itemNameS = item.name ?? ""
        self.itemNameIsFocused = false
    }
    
    var body: some View {
        HStack {
            Label("Image", systemImage: item.icon ?? "folder")
                .labelStyle(.iconOnly)
                .contextMenu {
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

            TextField(
                item.name ?? "No name",
                text: $itemNameS)
            .focused($itemNameIsFocused)
            .onSubmit {
                renameOne()
            }
        }
    }
}

extension SidebarItemUI {
    private func renameOne() {
        renameOneF(item: item, text: itemNameS)
    }
    
    private func reiconOne(icon: String) {
        reiconOneF(item: item, icon: icon)
    }
}
