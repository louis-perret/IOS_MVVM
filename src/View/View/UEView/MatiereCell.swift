//
//  MatiereCell.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import Modele

struct MatiereCell: View {
    
    @ObservedObject var matiere: MatiereVM
    
    var body: some View {
        HStack {
            Button{} label: {
                Label("", systemImage: "lock").foregroundColor(Color(ColorAssets.ICONCOLOR))
            }
            DetailView(title: matiere.model.name, moyenne: matiere.moyenne, coef: matiere.model.coef)
        }.padding(10)
        
    }
}

struct MatiereCell_Previews: PreviewProvider {
    static var previews: some View {
        MatiereCell(matiere: MatiereVM(withMatiere: Stub.Odin.ues[0].matieres[0]))
    }
}

