//
//  BlocsView.swift
//  View
//
//  Created by etudiant on 27/05/2023.
//

import SwiftUI
import Modele

struct BlocsView: View {
    
    @ObservedObject var odin: OdinVM
    
    var body: some View {
        VStack {
            HStack {
                Label("Blocs", systemImage: "doc.on.doc.fill").font(.title)
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 2, trailing: 10))
            HStack {
                Text("Vous devez avoir la moyenne à chacun de ces blocs pour avoir votre diplôme.").font(.title3)
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 2, trailing: 10))
           
            ForEach(odin.blocs) { bloc in
                BlocCell(blocVM: bloc).padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            }
        }
    }
}

struct BlocsView_Previews: PreviewProvider {
    static var previews: some View {
        BlocsView(odin: OdinVM(withOdin: Stub.Odin))
    }
}
