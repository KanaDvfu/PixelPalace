//
//  UndoF.swift
//  PixelPalace
//
//  Created by Евгений Канашкин on 24.02.2024.
//

import SwiftUI

/// Undo last changes to model via [UndoManager].
func undoF(undoManager: UndoManager?) {
    withAnimation {
        undoManager?.undo()
    }
}
