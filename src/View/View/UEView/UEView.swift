//
//  ContentView.swift
//  View
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import Modele

struct UEView: View {
    
    @ObservedObject var ue: UEVM
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text(ue.model.name).font(.title).fontWeight(.bold)
                    Spacer()
                }.padding(10)
                
                HStack {
                    Spacer()
                    UEDetailView(ue: ue).frame(width: geometry.size.width * 0.85)
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
                
            }.navigationBarTitleDisplayMode(.inline)
            
            .padding()
        }.toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button(action: {ue.onEditing()}) {
                    Label("Edit", systemImage: "square.and.pencil")
                }.foregroundColor(Color(ColorAssets.TEXTCOLOR))
            }
        }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UEView(ue: UEVM(withUE: Stub.Odin.ues[0], andId: UUID()))
    }
}
