//
//  UEsView.swift
//  View
//
//  Created by etudiant on 27/05/2023.
//

import SwiftUI
import ViewModel
import Modele

// Affiche la liste des UES
struct UEsView: View {
    
    @ObservedObject var odin: OdinVM
    
    var body: some View {
        
        VStack {
            HStack {
                Label("UEs", systemImage: "doc.fill").font(.title)
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 2, trailing: 10))
            HStack {
                Text("Détail des UEs").font(.title3)
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 2, trailing: 10))
            
            ForEach(odin.ues) { ue in
                NavigationLink {
                    UEView(ue: ue)
                } label: {
                    UECell(ue: ue).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
            }
        }
    }
}

struct UEsView_Previews: PreviewProvider {
    static var previews: some View {
        UEsView(odin: OdinVM(withOdin: Stub.Odin))
    }
}
