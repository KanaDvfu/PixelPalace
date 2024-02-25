//
//  ReiconOneF.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 25.02.2024.
//

import SwiftUI

/// Sets [item] icon to [icon]
func reiconOneF(item: Item, icon: String) {
    withAnimation {
        item.icon = icon
    }
}
