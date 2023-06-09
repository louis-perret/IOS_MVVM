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
        VStack{
            DetailUEView(ue: ue).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
        }
        .sheet(isPresented: $ue.isEditing) {
            EditingUEView(ue: ue)
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button(action: {ue.onEditing()}) {
                    Label("Edit", systemImage: "square.and.pencil")
                }.foregroundColor(Color(ColorAssets.TEXTCOLOR))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UEView(ue: UEVM(withUE: Stub.Odin.ues[0]))
    }
}
