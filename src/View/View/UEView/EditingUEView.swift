//
//  EditingView.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import ViewModel
import Modele

// Vue pour l'édition d'une UE
struct EditingUEView: View {
    
    @ObservedObject var ue: UEVM
    
    var body: some View {
        VStack{
            DetailUEView(ue: ue)
        }
        .padding()
    }
}

struct EditingView_Previews: PreviewProvider {
    static var previews: some View {
        EditingUEView(ue: UEVM(withUE: Stub.Odin.ues[0]))
    }
}
