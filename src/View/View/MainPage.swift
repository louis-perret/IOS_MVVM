//
//  MainPage.swift
//  IOS_Podcast
//
//  Created by etudiant on 17/05/2023.
//

import SwiftUI
import ViewModel
import Modele


/// The main page of the app
struct MainPage: View {
    
    @ObservedObject var odin: OdinVM
   
    var body: some View {
        HomeView(odin: odin) {
            Task {
                do {
                    try await odin.saveData()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }.accentColor(Color(ColorAssets.PRIMARYCOLOR)).backgroundStyle(.black)
            .task {
                do {
                    try await odin.loadData()
                } catch {
                    fatalError(error.localizedDescription)
                    
                }
            }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(odin: OdinVM(withOdin: Stub.Odin))
    }
}
