//
//  EditingView.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import Modele

struct EditingView: View {
    
    @ObservedObject var ue: UEVM
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    TextField("Name of the EU", text: $ue.model.name).font(.title).fontWeight(.bold)
                    Spacer()
                }.padding(10)
                
                HStack {
                    Spacer()
                    DetailView(title: ue.model.name, moyenne: ue.moyenne, coef:   ue.model.coef).frame(width: geometry.size.width * 0.85)
                }
                
                HStack {
                    InfoView(icon: "xmark.circle.fill", text: "coefficient : \(ue.model.coef)")
                    Spacer()
                }.padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                HStack {
                    InfoView(icon: "note.text", text: "Détails des notes")
                    Spacer()
                }
                
                ScrollView {
                    ForEach(ue.matieres) { matiere in
                        MatiereCell(matiere: matiere)
                    }
                }
                
                /*  List(ue.matieres) { matiere in
                 MatiereCell(matiere: matiere)
                 }.listStyle(.inset)*/
                
            }
        }
        .padding()
    }
}

struct EditingView_Previews: PreviewProvider {
    static var previews: some View {
        EditingView(ue: UEVM(withUE: Stub.Odin.ues[0], andId: UUID()))
    }
}
