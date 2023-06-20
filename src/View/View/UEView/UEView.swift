//
//  ContentView.swift
//  View
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import ViewModel
import Modele

// Détail de l'UE
struct UEView: View {
    
    @ObservedObject var ue: UEVM
    
    var body: some View {
        VStack{
            DetailUEView(ue: ue).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
        }
        .sheet(isPresented: $ue.isEditing) {
            NavigationStack {
                EditingUEView(ue: ue.editedCopy!)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {ue.onEdited()}) {
                                Label("", systemImage: "checkmark.circle.fill")
                            }.foregroundColor(Color(ColorAssets.PRIMARYCOLOR))
                        }
                        ToolbarItem(placement: .navigationBarLeading){
                            Button(action: {ue.onEdited(isCancelled: true)}) {
                                Label("", systemImage: "arrow.uturn.backward.circle.fill")
                            }.foregroundColor(Color(ColorAssets.PRIMARYCOLOR))
                        }
                    }
            }.navigationTitle(ue.name)
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button(action: {ue.onEditing()}) {
                    Label("Edit", systemImage: "square.and.pencil")
                }.foregroundColor(Color(ColorAssets.PRIMARYCOLOR))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UEView(ue: UEVM(withUE: Stub.Odin.ues[0]))
    }
}
