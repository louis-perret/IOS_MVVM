//
//  EditingView.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import Modele

struct EditingUEView: View {
    
    @ObservedObject var ue: UEVM
    
    var body: some View {
        NavigationStack {
            VStack{
                DetailUEView(ue: ue)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {ue.onEdited()}) {
                        Label("", systemImage: "checkmark.circle.fill")
                    }.foregroundColor(Color(ColorAssets.ICONCOLOR))
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {ue.onEdited(isCancelled: false)}) {
                        Label("", systemImage: "arrow.uturn.backward.circle.fill")
                    }.foregroundColor(Color(ColorAssets.ICONCOLOR))
                }
            }
        }
    }
}

struct EditingView_Previews: PreviewProvider {
    static var previews: some View {
        EditingUEView(ue: UEVM(withUE: Stub.Odin.ues[0], andId: UUID()))
    }
}
