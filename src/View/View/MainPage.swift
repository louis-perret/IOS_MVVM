//
//  MainPage.swift
//  IOS_Podcast
//
//  Created by etudiant on 17/05/2023.
//

import SwiftUI
import Modele

/// The main page of the app
struct MainPage: View {
    
    @ObservedObject var odin: OdinVM
    
    var body: some View {
        HomeView(odin: odin)
        
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(odin: OdinVM(withOdin: Stub.Odin))
    }
}
