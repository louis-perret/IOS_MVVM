//
//  UECell.swift
//  View
//
//  Created by etudiant on 27/05/2023.
//

import SwiftUI
import Modele

struct UECell: View {
    
    @ObservedObject var ue: UEVM
    
    var body: some View {
        HStack {
            DetailView(title: ue.model.name, moyenne: ue.moyenne, coef:   ue.model.coef)
            Label("", systemImage: "square.and.pencil").font(.title2).foregroundColor(Color(ColorAssets.TEXTCOLOR))
        }
    }
}

struct UECell_Previews: PreviewProvider {
    static var previews: some View {
        UECell(ue: UEVM(withUE: Stub.Odin.ues[0], andId: UUID()))
    }
}