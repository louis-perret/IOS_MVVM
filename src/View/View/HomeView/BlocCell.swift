//
//  BlocView.swift
//  View
//
//  Created by etudiant on 27/05/2023.
//

import SwiftUI
import ViewModel
import Modele

// Gère l'affichage d'un Bloc
struct BlocCell: View {
    
    @ObservedObject var blocVM: BlocVM
    var body: some View {
        HStack {
            Label(blocVM.name, systemImage: "doc.on.doc.fill").font(.title3)
            Spacer()
            Text(String(format:"%.2f", blocVM.moyenne))
            Label("", systemImage: "graduationcap.circle.fill")
        }
    }
}

struct BlocView_Previews: PreviewProvider {
    static var previews: some View {
        BlocCell(blocVM: BlocVM(withBloc: Stub.Odin.blocs[0]))
    }
}
