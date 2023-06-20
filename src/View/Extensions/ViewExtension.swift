//
//  ViewExtensions.swift
//  View
//
//  Created by etudiant on 11/06/2023.
//

import SwiftUI

// Extension du type View
extension View {
    
    // Permet de cacher un élément
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
