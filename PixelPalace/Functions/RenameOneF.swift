//
//  RenameOneF.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 25.02.2024.
//

import SwiftUI

/// Sets [item] name to [text]
func renameOneF(item: Item, text: String) {
    withAnimation {
        item.name = text
    }
}
