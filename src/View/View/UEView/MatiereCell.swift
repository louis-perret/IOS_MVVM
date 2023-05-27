//
//  MatiereCell.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import Modele

struct MatiereCell: View {
    
    private static let ICONOPENEDLOCK: String = "lock.open"
    private static let ICONCLOSEDLOCK: String = "lock"
    
    @ObservedObject var matiere: MatiereVM
    @State var isEdited: Bool
    @State var icon: String = MatiereCell.ICONOPENEDLOCK
    var body: some View {
        HStack {
            Button{setIsEditing()} label: {
                Label("", systemImage: icon).foregroundColor(Color(ColorAssets.ICONCOLOR))
            }
            DetailView(title: matiere.model.name, moyenne: matiere.moyenne, coef: matiere.model.coef)
        }.padding()
    }
    
    init(matiere: MatiereVM, isEdited: Bool) {
        self.matiere = matiere
        self.isEdited = isEdited
    }
    
    private func setIsEditing() {
        if isEdited {
            isEdited = false
            icon = MatiereCell.ICONCLOSEDLOCK
        }
        else {
            isEdited = true
            icon = MatiereCell.ICONOPENEDLOCK
        }
    }
    
    
}

struct MatiereCell_Previews: PreviewProvider {
    static var previews: some View {
        MatiereCell(matiere: MatiereVM(withMatiere: Stub.Odin.ues[0].matieres[0]), isEdited: false)
    }
}

