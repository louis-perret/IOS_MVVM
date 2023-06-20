//
//  DetailUE.swift
//  View
//
//  Created by etudiant on 28/05/2023.
//

import SwiftUI
import ViewModel
import Modele


// Affiche le detail d'une UE
struct DetailUEView: View {
    
    @ObservedObject var ue: UEVM
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text(ue.name).font(.title).fontWeight(.bold)
                    Spacer()
                }.padding(10)
                
                HStack {
                    Spacer()
                    UEInfoDetailView(ue: ue).frame(width: geometry.size.width * 0.85)
                }
                
                HStack {
                    InfoView(icon: "xmark.circle.fill", text: "coefficient : \(ue.coef)")
                    Spacer()
                }.padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                HStack {
                    InfoView(icon: "note.text", text: "Détails des notes")
                    Spacer()
                }
                
                Button { ue.addMatiere() }  label: {
                    Label("Ajouter matiere", systemImage:"plus.circle.fill").foregroundColor(Color(ColorAssets.PRIMARYCOLOR))
                }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)).hidden(!ue.isEditing)
                
                ScrollView {
                    
                    ForEach(ue.matieres) { matiere in
                        HStack {
                            MatiereCell(matiere: matiere)
                            Button { ue.onDeleted(matiere) }  label: {
                                Label("", systemImage:"trash").foregroundColor(Color(ColorAssets.PRIMARYCOLOR))
                            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)).hidden(!ue.isEditing)
                            
                        }
                    }
                }
                
                /*  List(ue.matieres) { matiere in
                 MatiereCell(matiere: matiere)
                 }.listStyle(.inset)*/
                
            }
        }
    }
}

struct DetailUE_Previews: PreviewProvider {
    static var previews: some View {
        DetailUEView(ue: UEVM(withUE: Stub.Odin.ues[0]))
    }
}
