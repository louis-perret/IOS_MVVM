//
//  MainView.swift
//  View
//
//  Created by etudiant on 27/05/2023.
//

import SwiftUI
import ViewModel

// Home Page
struct HomeView: View {
    
    @ObservedObject var odin: OdinVM
    @Environment(\.scenePhase) private var scenePhase // Savoir dans quel état l'application est
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        BlocsView(odin: odin).padding(10)
                    }.background(Color(ColorAssets.BACKGROUNDCOLOR)).cornerRadius(20).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    Divider()
                    
                    HStack {
                        UEsView(odin: odin).padding(10)
                    }.background(Color(ColorAssets.BACKGROUNDCOLOR)).cornerRadius(20).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
            }.navigationTitle("Calculette")
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive { saveAction() } // on sauvegarde les données si l'application est arrêtée
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(odin: OdinVM(withOdin: Stub.Odin), saveAction: {})
    }
}
